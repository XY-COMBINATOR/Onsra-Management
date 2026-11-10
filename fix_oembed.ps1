$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix oEmbed URLs
$content = $content.Replace('url=https%3A%2F%2Fmadetodisrupt.com%2F', 'url=https%3A%2F%2Fonsra-management.com%2F')

# Fix any remaining Disrupt in visible text
$content = $content.Replace('Hotjar Tracking Code for Disrupt', 'Hotjar Tracking Code for Onsra Management')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Done'