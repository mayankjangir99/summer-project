$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$markdown = Get-Content -Raw (Join-Path $root 'Summer_Training_Report.md')

function Convert-Inline([string]$s) {
    $s = [System.Net.WebUtility]::HtmlEncode($s)
    $s = [regex]::Replace($s, '`([^`]+)`', '<code>$1</code>')
    $s = [regex]::Replace($s, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
    $s = [regex]::Replace($s, '\*([^*]+)\*', '<em>$1</em>')
    return $s
}

$html = New-Object System.Collections.Generic.List[string]
$html.Add(@'
<!doctype html><html><head><meta charset="utf-8"><title>Summer Training Report</title>
<style>
@page { size: A4; margin: 24mm 20mm 22mm; }
body { font-family: Arial, sans-serif; font-size: 11pt; line-height: 1.55; color: #111; }
h1 { font-size: 18pt; text-align: center; margin-top: 0; } h2 { font-size: 14pt; margin-top: 22px; } h3 { font-size: 12pt; margin-top: 17px; }
p { text-align: justify; } .cover h1, .cover h2 { text-align:center; } .cover { padding-top: 55mm; } .cover p { text-align:center; margin: 10px 0; }
code { font-family: Consolas, monospace; font-size: 9.5pt; } pre { background:#f4f4f4; border:1px solid #ccc; padding:12px; white-space:pre-wrap; line-height:1.35; }
ul { margin-top: 2px; } .pagebreak { break-before: page; } hr { border:0; border-top:1px solid #999; }
</style></head><body>
'@)

$inCode = $false; $inList = $false; $isCover = $true
foreach ($line in ($markdown -split "`r?`n")) {
    if ($line -eq '\newpage') { if ($inList) { $html.Add('</ul>'); $inList=$false }; $html.Add('</div><div class="pagebreak">'); $isCover=$false; continue }
    if ($line -eq '```cpp') { if ($inList) { $html.Add('</ul>'); $inList=$false }; $html.Add('<pre><code>'); $inCode=$true; continue }
    if ($line -eq '```') { $html.Add('</code></pre>'); $inCode=$false; continue }
    if ($inCode) { $html.Add([System.Net.WebUtility]::HtmlEncode($line)); continue }
    if ([string]::IsNullOrWhiteSpace($line)) { if ($inList) { $html.Add('</ul>'); $inList=$false }; continue }
    if ($line -match '^# (.+)$') { if ($isCover) { $html.Add('<div class="cover">') }; $html.Add('<h1>' + (Convert-Inline $Matches[1]) + '</h1>'); continue }
    if ($line -match '^## (.+)$') { $html.Add('<h2>' + (Convert-Inline $Matches[1]) + '</h2>'); continue }
    if ($line -match '^### (.+)$') { $html.Add('<h3>' + (Convert-Inline $Matches[1]) + '</h3>'); continue }
    if ($line -match '^- (.+)$') { if (-not $inList) { $html.Add('<ul>'); $inList=$true }; $html.Add('<li>' + (Convert-Inline $Matches[1]) + '</li>'); continue }
    if ($line -match '^\d+\. (.+)$') { $html.Add('<p>' + (Convert-Inline $line) + '</p>'); continue }
    $html.Add('<p>' + ((Convert-Inline $line) -replace '  $','<br>') + '</p>')
}
if ($inList) { $html.Add('</ul>') }
$html.Add('</div></body></html>')
$htmlPath = Join-Path $root 'Summer_Training_Report.html'
$pdfPath = Join-Path $root 'Summer_Training_Report.pdf'
[System.IO.File]::WriteAllText($htmlPath, ($html -join "`n"), [System.Text.Encoding]::UTF8)
$edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
& $edge --headless --disable-gpu --no-first-run --print-to-pdf=$pdfPath ("file:///" + ($htmlPath -replace '\\','/'))
if (-not (Test-Path $pdfPath)) { throw 'PDF generation failed.' }
Get-Item $pdfPath | Select-Object Name, Length, FullName
