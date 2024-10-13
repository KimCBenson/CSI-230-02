# 8:
cd $PSScriptRoot

$files = Get-ChildItem

for ($j = 0; $j -le $files.Count; $j++)
{
    if ($files[$j].FullName -ilike "*ps1")
    {
     Write-Host $files[$j].FullName
    }
 }

# 9:
$folder_path = "$PSScriptRoot\outfolder"

if (Test-Path -Path $folder_path)
{
    Write-Host "Folder Already Exists"
}
else
{
    New-Item -Path $folder_path -Name "outfolder"-ItemType "directory"
}

# 10:
cd $PSScriptRoot

$files = Get-ChildItem -Filter "*.ps1" -Name
$folder_path = "$PSScriptRoot\outfolder\powershellfilelist.csv"

$files | Export-Csv -Path $folder_path

# 11:
$files = Get-ChildItem -Recurse -File
$files | Rename-Item -NewName {$_.Name -replace '.csv', '.log'}
Get-ChildItem -Recurse -File