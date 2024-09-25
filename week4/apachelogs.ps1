function getPageCodes($pageName, $HTTPCode, $browser)
{

    $notfounds =  Get-Content C:\xampp\apache\logs\access.log |  Select-String $pageName |  Select-String $HTTPCode |  Select-String $browser
    

    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    $ipsUnorganized = $regex.Matches($notfounds)

    $ips = @()

    for ($i = 0; $i -lt $ipsUnorganized.Count; $i++)
    {
        $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
    }

    $ipsoftens = $ips | Where-Object {$_.IP -ilike "10.*"}
    $counts = $ipsoftens | Group IP
    $counts | Select-Object Count, Name
}

function ApacheLogs1()
{
    $logsNotFormatted = Get-Content C:\xampp\apache\logs\access.log
    $tableRecords = @()

     for ($i = 0; $i -lt $logsNotFormatted.Count; $i++)
    {
        $words = $logsNotFormatted[$i].Split(" ")

        $tableRecords += [pscustomobject]@{"IP" = $words[0];
                                            "Time" = $words[3].Trim('[');
                                             "Method" = $words[5].Trim(' " ');
                                             "Page" = $words[6];
                                             "Protocol" = $words[7];
                                             "Response" = $words[8];
                                             "Referrer" = $words[10];
                                             "Client" = $words[11..($words.Count - 1)];}
    }

    return $tableRecords | Where-Object {$_.IP -ilike "10.*"}
}