function SendAlertEmail($Body)
{
    $From = "kimberly.benson@mymail.champlain.edu"
    $To = "kimberly.benson@mymail.champlain.edu"
    $Subject = "Suspicious Activity"

    $Password = "varc wuhk eoyb hikn" | ConvertTo-SecureString -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential
}

SendAlertEmail "Body of email"