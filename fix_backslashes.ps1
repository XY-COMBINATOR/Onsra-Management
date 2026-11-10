$path = 'C:\Users\harsh\Onsra-Website\index.html'
$content = Get-Content -LiteralPath $path -Raw

# Fix backslash artifacts introduced during replacement
$content = $content.Replace('Copyright\ @2026\ Onsra\ Management\ Powered\ by', 'Copyright @2026 Onsra Management Powered by')
$content = $content.Replace('alt="Onsra\ Management\ Logo"', 'alt="Onsra Management Logo"')
$content = $content.Replace('href="https://www\.instagram\.com/onsra\.mgt/"', 'href="https://www.instagram.com/onsra.mgt/"')
$content = $content.Replace('data-lazy-src="images/logo\.svg"', 'data-lazy-src="images/logo.svg"')
$content = $content.Replace('src="images/logo\.svg"', 'src="images/logo.svg"')
$content = $content.Replace('url("images/logo\.svg")', 'url("images/logo.svg")')
$content = $content.Replace('Onsra\ Management\ \|\ Event\ Planner', 'Onsra Management | Event Planner')

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Host 'Backslashes fixed'