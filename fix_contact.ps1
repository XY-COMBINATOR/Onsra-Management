$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix contact heading - replace multi-line "READY TO DISRUPT THE ORDINARY?"
$oldHeading = '<h2 class="elementor-heading-title elementor-size-default">READY TO `nDISRUPT THE `nORDINARY?</h2>'
$newHeading = '<h2 class="elementor-heading-title elementor-size-default">READY TO BUILD WITH ONSRA?</h2>'
$content = $content -replace '(?s)<h2 class="elementor-heading-title elementor-size-default">READY TO\s+DISRUPT THE\s+ORDINARY\?</h2>', '<h2 class="elementor-heading-title elementor-size-default">READY TO BUILD WITH ONSRA?</h2>'

# Fix the subtitle text with encoding issue - use regex to match we'll regardless of encoding
$content = $content -replace 'Share a brief and we.{0,10}ll start shaping your next brand move\.', 'Share a brief and we’ll start shaping your next event move.'

# Fix other "disruptive" references
$content = $content.Replace('We shape disruptive platforms and campaigns that claim attention in crowded markets.', 'We shape powerful platforms and campaigns that claim attention in crowded markets.')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Contact section fixes applied'