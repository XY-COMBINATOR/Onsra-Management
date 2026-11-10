$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix encoding issue: replace weâ€™ll with we’ll (using regex to match any encoding of we'll)
$content = $content -replace 'Share a brief and we.{0,15}ll start shaping your next event move\.', 'Share a brief and we’ll start shaping your next event move.'

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Subtitle encoding fixed'