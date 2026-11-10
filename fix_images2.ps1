$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Use regex Replace with MatchEvaluator to convert data-lazy-src to src
# Pattern 1: src="data:image/svg+xml,..." + data-lazy-src="images/xxx"
$regex1 = '(?s)<img([^>]*?)src="data:image/svg\+xml,[^"]*"([^>]*?)data-lazy-src="([^"]+)"([^>]*)>'
$content = [regex]::Replace($content, $regex1, { param($m) "<img`$1src=`"$($m.Groups[3].Value)`"`$2`$4>" })

# Pattern 2: src="data:image/svg+xml,..." + data-lazy-srcset="images/xxx ..."
$regex2 = '(?s)<img([^>]*?)src="data:image/svg\+xml,[^"]*"([^>]*?)data-lazy-srcset="([^"]+)"([^>]*)>'
$content = [regex]::Replace($content, $regex2, { param($m) 
    $srcset = $m.Groups[3].Value
    $firstUrl = ($srcset -split '\s')[0]
    "<img`$1src=`"$firstUrl`"`$2`$4>"
})

# Pattern 3: Header logo
$content = $content -replace '(?s)<img width="127" height="41" src="data:image/svg\+xml,[^"]*" class="attachment-full size-full wp-image-426" alt="Onsra Management Logo" data-lazy-src="images/logo\.svg"', '<img width="127" height="41" src="images/logo.svg" class="attachment-full size-full wp-image-426" alt="Onsra Management Logo"'

# Remove remaining data-lazy-* attributes
$content = $content -replace '\sdata-lazy-src="[^"]*"', ''
$content = $content -replace '\sdata-lazy-srcset="[^"]*"', ''
$content = $content -replace '\sdata-lazy-sizes="[^"]*"', ''

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'All image src fixes applied'