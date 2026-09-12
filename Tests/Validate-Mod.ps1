param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$script:checks = 0
function Check($condition, [string]$message) {
    if (-not $condition) { throw $message }
    $script:checks++
}
$files = @(Get-ChildItem -LiteralPath $ModPath -Recurse -Filter '*.xml')
Check ($files.Count -eq 6) 'Expected About.xml and five definition files'
$docs = @($files | ForEach-Object { [xml](Get-Content -LiteralPath $_.FullName -Raw) })
$about = ($docs | Where-Object { $_.DocumentElement.LocalName -eq 'ModMetaData' }).ModMetaData
$url = 'https://github.com/vbardales/Rimworld-Ebbbs-Renew'
Check ($about.packageId -ceq 'nelim.ebbbsrenew') 'Wrong packageId'
Check ($about.name -ceq 'Ebbbs Renew (unofficial)') 'Missing unofficial title'
Check ($about.url -ceq $url -and $about.description.Contains($url)) 'Missing GitHub link'
Check ($about.supportedVersions.li -contains '1.6') 'Missing 1.6 support'
Check ($about.incompatibleWith.li -contains 'Coolie.Ebbbs') 'Missing upstream incompatibility'
Check ($null -eq $about.modDependencies) 'Unexpected required dependency'
$defs = @($docs | ForEach-Object { $_.SelectNodes('/Defs/*') })
$index = @{}
foreach ($def in $defs) {
    if ($def.defName) {
        $key = $def.LocalName + ':' + $def.defName
        Check (-not $index.ContainsKey($key)) "Duplicate definition: $key"
        $index[$key] = $def
    }
}
$expected = @{Ebbb=0.7; Beee=0.8; Crebbb=0.2; Drebbbd=1; Ebbberration=0.4; Ebbbomination=1; Goliebbb=1; Thrumebbb=1; Bebbbholder=0.7}
$races = @($defs | Where-Object { $_.ParentName -eq 'EbbbBase' })
Check ($races.Count -eq 9) 'Expected nine races'
Check (@($defs | Where-Object LocalName -eq 'PawnKindDef').Count -eq 9) 'Expected nine pawn kinds'
foreach ($race in $races) {
    $name = [string]$race.defName
    Check ($expected.ContainsKey($name)) "Unexpected race $name"
    $wild = $race.SelectNodes('statBases/Wildness')
    Check ($wild.Count -eq 1) "Missing or duplicate Wildness: $name"
    Check ([double]::Parse($wild[0].InnerText, [cultureinfo]::InvariantCulture) -eq $expected[$name]) "Wildness regression: $name"
    Check ($index["PawnKindDef:$name"].race -ceq $name) "Broken PawnKind race: $name"
    foreach ($entry in @{body='BodyDef'; leatherDef='ThingDef'; useMeatFrom='ThingDef'}.GetEnumerator()) {
        $node = $race.SelectSingleNode('race/' + $entry.Key)
        if ($node) {
            if ($entry.Key -eq 'body' -and $node.InnerText -eq 'QuadrupedAnimalWithHoovesAndHorn') { continue } # Core; verify in game.
            Check ($index.ContainsKey($entry.Value + ':' + $node.InnerText)) "Broken $($entry.Key): $name"
        }
    }
}
foreach ($doc in $docs) {
    Check ($doc.SelectNodes('//wildness | //race/Wildness').Count -eq 0) 'Obsolete wildness field'
    foreach ($node in $doc.SelectNodes('//texPath')) {
        $path = $node.InnerText
        if ($path -eq 'Things/Filth/Spatter') { continue } # Core texture; verify in game.
        $base = Join-Path $ModPath ('Textures/' + $path)
        if ($node.ParentNode.LocalName -in @('bodyGraphicData','li')) {
            foreach ($direction in @('south','north','east')) {
                Check (Test-Path -LiteralPath ($base + '_' + $direction + '.png')) "Missing directional texture: $path $direction"
            }
        } else {
            Check ((Test-Path -LiteralPath ($base + '.png')) -or (Test-Path -LiteralPath ($base + '_south.png')) -or (Test-Path -LiteralPath ($base + '_east.png'))) "Missing texture: $path"
        }
    }
}
$node = $index['FleshTypeDef:Ebbbish'].SelectSingleNode('damageEffecter')
Check ($null -ne $node -and $index.ContainsKey('EffecterDef:' + $node.InnerText)) 'Broken flesh damage effecter'
$baseRace = @($defs | Where-Object { $_.GetAttribute('Name') -eq 'EbbbBase' })
Check ($baseRace.Count -eq 1) 'Missing or duplicate EbbbBase'
foreach ($entry in @{fleshType='FleshTypeDef'; bloodDef='ThingDef'}.GetEnumerator()) {
    $node = $baseRace[0].SelectSingleNode('race/' + $entry.Key)
    Check ($null -ne $node -and $index.ContainsKey($entry.Value + ':' + $node.InnerText)) "Broken base reference: $($entry.Key)"
}
foreach ($node in $index['PawnKindDef:Thrumebbb'].SelectNodes('.//thing')) {
    Check ($index.ContainsKey('ThingDef:' + $node.InnerText)) 'Broken Thrumebbb product'
}
foreach ($asset in @('About/ModIcon.png','About/Preview.png')) {
    Check (Test-Path -LiteralPath (Join-Path $ModPath $asset)) "Missing asset: $asset"
}
Write-Output "PASS: $script:checks checks; $($files.Count) XML files; nine races. Static validation only; RimWorld execution still required."
