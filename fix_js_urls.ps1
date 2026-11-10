$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw -Encoding UTF8

# Replace all relative JS URLs with local paths
$jsRelativeMap = @{
    './wp-content/cache/min/1/client_data/52cf1d3ccb6532b61fd9007f19733339/script.js?ver=1792398525' = 'js/js_20.js'
    './wp-content/themes/astra/assets/js/minified/flexibility.min.js?ver=4.12.0' = 'js/js_3.js'
    './wp-includes/js/jquery/jquery.min.js?ver=3.7.1' = 'js/js_1.js'
    './wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1' = 'js/js_2.js'
    './wp-content/themes/astra/assets/js/minified/frontend.min.js?ver=4.12.0' = 'js/js_4.js'
    './wp-content/cache/min/1/wp-content/plugins/dynamicconditions/Public/js/dynamic-conditions-public.js?ver=1792398525' = 'js/js_5.js'
    './wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=4.1.2' = 'js/js_6.js'
    './wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=4.1.2' = 'js/js_7.js'
    './wp-includes/js/jquery/ui/core.min.js?ver=1.14.2' = 'js/js_8.js'
    './wp-content/plugins/elementor/assets/js/frontend.min.js?ver=4.1.2' = 'js/js_9.js'
    './wp-content/plugins/elementor-pro/assets/lib/smartmenus/jquery.smartmenus.min.js?ver=1.2.1' = 'js/js_10.js'
    './wp-content/plugins/elementor-pro/assets/lib/sticky/jquery.sticky.min.js?ver=3.34.0' = 'js/js_11.js'
    './wp-includes/js/underscore.min.js?ver=1.13.8' = 'js/js_12.js'
    './wp-includes/js/backbone.min.js?ver=1.6.1' = 'js/js_13.js'
    './wp-content/cache/min/1/wp-content/plugins/ninja-forms/assets/js/min/front-end-deps.js?ver=1792398526' = 'js/js_14.js'
    './wp-content/cache/min/1/wp-content/plugins/ninja-forms/assets/js/min/front-end.js?ver=1792398526' = 'js/js_15.js'
    './wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.34.0' = 'js/js_16.js'
    './wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.34.0' = 'js/js_17.js'
    './wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.34.0' = 'js/js_18.js'
    './wp-content/plugins/wp-rocket/assets/js/lazyload/17.8.3/lazyload.min.js' = 'js/js_19.js'
    './wp-includes/js/dist/hooks.min.js?ver=f0f188028580e8dc1255' = ''
    './wp-includes/js/dist/i18n.min.js?ver=1dfe7db3940c23ea9216' = ''
}

foreach ($old in $jsRelativeMap.Keys) {
    $new = $jsRelativeMap[$old]
    if ($new -eq '') {
        # Remove the script tag entirely for hooks/i18n
        $content = [regex]::Replace($content, [regex]::Escape($old), '')
    } else {
        $content = $content.Replace($old, $new)
    }
}

# Remove leftover script tags that now have empty src
$content = [regex]::Replace($content, '<script[^>]*src=""[^>]*>', '')

# Remove oEmbed and WordPress API links (not needed for visual rendering)
$content = [regex]::Replace($content, '<link rel="alternate" title="oEmbed[^"]*/>', '')
$content = [regex]::Replace($content, '<link rel="https://api\.w\.org/"[^>]*>', '')
$content = [regex]::Replace($content, '<link rel="alternate" title="JSON"[^>]*>', '')
$content = [regex]::Replace($content, '<link rel="EditURI"[^>]*>', '')
$content = [regex]::Replace($content, '<noscript><style id="rocket-lazyload-nojs-css">[^<]*</style></noscript>', '')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host "Relative URLs fixed"