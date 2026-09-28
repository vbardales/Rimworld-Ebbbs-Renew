param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$script:checks = 0
function Check($condition, [string]$message) {
    if (-not $condition) { throw $message }
    $script:checks++
}
$files = @(Get-ChildItem -LiteralPath $ModPath -Recurse -Filter '*.xml')
Check (@($files | Where-Object { $_.FullName -notmatch '[\\/]Languages[\\/]' }).Count -eq 9) 'Expected About.xml, five definition files and three patches outside Languages'
$docs = @($files | ForEach-Object { [xml](Get-Content -LiteralPath $_.FullName -Raw) })
$about = ($docs | Where-Object { $_.DocumentElement.LocalName -eq 'ModMetaData' }).ModMetaData
$url = 'https://github.com/vbardales/Rimworld-Ebbbs-Renew'
Check ($about.packageId -ceq 'nelim.ebbbs') 'Wrong packageId'
Check ($about.name -ceq 'Ebbbs Renew (unofficial)') 'Missing unofficial title'
Check ($about.url -ceq $url -and $about.description.Contains($url)) 'Missing GitHub link'
Check ($about.supportedVersions.li -contains '1.6') 'Missing 1.6 support'
Check ($about.incompatibleWith.li -contains 'Coolie.Ebbbs') 'Missing upstream incompatibility'
Check ($null -eq $about.modDependencies) 'Unexpected required dependency'
$defs = @($docs | ForEach-Object { $_.SelectNodes('/Defs/*') })

