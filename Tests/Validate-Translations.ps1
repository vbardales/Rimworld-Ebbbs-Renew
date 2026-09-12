param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$inventory = Get-Content "$PSScriptRoot/Translation-inventory.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$actual = @{}
Get-ChildItem "$ModPath/Languages/French/DefInjected" -Recurse -Filter *.xml | ForEach-Object {
 [xml]$doc=Get-Content $_.FullName -Raw -Encoding UTF8
 foreach ($entry in $doc.LanguageData.ChildNodes) {
  if ($entry.NodeType -ne 'Element') { continue }
  $key="$($_.Directory.Name):$($entry.LocalName)"
  if ($actual.ContainsKey($key)) { throw "Duplicate translation: $key" }
  $actual[$key]=$entry.InnerText
 }
}
$count=0
Get-ChildItem "$ModPath/Defs" -Recurse -Filter *.xml | ForEach-Object {
 [xml]$doc=Get-Content $_.FullName -Raw -Encoding UTF8
 $count += $doc.SelectNodes('//label | //description | //labelPlural | //customLabel | //meatLabel').Count
}
if ($count -ne $inventory.Count) { throw 'Source text count changed: rebuild and review the inventory.' }
foreach ($entry in $inventory) {
 $key="$($entry.type):$($entry.key)"
 if (-not $entry.english -or -not $entry.french) { throw "Empty source or translation: $key" }
 if ($actual[$key] -cne $entry.french) { throw "Missing or changed French entry: $key" }
 [xml]$source=Get-Content (Join-Path (Split-Path $ModPath -Parent) $entry.source) -Raw -Encoding UTF8
 $id=$entry.key.Split('.')[0]
 $field=$entry.key.Split('.')[-1]
 $values=@($source.SelectNodes("/Defs/$($entry.type)[defName='$id']//$field") | ForEach-Object InnerText)
 if ($entry.english -cnotin $values) { throw "English source changed: $key" }
}
if ($actual.Count -ne $inventory.Count) { throw 'Unexpected French keys outside inventory.' }
Write-Output "PASS: $count owned English texts and French entries; no duplicate, empty or unexpected keys. Run Check-DefInjected.ps1 for reflected path validation."
