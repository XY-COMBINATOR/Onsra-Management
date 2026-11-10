$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix backslash artifacts in file paths
$content = $content.Replace('css/css_1\.css', 'css/css_1.css')
$content = $content.Replace('css/css_2\.css', 'css/css_2.css')
$content = $content.Replace('css/css_3\.css', 'css/css_3.css')
$content = $content.Replace('css/css_4\.css', 'css/css_4.css')
$content = $content.Replace('css/css_5\.css', 'css/css_5.css')
$content = $content.Replace('css/css_6\.css', 'css/css_6.css')
$content = $content.Replace('css/css_7\.css', 'css/css_7.css')
$content = $content.Replace('css/css_8\.css', 'css/css_8.css')
$content = $content.Replace('css/css_9\.css', 'css/css_9.css')
$content = $content.Replace('css/css_10\.css', 'css/css_10.css')
$content = $content.Replace('css/css_11\.css', 'css/css_11.css')
$content = $content.Replace('css/css_12\.css', 'css/css_12.css')
$content = $content.Replace('css/css_13\.css', 'css/css_13.css')
$content = $content.Replace('css/css_14\.css', 'css/css_14.css')
$content = $content.Replace('css/css_15\.css', 'css/css_15.css')
$content = $content.Replace('css/css_16\.css', 'css/css_16.css')

# Fix backslashes in meta description
$content = $content.Replace('Onsra\ Management\ is\ an\ event\ planner\ specializing\ in\ corporate\ and\ institutional\ events,\ planning,\ production,\ artist\ booking,\ and\ sponsorship\ support\ based\ in\ Dhaka,\ Bangladesh\.', 'Onsra Management is an event planner specializing in corporate and institutional events, planning, production, artist booking, and sponsorship support based in Dhaka, Bangladesh')

# Fix backslashes in RSS links
$content = $content.Replace('Onsra\ Management\ &raquo;\ Feed', 'Onsra Management &raquo; Feed')
$content = $content.Replace('Onsra\ Management\ &raquo;\ Comments\ Feed', 'Onsra Management &raquo; Comments Feed')

# Fix backslashes in og:description and twitter:description
$content = $content.Replace('content="Strategic brand therapy for identities, experiences, and activations that stay with people."', 'content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh."')

# Fix og:description first occurrence
$content = $content.Replace('<meta property="og:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people." />', '<meta property="og:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh." />')
$content = $content.Replace('<meta name="twitter:description" content="Strategic brand therapy for identities, experiences, and activations that stay with people." />', '<meta name="twitter:description" content="Onsra Management is an event planner specializing in corporate and institutional events based in Dhaka, Bangladesh." />')

# Fix JSON-LD backslashes
$content = $content.Replace('images/logo\.svg', 'images/logo.svg')
$content = $content.Replace('url":".', 'url":"./')
$content = $content.Replace('contentUrl":"images/logo\.svg', 'contentUrl":"images/logo.svg')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Path fixes applied'