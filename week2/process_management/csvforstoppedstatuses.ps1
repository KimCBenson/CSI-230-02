# get the stopped statuses and then sort them
$stopped_services = Get-Service | Where-Object { $_.Status -eq 'Stopped'} | Select-Object DisplayName, Name | Sort-Object DisplayName

$stopped_services | Export-Csv -Path "$PSScriptRoot\stopped_services.csv"