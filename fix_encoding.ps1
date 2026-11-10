$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix encoding issues using hex escape sequences
$content = $content.Replace("`u00c2`u2019", "'")
$content = $content.Replace("`u00c2`u201C", """")
$content = $content.Replace("`u00c2`u2013", "-")
$content = $content.Replace("`u00c2`u00B0", "°")
$content = $content.Replace("`u00c2`u2026", "...")

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Encoding fixes applied'