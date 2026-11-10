$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix cursor image URL
$content = $content.Replace('./wp-content/uploads/2026/04/Glass-Cursor.png', 'images/Glass-Cursor.png')

# Convert data-lazy-src to src for immediate image loading
# Pattern: src="data:image/svg+xml,..." data-lazy-src="images/..." -> src="images/..."
$content = $content -replace '(?s)<img decoding="async" src="data:image/svg\+xml,[^"]*" alt="" data-lazy-src="([^"]+)"', '<img decoding="async" src="$1" alt="" loading="lazy"'

# Also handle the logo image in header
$content = $content -replace '(?s)<img width="127" height="41" src="data:image/svg\+xml,[^"]*" class="attachment-full size-full wp-image-426" alt="Onsra Management Logo" data-lazy-src="images/logo\.svg"', '<img width="127" height="41" src="images/logo.svg" class="attachment-full size-full wp-image-426" alt="Onsra Management Logo"'

# Handle service images and other images with data-lazy-src but no transparent placeholder
$content = $content -replace 'data-lazy-src="images/', 'src="images/'

# Remove remaining empty data-lazy-src attributes
$content = $content.Replace(' data-lazy-src=""', '')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Image and cursor fixes applied'