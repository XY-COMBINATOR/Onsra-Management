$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix remaining Disrupt in JSON-LD
$content = $content.Replace('"name":"Disrupt"', '"name":"Onsra Management"')
$content = $content.Replace('"caption":"Disrupt"', '"caption":"Onsra Management"')
$content = $content.Replace('"title":"Disrupt%20%7C%20Creative%20Brand%20Experience%20Agency"', '"title":"Onsra%20Management%20%7C%20Event%20Planner"')

# Fix remaining madetodisrupt.com URLs in configs (they won't affect visuals but clean up)
$content = $content.Replace('https:\/\/madetodisrupt.com\/', '.\/')
$content = $content.Replace('https://madetodisrupt.com', '.')

# Fix oEmbed URLs
$content = $content.Replace('url=https%3A%2F%2Fmadetodisrupt.com%2F', 'url=https%3A%2F%2Fonsra-management.com%2F')

# Fix any double backslash-dot artifacts
$content = $content.Replace('\.\/', './')
$content = $content.Replace('\./', './')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Final cleanup done'