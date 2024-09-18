. (Join-Path $PSScriptRoot functionsandeventlogs.ps1)

# get logins and logoffs from last 15 days
$loginoutsTable = getLoginoutsLogs(10)

$loginoutsTable

# get startups and shutdowns from last 25 days
$startupshutdownTable = getStartupShutdownLogs(25)

$startupshutdownTable