function getLoginoutsLogs($days)
{
# 1: Get-EventLog system -source Microsoft-Windows-Winlogon

# 2:
    $loginouts = Get-EventLog system -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)
    
    $loginoutsTable = @()

    for ($i=0; $i -lt $loginouts.Count; $i++)
    {
        $event = ""

        if ($loginouts[$i].InstanceID -eq 7001) {$event = "Logon"}
        if ($loginouts[$i].InstanceID -eq 7002) {$event = "Logoff"}

        $user = $loginouts[$i].ReplacementStrings[1]

        $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                            "Id" = $loginouts[$i].InstanceId; `
                                            "Event" = $event; `
                                            "User" = $user;
                                            }
    }

    # $loginoutsTable

    # 3:
    for ($i=0; $i -lt $loginoutsTable.Count; $i++)
    {
        $SID = New-Object System.Security.Principal.SecurityIdentifier($loginoutsTable[$i].User)

        $loginoutsTable[$i].User = $SID.Translate([System.Security.Principal.NTAccount])
    }

    $loginoutsTable
}

function getStartupShutdownLogs($days)
{
    $startups = Get-WinEvent -LogName System | Where-Object { $_.Id -eq 6005 -or $_.Id -eq 6006}

    $startupsTable = @()

    for ($i=0; $i -lt $startups.Count; $i++)
    {
        $event = ""

        if ($startups[$i].ID -eq 6005) {$event = "Startup"}
        if ($startups[$i].ID -eq 6006) {$event = "Shutdown"}

        

        $startupsTable += [pscustomobject]@{"Time" = $startups[$i].TimeCreated; `
                                            "Id" = $startups[$i].Id; `
                                            "Event" = $event; `
                                            "User" = "System";
                                            }
    }

    $startupsTable
}

