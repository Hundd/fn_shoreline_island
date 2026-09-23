param(
    [string]$InventoryPath = (Join-Path $PSScriptRoot 'label-inventory-2026-09-23.csv')
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
$inventoryFile = (Resolve-Path -LiteralPath $InventoryPath).Path
$lines = [System.IO.File]::ReadAllLines($inventoryFile, [System.Text.Encoding]::UTF8)
if (-not (@($lines | Where-Object { $_.StartsWith('"verse",') }).Count)) {
    throw 'Inventory has no Verse rows.'
}

function Quote-Csv([string]$Value) {
    return '"' + $Value.Replace('"', '""') + '"'
}

$out = New-Object 'System.Collections.Generic.List[string]'
$out.Add($lines[0])
for ($index = 1; $index -lt $lines.Length; $index++) {
    if (-not $lines[$index].StartsWith('"verse",')) {
        $out.Add($lines[$index])
    }
}
$savedActorCount = $out.Count - 1
$verseCount = 0
$contentRoot = Join-Path $projectRoot 'Content'
$files = Get-ChildItem -LiteralPath $contentRoot -Filter '*.verse' -File -Recurse | Sort-Object FullName
foreach ($file in $files) {
    $relative = $file.FullName.Substring($projectRoot.Length + 1)
    $sourceLines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
    for ($index = 0; $index -lt $sourceLines.Length; $index++) {
        if ($sourceLines[$index] -match '^\s*(?<field>\w+)<localizes>(?:\([^)]*\))?:message\s*=\s*(?<text>.*)$') {
            $columns = @('verse', ('{0}:{1}' -f $relative, ($index + 1)), $Matches.field, $Matches.text, 'source declaration')
            $out.Add((($columns | ForEach-Object { Quote-Csv $_ }) -join ','))
            $verseCount++
        }
    }
}

$encoding = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($inventoryFile, (($out -join "`n") + "`n"), $encoding)
Write-Output "Preserved $savedActorCount saved-actor rows; refreshed $verseCount Verse rows."
