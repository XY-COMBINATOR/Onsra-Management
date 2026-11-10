$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw -Encoding UTF8

# Remove placeholder src="data:image/svg+xml,..."
$content = [regex]::Replace($content, 'src="data:image/svg\+xml,[^"]*"', '')

# Convert data-lazy-src="images/xxx" to src="images/xxx"
$content = $content.Replace('data-lazy-src="', 'src="')

# Remove data-lazy-srcset and data-lazy-sizes
$content = $content.Replace(' data-lazy-srcset="', ' ')
$content = [regex]::Replace($content, ' data-lazy-srcset="[^"]*"', '')
$content = [regex]::Replace($content, ' data-lazy-sizes="[^"]*"', '')

# Fix header logo inline data URL
$content = [regex]::Replace($content, '(?s)background-image: url\(&quot;data:image/svg\+xml.*?&quot;\)', 'background-image: url("logo.svg")')

# Brand swaps
$content = $content.Replace('Disrupt | Creative Brand Experience Agency', 'Onsra Management | Event Planner')
$content = $content.Replace('Disrupt is a creative brand experience agency shaping strategy, identity, events and activations into ideas people can see, feel and experience.', 'Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh.')
$content = $content.Replace('og:title" content="Disrupt', 'og:title" content="Onsra Management')
$content = $content.Replace('twitter:title" content="Disrupt', 'twitter:title" content="Onsra Management')
$content = $content.Replace('og:site_name" content="Disrupt"', 'og:site_name" content="Onsra Management"')
$content = $content.Replace('Disrupt &raquo; Feed', 'Onsra Management &raquo; Feed')
$content = $content.Replace('Disrupt &raquo; Comments Feed', 'Onsra Management &raquo; Comments Feed')
$content = $content.Replace('https://www.instagram.com/d.srupt', 'https://www.instagram.com/onsra.mgt/')
$content = $content.Replace('https://www.linkedin.com/company/disruptqatar/', '#')
$content = $content.Replace('Disrupt.svg', 'logo.svg')
$content = $content.Replace('Disrupt Logo', 'Onsra Management Logo')
$content = $content.Replace('disrupt-logo', 'onsra-logo')
$content = $content.Replace('Copyright @2026 Disrupt Powered by', 'Copyright @2026 Onsra Management Powered by')

# CSS URLs
$cssMap = @{
    'https://madetodisrupt.com/wp-content/themes/astra/assets/css/minified/main.min.css?ver=4.12.0' = 'css/css_1.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=4.1.2' = 'css/css_2.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-image.min.css?ver=4.1.2' = 'css/css_3.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/widget-nav-menu.min.css?ver=3.34.0' = 'css/css_4.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-heading.min.css?ver=4.1.2' = 'css/css_5.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/conditionals/popup.min.css?ver=3.34.0' = 'css/css_6.css'
    'https://madetodisrupt.com/wp-content/uploads/elementor/css/post-6.css?ver=1787834828' = 'css/css_7.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/modules/motion-fx.min.css?ver=3.34.0' = 'css/css_8.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-video.min.css?ver=4.1.2' = 'css/css_9.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-icon-list.min.css?ver=4.1.2' = 'css/css_10.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/lib/animations/styles/fadeInUp.min.css?ver=4.1.2' = 'css/css_11.css'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/modules/sticky.min.css?ver=3.34.0' = 'css/css_12.css'
    'https://madetodisrupt.com/wp-content/uploads/elementor/css/post-10.css?ver=1792398478' = 'css/css_13.css'
    'https://madetodisrupt.com/wp-content/uploads/elementor/css/post-443.css?ver=1787834833' = 'css/css_14.css'
    'https://madetodisrupt.com/wp-content/uploads/elementor/css/post-425.css?ver=1787834828' = 'css/css_15.css'
    'https://madetodisrupt.com/wp-content/uploads/elementor/css/post-429.css?ver=1787834828' = 'css/css_16.css'
}
foreach ($old in $cssMap.Keys) {
    $content = $content.Replace($old, $cssMap[$old])
}

# Image URLs
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/01/Disrupt.svg', 'logo.svg')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/01/', 'images/')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/10/', 'images/')

# Site URLs
$content = $content.Replace('https://madetodisrupt.com/', './')
$content = $content.Replace('og:url" content="https://madetodisrupt.com"', 'og:url" content="./"')

