. (Join-Path $PSScriptRoot apachelogs.ps1)

$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap

getPageCodes "index.html" " 404 " "Chrome"