# 9:
$scrapped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.13/ToBeScrapped.html

$scrapped_page.Links.Count

# 10:
$scrapped_page.Links

# 11:
$scrapped_page.Links | select outerText, href

# 12:
$h2s = $scrapped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText

$h2s | Format-Table -AutoSize -Wrap

# 13:
$divs1 = $scrapped_page.ParsedHtml.body.getElementsByTagName("div") | where { $_.getAttributeNode("class").value -ilike "div-1"} | select innerText

$divs1