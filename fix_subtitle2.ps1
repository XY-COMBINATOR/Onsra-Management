$path = 'C:\Users\harsh\Onsra-Website\index.html'
$lines = Get-Content -LiteralPath $path
$newLines = $lines | ForEach-Object {
    if ($_ -match 'Share a brief and we.*ll start shaping your next event move') {
        # Replace the whole line
        '					<p class="elementor-heading-title elementor-size-default">Share a brief and we’ll start shaping your next event move.</p>				</div>'
    } else {
        $_
    }
}
Set-Content -LiteralPath $path -Value $newLines -Encoding UTF8
Write-Host 'Subtitle fixed line by line'