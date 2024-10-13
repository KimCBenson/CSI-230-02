# Script for Part 1 - Networking for the PowerShell Basic Lab for CSI 230-02 by Kim Benson

# 1: (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress
# 2: (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength

#3&4: (Get-WmiObject -List | Where-Object { $_.Name -like "Win32_net*" } | Sort-Object Name)

# 5&6: Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "IPEnabled = True" | Select-Object DHCPServer | Format-Table -HideTableHeaders

# 7:
(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses[0]