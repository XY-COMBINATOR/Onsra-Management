$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Brand name replacements
$content = $content.Replace('Disrupt | Creative Brand Experience Agency', 'Onsra Management | Event Planner')
$content = $content.Replace('Disrupt is a creative brand experience agency shaping strategy, identity, events and activations into ideas people can see, feel and experience.', 'Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh.')
$content = $content.Replace('og:title" content="Disrupt', 'og:title" content="Onsra Management')
$content = $content.Replace('twitter:title" content="Disrupt', 'twitter:title" content="Onsra Management')
$content = $content.Replace('og:site_name" content="Disrupt"', 'og:site_name" content="Onsra Management"')
$content = $content.Replace('Disrupt &raquo; Feed', 'Onsra Management &raquo; Feed')
$content = $content.Replace('Disrupt &raquo; Comments Feed', 'Onsra Management &raquo; Comments Feed')

# Social links
$content = $content.Replace('https://www.instagram.com/d.srupt', 'https://www.instagram.com/onsra.mgt/')
$content = $content.Replace('https://www.linkedin.com/company/disruptqatar/', '#')

# Logo
$content = $content.Replace('Disrupt.svg', 'logo.svg')
$content = $content.Replace('Disrupt Logo', 'Onsra Management Logo')
$content = $content.Replace('disrupt-logo', 'onsra-logo')

# Copyright
$content = $content.Replace('Copyright @2026 Disrupt Powered by', 'Copyright @2026 Onsra Management Powered by')

# Asset URLs - make relative
$content = $content.Replace('https://madetodisrupt.com/wp-content/themes/astra/assets/css/minified/main.min.css?ver=4.12.0', 'css/css_1.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=4.1.2', 'css/css_2.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-image.min.css?ver=4.1.2', 'css/css_3.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/widget-nav-menu.min.css?ver=3.34.0', 'css/css_4.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-heading.min.css?ver=4.1.2', 'css/css_5.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/conditionals/popup.min.css?ver=3.34.0', 'css/css_6.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/elementor/css/post-6.css?ver=1787834828', 'css/css_7.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/modules/motion-fx.min.css?ver=3.34.0', 'css/css_8.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-video.min.css?ver=4.1.2', 'css/css_9.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/css/widget-icon-list.min.css?ver=4.1.2', 'css/css_10.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor/assets/lib/animations/styles/fadeInUp.min.css?ver=4.1.2', 'css/css_11.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/plugins/elementor-pro/assets/css/modules/sticky.min.css?ver=3.34.0', 'css/css_12.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/elementor/css/post-10.css?ver=1792398478', 'css/css_13.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/elementor/css/post-443.css?ver=1787834833', 'css/css_14.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/elementor/css/post-425.css?ver=1787834828', 'css/css_15.css')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/elementor/css/post-429.css?ver=1787834828', 'css/css_16.css')

# Image URLs
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/01/Disrupt.svg', 'logo.svg')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/01/', 'images/')
$content = $content.Replace('https://madetodisrupt.com/wp-content/uploads/2026/10/', 'images/')

# Site URLs
$content = $content.Replace('https://madetodisrupt.com/', './')
$content = $content.Replace('og:url" content="https://madetodisrupt.com"', 'og:url" content="./"')

# Replace inline Disrupt logo data URL with local logo.svg reference
$content = $content -replace '(?s)background-image: url\(&quot;data:image/svg\+xml.*?&quot;\)', 'background-image: url("logo.svg")'

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Done'