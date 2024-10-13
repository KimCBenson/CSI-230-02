function openChrome()
{
    # chrome
    $chrome = Get-Process chrome -ErrorAction SilentlyContinue

    # if chrome is running, kill it
    if ($chrome)
    {
        $chrome.Kill()
    }

    # if no chrome running, open it and direct to champlain.edu
    else
    {
        Start-Process "chrome" "https://champlain.edu"
    }
}