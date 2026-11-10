$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix tl-sizer text
$content = $content.Replace('<span class="tl-sizer" aria-hidden="true">Brand Therapy, Without the couch.</span>', '<span class="tl-sizer" aria-hidden="true">Onsra Management</span>')

# Fix tl-text__inner
$content = $content.Replace('<span class="tl-text__inner" id="tlTextInner">Brand Therapy, Without the couch.</span>', '<span class="tl-text__inner" id="tlTextInner">Onsra Management</span>')

# Fix JavaScript TEXTS array
$content = $content.Replace('"Brand Therapy, Without the couch."', '"Onsra Management"')

# Fix og:description and twitter:description
$content = $content.Replace('og:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'og:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')
$content = $content.Replace('twitter:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'twitter:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')

# Fix hero subtitle in HTML (with <br /> tags)
$content = $content -replace '(?s)Strategic brand therapy for identities, experiences,<br />\s*and activations that stay with people\.', 'Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh.'

# Fix subtitle encoding
$content = $content.Replace('Share a brief and weâ€™ll start shaping your next event move.', 'Share a brief and we’ll start shaping your next event move.')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Hero text fixes applied'