# Native support for A Dog Said... Animal Prosthetics 2. The patch adds the species to that mod's three
# cumulative category lists, and it only takes effect if this mod loads first: that mod copies the lists
# into its real recipes in its own last patch, as they stand at that moment.
$ads2 = 'SamBucher.ADogSaidAnimalProsthetics2'
Check ($about.loadBefore.li -contains $ads2) 'Missing loadBefore for A Dog Said 2: its category lists would be copied before this mod adds to them'
Check ($about.loadAfter.li -notcontains $ads2) 'loadAfter A Dog Said 2 would make it read the lists first, and closes a cycle with loadBefore'
$patchDocs = @($docs | Where-Object { $_.DocumentElement.LocalName -eq 'Patch' })
Check ($patchDocs.Count -eq 3) 'Expected exactly three patch files: A Dog Said 2, Nocturnal Animals and Better Crossbreeding'
$patchFiles = @($files | Where-Object { $_.FullName -match '[\\/]Patches[\\/]' } | ForEach-Object Name | Sort-Object)
Check (($patchFiles -join ',') -ceq 'AnimalProsthetics2.xml,BetterCrossbreeding.xml,NocturnalAnimals.xml') "Unexpected patch files: $($patchFiles -join ',')"
function Read-Patch([string]$name) { [xml](Get-Content -LiteralPath (@($files | Where-Object Name -ceq $name)[0].FullName) -Raw) }
foreach ($doc in $patchDocs) {
    Check ($doc.SelectNodes('//*[@MayRequire]').Count -eq 0) 'MayRequire on a patch operation is read by nothing: use a conditional'
}
$patch = Read-Patch 'AnimalProsthetics2.xml'
$guard = @($patch.SelectNodes('/Patch/Operation'))
Check ($guard.Count -eq 1 -and $guard[0].Class -ceq 'PatchOperationConditional') 'The patch must be one PatchOperationConditional'
Check ($guard[0].xpath -ceq '/Defs/RecipeDef[@Name="ADS_Cat1"]') 'The guard must test for the ADS_Cat1 recipe, that is for the mod being loaded'
Check ($null -eq $guard[0].SelectSingleNode('nomatch')) 'The guard has a nomatch: without the mod the patch must do nothing and succeed'
$adds = @($guard[0].SelectNodes('match/operations/li'))
Check ($adds.Count -eq 3 -and @($adds | Where-Object Class -cne 'PatchOperationAdd').Count -eq 0) 'Expected three PatchOperationAdd operations'
$categories = @{}
foreach ($category in 1..3) {
    $op = @($adds | Where-Object { $_.xpath -ceq "/Defs/RecipeDef[@Name=`"ADS_Cat$category`"]/recipeUsers" })
    Check ($op.Count -eq 1) "Expected exactly one addition to ADS_Cat$category"
    $names = @($op[0].SelectNodes('value/li') | ForEach-Object { $_.InnerText })
    Check (@($names | Group-Object | Where-Object Count -gt 1).Count -eq 0) "Duplicate user in ADS_Cat$category"
    $categories[$category] = $names
}
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
# The category lists of the patch, against the species this mod defines. The lists are cumulative in that
# mod: a species of category 3 is in all three lists, one of category 2 in two and one of category 1 in one.
# The assignment is a decision: the two smallest are critters, the four trained to Intermediate get simple
# prosthetics, the three trained to Advanced get bionics.
$expectedCategory = @{Ebbb=1; Bebbbholder=1; Crebbb=2; Ebbberration=2; Drebbbd=2; Goliebbb=2; Beee=3; Ebbbomination=3; Thrumebbb=3}
$raceNames = @($races | ForEach-Object { [string]$_.defName })
foreach ($name in $categories[1] + $categories[2] + $categories[3]) {
    Check ($raceNames -contains $name) "A category list names something that is not one of the nine species: $name"
}
foreach ($name in $raceNames) {
    Check ($expectedCategory.ContainsKey($name)) "No ADS 2 category decided for $name"
    $in = @(1..3 | Where-Object { $categories[$_] -contains $name })
    Check (($in -join ',') -ceq ((1..$expectedCategory[$name]) -join ',')) "Wrong ADS 2 category lists for ${name}: in $($in -join ',')"
}
Check ($categories[1].Count -eq 9) 'Every species belongs to category 1 at least'
# Native support for [XND] Nocturnal Animals (Continued) and for Better Crossbreeding. Neither is a
# dependency, so each patch is one PatchOperationFindMod on the mod's About name, compared by the game with
# ==: a rename by its author would turn the patch off without a word, so the names are pinned here and the
# Pickle pass with each mod is what catches it. Neither needs a load order, both are read while the game runs.
$expectedClock = @{Ebbb='Nocturnal'; Beee='Nocturnal'; Ebbbomination='Nocturnal'; Thrumebbb='Nocturnal'; Crebbb='Crepuscular'; Ebbberration='Diurnal'; Bebbbholder='Cathemeral'; Drebbbd='Cathemeral'; Goliebbb='Cathemeral'}
$na = Read-Patch 'NocturnalAnimals.xml'
$naOps = @($na.SelectNodes('/Patch/Operation'))
Check ($naOps.Count -eq 1 -and $naOps[0].Class -ceq 'PatchOperationFindMod') 'The Nocturnal Animals patch must be one PatchOperationFindMod'
Check ((@($naOps[0].SelectNodes('mods/li') | ForEach-Object InnerText) -join '|') -ceq '[XND] Nocturnal Animals (Continued)') 'The guard must name the mod exactly as its About.xml does'
Check ($null -eq $naOps[0].SelectSingleNode('nomatch')) 'The Nocturnal Animals guard has a nomatch: without the mod the patch must do nothing'
$naAdds = @($naOps[0].SelectNodes('match/operations/li'))
Check ($naAdds.Count -eq 9 -and @($naAdds | Where-Object Class -cne 'PatchOperationAddModExtension').Count -eq 0) 'Expected nine PatchOperationAddModExtension operations'
foreach ($name in $raceNames) {
    $op = @($naAdds | Where-Object { $_.xpath -ceq "/Defs/ThingDef[defName=`"$name`"]" })
    Check ($op.Count -eq 1) "Expected exactly one Nocturnal Animals extension for $name"
    $ext = @($op[0].SelectNodes('value/li'))
    Check ($ext.Count -eq 1 -and $ext[0].Class -ceq 'NocturnalAnimals.ExtendedRaceProperties') "Wrong extension class for $name"
    Check ($ext[0].bodyClock -ceq $expectedClock[$name]) "Wrong body clock for ${name}: $($ext[0].bodyClock)"
}
# Better Crossbreeding: four pairs inside the family, each written for both mothers. The outcomes are named
# after the father, and only the mother is read.
$expectedPairs = @('Ebbb>Crebbb=Random','Ebbb>Bebbbholder=Random','Ebbb>Drebbbd=Other:Ebbb3,Drebbbd1','Crebbb>Ebbb=Random','Crebbb>Ebbberration=Random','Bebbbholder>Ebbb=Random','Ebbberration>Crebbb=Random','Drebbbd>Ebbb=Other:Ebbb3,Drebbbd1')
$bc = Read-Patch 'BetterCrossbreeding.xml'
$bcOps = @($bc.SelectNodes('/Patch/Operation'))
Check ($bcOps.Count -eq 1 -and $bcOps[0].Class -ceq 'PatchOperationFindMod') 'The Better Crossbreeding patch must be one PatchOperationFindMod'
Check ((@($bcOps[0].SelectNodes('mods/li') | ForEach-Object InnerText) -join '|') -ceq 'Better Crossbreeding') 'The guard must name the mod exactly as its About.xml does'
Check ($null -eq $bcOps[0].SelectSingleNode('nomatch')) 'The Better Crossbreeding guard has a nomatch: without the mod the patch must do nothing'
$bcAll = @($bcOps[0].SelectNodes('match/operations/li'))
$listOps = @($bcAll | Where-Object Class -ceq 'PatchOperationAdd')
$extOps = @($bcAll | Where-Object Class -ceq 'PatchOperationAddModExtension')
Check ($listOps.Count + $extOps.Count -eq $bcAll.Count) 'Only PatchOperationAdd and PatchOperationAddModExtension are expected'
$canCross = @{}
foreach ($op in $listOps) {
    Check ($op.xpath -cmatch '^/Defs/ThingDef\[defName="(\w+)"\]/race$') "Unexpected crossbreeding xpath: $($op.xpath)"
    $mother = $Matches[1]
    Check ($raceNames -contains $mother) "canCrossBreedWith on something that is not one of the nine species: $mother"
    Check ($null -ne $index["ThingDef:$mother"].SelectSingleNode('race')) "$mother has no race element for the addition to land in"
    Check (-not $canCross.ContainsKey($mother)) "Two canCrossBreedWith additions for $mother"
    $canCross[$mother] = @($op.SelectNodes('value/canCrossBreedWith/li') | ForEach-Object InnerText)
    Check ($op.SelectNodes('value/*').Count -eq 1) "$mother gets something besides canCrossBreedWith, and mateMtbHours is left alone"
}
foreach ($mother in $canCross.Keys) {
    foreach ($father in $canCross[$mother]) {
        Check ($raceNames -contains $father) "$mother crosses with something that is not one of the nine species: $father"
        Check ($father -cne $mother) "$mother crosses with itself"
        Check ($canCross.ContainsKey($father) -and $canCross[$father] -contains $mother) "The pair $mother and $father is written for one mother only"
    }
}
$outcomes = @()
foreach ($op in $extOps) {
    Check ($op.xpath -cmatch '^/Defs/PawnKindDef\[defName="(\w+)"\]$') "Unexpected outcome xpath: $($op.xpath)"
    $mother = $Matches[1]
    $ext = @($op.SelectNodes('value/li'))
    Check ($ext.Count -eq 1 -and $ext[0].Class -ceq 'DZY.CrossBreeding.Extension') "Wrong extension class for $mother"
    $entries = @($ext[0].SelectNodes('outcomes/*'))
    Check ($canCross.ContainsKey($mother) -and $entries.Count -eq $canCross[$mother].Count) "The outcomes of $mother do not match its canCrossBreedWith"
    foreach ($entry in $entries) {
        Check ($canCross[$mother] -contains $entry.LocalName) "$mother has an outcome for $($entry.LocalName), which is not in its canCrossBreedWith"
        Check ($entry.ChildNodes.Count -eq 1) "One behaviour per outcome: $mother x $($entry.LocalName)"
        $behavior = $entry.FirstChild
        Check (@('Maternal','Paternal','Random','Other') -ccontains $behavior.LocalName) "Unknown behaviour $($behavior.LocalName)"
        $label = $behavior.LocalName
        if ($label -ceq 'Other') {
            Check (@($behavior.ChildNodes | Where-Object { $raceNames -notcontains $_.LocalName }).Count -eq 0) 'An Other outcome names something that is not one of the nine species'
            $label += ':' + (@($behavior.ChildNodes | ForEach-Object { $_.LocalName + [int]$_.InnerText }) -join ',')
        }
        $outcomes += "$mother>$($entry.LocalName)=$label"
    }
}
Check ((($outcomes | Sort-Object) -join ';') -ceq (($expectedPairs | Sort-Object) -join ';')) "The crossbreeding outcomes are not the decided ones: $(($outcomes | Sort-Object) -join ' ')"
Check (@($canCross.Keys | Where-Object { @('Beee','Ebbbomination','Thrumebbb','Goliebbb') -contains $_ }).Count -eq 0) 'The predator, the amalgams and the colossus are not paired'
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
