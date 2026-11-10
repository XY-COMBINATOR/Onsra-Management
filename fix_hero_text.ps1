$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix hero text layer - the animated text in logo slot
$content = $content.Replace('<span class="tl-text__inner" id="tlTextInner">Brand Therapy, Without the couch.</span>', '<span class="tl-text__inner" id="tlTextInner">Onsra Management</span>')
$content = $content.Replace('<span class="tl-sizer" aria-hidden="true">Brand Therapy, Without the couch.</span>', '<span class="tl-sizer" aria-hidden="true">Onsra Management</span>')

# Fix hero description
$content = $content.Replace('Strategic brand therapy for identities, experiences, and activations that stay with people.', 'Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh.')

# Fix og:description and twitter:description
$content = $content.Replace('og:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'og:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')
$content = $content.Replace('twitter:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'twitter:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')

# Fix meta description
$content = $content.Replace('meta name="description" content="Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh."', 'meta name="description" content="Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh."')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Hero text fixes applied'