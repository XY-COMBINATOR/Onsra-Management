$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Replace inline background-image data URL with local logo.svg reference
# Use (?s) for singleline mode so . matches newlines
$content = $content -replace '(?s)background-image: url\(&quot;data:image/svg\+xml.*?&quot;\)', 'background-image: url("logo.svg")'

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Logo replaced'