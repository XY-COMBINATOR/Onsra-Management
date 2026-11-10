$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix the multi-line contact heading
$content = $content -replace '(?s)<h2 class="elementor-heading-title elementor-size-default">READY TO\s*<br>\s*DISRUPT THE\s*<br>\s*ORDINARY\?</h2>', '<h2 class="elementor-heading-title elementor-size-default">READY TO BUILD WITH ONSRA?</h2>'

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Contact heading fixed'