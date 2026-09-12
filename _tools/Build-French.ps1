# Rebuild French resources and the source inventory from the mod's owned Def fields.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$words = @{
 'left eye'='œil gauche'; 'right eye'='œil droit'; 'eye'='œil'
 'left shoulder'='épaule gauche'; 'right shoulder'='épaule droite'
 'left tentacle'='tentacule gauche'; 'right tentacle'='tentacule droit'
 'left appendage'='appendice gauche'; 'right appendage'='appendice droit'
 'left leg'='patte gauche'; 'right leg'='patte droite'; 'back leg'='patte arrière'
 'left tentacle cluster'='faisceau de tentacules gauche'; 'right tentacle cluster'='faisceau de tentacules droit'
 'right claw'='griffe droite'; 'head'='tête'; 'tentacles'='tentacules'; 'front legs'='pattes avant'
 'horn'='corne'; 'left foot'='pied gauche'; 'right foot'='pied droit'; 'point'='pointe'; 'base'='base'
 'blood'='sang'; 'ebbb leather'="cuir d'ebbb"; 'ebbb meat'="viande d'ebbb"; 'thrumebbb horn'='corne de thrumebbb'
 'thrumebbb spawn'='petit thrumebbb'; 'thrumebbb calves'='petits thrumebbbs'
}
$descriptions = @{
 Ebbb="Personne ne sait ce que sont les ebbbs, ni d'où ils viennent. Les scientifiques étudient ces choses depuis des décennies. S'agit-il d'une nouvelle espèce de rongeur ? Peut-être sont-ils des êtres magiques amenés dans ce monde par une puissance supérieure ? Le mystère reste entier. Une seule chose est certaine : ils aiment vraiment, vraiment beaucoup le fromage."
 Beee='Les beees sont les prédateurs naturels des ebbbs. Leurs chapeaux sont chouettes.'
 Ebbbomination="Un amalgame informe et chaotique d'ebbbs. Il se tortille et gargouille dans un horrible enchevêtrement de tentacules et de glu."
 Goliebbb='Monstruosité terrifiante, le goliebbb est un colosse instable qui dévore tout sur son passage. Si vous le voyez, il vous a très certainement déjà vu.'
 Ebbberration="L'ebbberration est une aberration de la nature qui imite les humains. L'un de ses appendices s'est transformé en une puissante griffe en forme de faux, capable de trancher l'acier le plus résistant comme du beurre. (Concept original de ReineOfCloves)"
 Drebbbd="Lorsqu'un ebbb devient fou, il se met à fusionner de force et avec violence avec tous les autres ebbbs qu'il croise. Ce phénomène est appelé drebbbd."
 Bebbbholder="Le bebbbholder doit son nom aux beholders de fiction, auxquels il ressemble par son corps flottant et ses nombreux yeux. Ces créatures dégagent une sorte d'aura dont on ignore la fonction, mais ceux qui sont restés longtemps à proximité d'un bebbbholder ont décrit des sensations de peur et d'effroi."
 Crebbb="Un monstre à trois pattes étonnamment amical. Herbivore, il se nourrit principalement de végétaux, si bien qu'il attaque rarement les gens et se montre généralement plus docile que les autres ebbbs."
 Thrumebbb="Parodie grotesque de la créature la plus gracieuse de l'univers, le thrumebbb est un amalgame d'ebbbs qui a acquis, on ne sait comment, un semblant d'intelligence. Il est répugnant et empeste la mort. Méfiez-vous : il ne mange pas les arbres."
 Leather_Ebbb="Du cuir d'ebbb tanné, séché et raclé. Le toucher provoque une sensation de malaise..."
 ThrumebbbHorn="Une corne de thrumebbb. Cette masse visqueuse suinte sans cesse une glu noire répugnante. Elle ne sert à rien, si ce n'est de trophée."
}
$names = 'ebbb','beee','crebbb','drebbbd','ebbberration','ebbbomination','goliebbb','thrumebbb','bebbbholder'
$inventory = [Collections.Generic.List[object]]::new()
function Walk($node, [string]$path, [string]$type, [string]$id, [string]$file) {
 if ($node.LocalName -in 'label','description','labelPlural','customLabel','meatLabel') {
  $en = $node.InnerText
  if ($node.LocalName -eq 'description') { $fr=$descriptions[$id] }
  elseif ($words.ContainsKey($en)) { $fr=$words[$en] }
  elseif ($en -cin $names) { $fr=$en }
  else { throw "Unreviewed source: $type $path = $en" }
  if (-not $fr) { throw "Missing translation: $path" }
  $inventory.Add([pscustomobject]@{type=$type; key=$path; english=$en; french=$fr; source=$file})
 }
 $children = @($node.ChildNodes | Where-Object NodeType -eq Element)
 $handles = @($children | ForEach-Object {
  if ($_.LocalName -ne 'li') { $_.LocalName }
  elseif ($_.customLabel) { ([string]$_.customLabel).Replace(' ','_') }
  elseif ($_.label) { ([string]$_.label).Replace(' ','_') }
  elseif ($_.def) { [string]$_.def }
  else { '' }
 })
 for ($i=0; $i -lt $children.Count; $i++) {
  $segment=$handles[$i]
  if ($children[$i].LocalName -eq 'li') {
   if (-not $segment) { $segment=[string]$i }
   elseif (@($handles | Where-Object { $_ -ceq $segment }).Count -gt 1) {
    $rank=@($handles[0..$i] | Where-Object { $_ -ceq $segment }).Count - 1
    $segment="$segment-$rank"
   }
  }
  Walk $children[$i] "$path.$segment" $type $id $file
 }
}
Get-ChildItem "$root/Mod/Defs" -Recurse -Filter *.xml | Sort-Object FullName | ForEach-Object {
 $file=$_.FullName.Substring($root.Length+1).Replace('\','/')
 [xml]$doc=Get-Content $_.FullName -Raw
 foreach ($def in $doc.Defs.ChildNodes) {
  if ($def.NodeType -eq 'Element' -and $def.defName) { Walk $def ([string]$def.defName) $def.LocalName ([string]$def.defName) $file }
 }
}
foreach ($group in ($inventory | Group-Object type)) {
 $dir=Join-Path $root "Mod/Languages/French/DefInjected/$($group.Name)"
 New-Item $dir -ItemType Directory -Force | Out-Null
 $lines=@('<?xml version="1.0" encoding="utf-8"?>','<LanguageData>')
 foreach ($entry in $group.Group) { $lines += "  <$($entry.key)>$([Security.SecurityElement]::Escape($entry.french))</$($entry.key)>" }
 $lines += '</LanguageData>'
 [IO.File]::WriteAllLines((Join-Path $dir 'Ebbbs.xml'),$lines,[Text.UTF8Encoding]::new($false))
}
$inventory | ConvertTo-Json -Depth 5 | Set-Content "$root/Tests/Translation-inventory.json" -Encoding utf8
Write-Output "Generated $($inventory.Count) French entries and English source inventory."
