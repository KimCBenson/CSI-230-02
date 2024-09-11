Get-Process | Where-Object {
    $process_path = (Get-WmiObject Win32_Process -Filter "ProcessId=$($_.Id)").ExecutablePath
    $process_path -notmatch "system32"
} | Select-Object Name, Id, @{Name='Path';Expression={$process_path}}