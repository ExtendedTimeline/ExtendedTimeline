# Usage:
# .\TechTable.ps1
# .\TechTable.ps1 | ft
#
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt"
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt" | ft
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt" | ft Name,Unlocks,ResearchCost,Year,Categories
#
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt" | where "Categories" -imatch "infantry_tech"
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt" | where "Categories" -imatch "infantry_tech" | ft
# .\TechTable.ps1 | where "Techfile" -eq "infantry.txt" | where "Categories" -imatch "infantry_tech" | ft Name,Unlocks,ResearchCost,Year,Categories
#
# .\TechTable.ps1 | Export-Csv -Path .\AllTech.csv

$Source               = "$ENV:USERPROFILE\Repositories\HoI4\!Workshop\2677872257\"
$Source               = "C:\Users\andre\Repositories\HoI4\UTNH\"

$technologieFiles     = "$Source\common\technologies\*"

# Create table
$table = New-Object System.Data.Datatable
# Adding columns
[void]$table.Columns.Add("Techfile")
[void]$table.Columns.Add("Name")
[void]$table.Columns.Add("Unlocks")
[void]$table.Columns.Add("Units")
[void]$table.Columns.Add("ResearchCost")
[void]$table.Columns.Add("Year")
[void]$table.Columns.Add("Categories")

# Content
$indent                 = 0

$tech                   = ""
$start_year             = ""
$research_cost          = ""

$equipments             = New-Object -TypeName "System.Collections.ArrayList"
$equipments             = [System.Collections.ArrayList]@()
$categorys              = New-Object -TypeName "System.Collections.ArrayList"
$categorys              = [System.Collections.ArrayList]@()
$subunits               = New-Object -TypeName "System.Collections.ArrayList"
$subunits               = [System.Collections.ArrayList]@()

$in_enable_equipments   = $false
$in_enable_subunits     = $false
$in_category            = $false

 Get-ChildItem $technologieFiles | ForEach-Object {
        $techFilePath = $_
        
        $indent = 0
        $tech   = ""
        $start_year = ""
        $equipments.clear()
        $categorys.clear()

        Get-Content $techFilePath | ForEach-Object {
        $_ = $_.trim()
        if ($_.StartsWith("#")) { return }

        if ( $indent -eq 1 ) {
            if ( -not $tech -eq "" ) {
                # if empty
                [string]$str_equipments = if ( -not $equipments.count -gt 0 ) { "-" } else { $equipments -join ", " }
                [string]$str_categorys  = if ( -not $categorys.count  -gt 0 ) { "-" } else { $categorys  -join ", " }
                [string]$str_subunits   = if ( -not $subunits.count  -gt 0 ) { "-" } else { $subunits  -join ", " }
                
                if ( $start_year -eq "" )    { $start_year = "-" }
                if ( $research_cost -eq "" ) { $research_cost = "-" }

                [void]$table.Rows.Add($techFilePath.name, $tech, $str_equipments, $str_subunits, $research_cost, $start_year, $str_categorys)
                
                # Reset
                $tech = ""
                $start_year = ""
                $equipments.clear()
                $categorys.clear()
                $subunits.clear()
            }
        } # inside of main
        
        if ( $_ -like "*{*" ) { $indent += 1 }

        if ( $indent -eq 2 ) {  # inside of tech
            if ( $_ -like "*{*" ) {
                $tech = "$_".Trim()
                $tech = "$tech" -replace " = {.*", ""
            }
        }
        if ( "$_".Contains("start_year = ") )   {
            $start_year = $_ -replace "start_year =", ""
            $start_year = "$start_year" -replace "#.*"
            $start_year = $start_year.Trim()
        }
        if ( "$_".Contains("research_cost = ") )   {
            $research_cost = $_ -replace "research_cost =", ""
            $research_cost = "$research_cost" -replace "#.*"
            $research_cost = $research_cost.Trim()
        }

        if ( $indent -eq 3 ) {  # tech_property = {...}
            if ( "$_".Contains("enable_equipments") )   { $in_enable_equipments = $true }
            if ( "$_".Contains("enable_subunits") )     { $in_enable_subunits   = $true }
            if ( "$_".Contains("categories") )          { $in_category          = $true }
        }
        if ( $in_category ) { 
            if ( -not ($_ -like "*{*" -or $_ -like "*}*") ) {
                $category    = "$_".Trim()
                $categorys.add($category) >$null 2>&1
            }
        }
        if ( $in_enable_equipments ) { 
            if ( -not ($_ -like "*{*" -or $_ -like "*}*") ) {
                $equipment    = "$_".Trim()
                $equipments.add($equipment) >$null 2>&1
            }
        }
        if ( $in_enable_subunits ) { 
            if ( -not ($_ -like "*{*" -or $_ -like "*}*") ) {
                $subunit    = "$_".Trim()
                $subunits.add($subunit) >$null 2>&1
            }
        }

        if ( $_ -like "*}*" ) {
            $indent -= 1

            # exit category
            $in_enable_equipments   = $false
            $in_enable_subunits     = $false
            $in_category            = $false
        }
    }
}

$table