# JS URLs
$jsMap = @{
    'https://madetodisrupt.com/wp-includes/js/jquery/jquery.min.js?ver=3.7.1' = 'js/js_1.js'
    'https://madetodisrupt.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1' = 'js/js_2.js'
    'https://madetodisrupt.com/wp-content/themes/astra/assets/js/minified/flexibility.min.js?ver=4.12.0' = 'js/js_3.js'
    'https://madetodisrupt.com/wp-content/themes/astra/assets/js/minified/frontend.min.js?ver=4.12.0' = 'js/js_4.js'
    'https://madetodisrupt.com/wp-content/cache/min/1/wp-content/plugins/dynamicconditions/Public/js/dynamic-conditions-public.js?ver=1792398525' = 'js/js_5.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=4.1.2' = 'js/js_6.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=4.1.2' = 'js/js_7.js'
    'https://madetodisrupt.com/wp-includes/js/jquery/ui/core.min.js?ver=1.14.2' = 'js/js_8.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=4.1.2' = 'js/js_9.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/lib/smartmenus/jquery.smartmenus.min.js?ver=1.2.1' = 'js/js_10.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/lib/sticky/jquery.sticky.min.js?ver=3.34.0' = 'js/js_11.js'
    'https://madetodisrupt.com/wp-includes/js/underscore.min.js?ver=1.13.8' = 'js/js_12.js'
    'https://madetodisrupt.com/wp-includes/js/backbone.min.js?ver=1.6.1' = 'js/js_13.js'
    'https://madetodisrupt.com/wp-content/cache/min/1/wp-content/plugins/ninja-forms/assets/js/min/front-end-deps.js?ver=1792398526' = 'js/js_14.js'
    'https://madetodisrupt.com/wp-content/cache/min/1/wp-content/plugins/ninja-forms/assets/js/min/front-end.js?ver=1792398526' = 'js/js_15.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.34.0' = 'js/js_16.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.34.0' = 'js/js_17.js'
    'https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.34.0' = 'js/js_18.js'
    'https://madetodisrupt.com/wp-content/plugins/wp-rocket/assets/js/lazyload/17.8.3/lazyload.min.js' = 'js/js_19.js'
    'https://madetodisrupt.com/wp-content/cache/min/1/client_data/52cf1d3ccb6532b61fd9007f19733339/script.js?ver=1792398525' = 'js/js_20.js'
}
foreach ($old in $jsMap.Keys) {
    $content = $content.Replace($old, $jsMap[$old])
}

# JSON-LD
$content = $content.Replace('"name":"Disrupt"', '"name":"Onsra Management"')
$content = $content.Replace('"caption":"Disrupt"', '"caption":"Onsra Management"')
$content = $content.Replace('"title":"Disrupt%20%7C%20Creative%20Brand%20Experience%20Agency"', '"title":"Onsra%20Management%20%7C%20Event%20Planner"')

# Remaining madetodisrupt URLs
$content = $content.Replace('https:\/\/madetodisrupt.com\/', '.\/')
$content = $content.Replace('https://madetodisrupt.com', '.')
$content = $content.Replace('\.\/', './')
$content = $content.Replace('\./', './')

# oEmbed URLs
$content = $content.Replace('url=https%3A%2F%2Fmadetodisrupt.com%2F', 'url=https%3A%2F%2Fonsra-management.com%2F')

# Encoding fixes
$content = $content.Replace('â€™', '''')
$content = $content.Replace('â€œ', '"')
$content = $content.Replace('â€', '-')
$content = $content.Replace('Â°', '°')
$content = $content.Replace('âœ…', '✓')

# Contact section
$content = [regex]::Replace($content, '(?s)<h2 class="elementor-heading-title elementor-size-default">READY TO\s*<br>\s*DISRUPT THE\s*<br>\s*ORDINARY\?</h2>', '<h2 class="elementor-heading-title elementor-size-default">READY TO BUILD WITH ONSRA?</h2>')
$content = $content.Replace('Share a brief and weâ€™ll start shaping your next brand move.', 'Share a brief and we’ll start shaping your next event move.')
$content = $content.Replace('We shape disruptive platforms and campaigns that claim attention in crowded markets.', 'We shape powerful platforms and campaigns that claim attention in crowded markets.')

# Hero text
$content = $content.Replace('<span class="tl-sizer" aria-hidden="true">Brand Therapy, Without the couch.</span>', '<span class="tl-sizer" aria-hidden="true">Onsra Management</span>')
$content = $content.Replace('<span class="tl-text__inner" id="tlTextInner">Brand Therapy, Without the couch.</span>', '<span class="tl-text__inner" id="tlTextInner">Onsra Management</span>')
$content = $content.Replace('"Brand Therapy, Without the couch."', '"Onsra Management"')
$content = $content.Replace('og:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'og:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')
$content = $content.Replace('twitter:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'twitter:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')
$content = [regex]::Replace($content, '(?s)Strategic brand therapy for identities, experiences,<br />\s*and activations that stay with people\.', 'Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh.')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Complete rebuild done'