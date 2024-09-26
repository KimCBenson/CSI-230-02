. (Join-Path $PSScriptRoot champlainclassscraper.ps1)

$FullTable = gatherClasses

# $FullTable | Select "Class Code", Instructor, Days, "Time Start", "Time End" | where {$_."Instructor" -ilike "Furkan Paligu"}

# $FullTable |  Where { ($_.Location -ilike "JOYC 310") -and ($_.days -ilike "Monday")} | Sort-Object "Time Start" | Select "Time Start", "Time End", "Class Code"


$ITSInstructors = $FullTable | Where { ($_."Class Code" -ilike "SYS*") -or `
                                       ($_."Class Code" -ilike "NET*") -or `
                                       ($_."Class Code" -ilike "SEC*") -or `
                                       ($_."Class Code" -ilike "FOR*") -or `
                                       ($_."Class Code" -ilike "CSI*") -or `
                                       ($_."Class Code" -ilike "DAT*") } | Select "Instructor" | Sort-Object "Instructor" -Unique
                                        
$FullTable | Where { $_.Instructor -in $ITSInstructors.Instructor } | Group "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending