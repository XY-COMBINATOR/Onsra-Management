$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix remaining brand references in JSON-LD and JS configs
$content = $content.Replace('"name":"Disrupt"', '"name":"Onsra Management"')
$content = $content.Replace('"name":"Disrupt",', '"name":"Onsra Management",')
$content = $content.Replace('"caption":"Disrupt"', '"caption":"Onsra Management"')
$content = $content.Replace('"title":"Disrupt%20%7C%20Creative%20Brand%20Experience%20Agency"', '"title":"Onsra%20Management%20%7C%20Event%20Planner"')
$content = $content.Replace('https:\/\/madetodisrupt.com\/', '.\/')
$content = $content.Replace('https:\/\/madetodisrupt.com', '.')
$content = $content.Replace('https://madetodisrupt.com', '.')
# Fix double backslash-dot from over-escaping
$content = $content.Replace('.\/', './')
$content = $content.Replace('\./', './')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Fixed remaining references'