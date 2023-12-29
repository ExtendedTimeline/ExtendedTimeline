
$modPath = $PSScriptRoot
$modPath = Split-Path -Path $modPath -Parent
$modName = Split-Path (Split-Path $PSScriptRoot) -Leaf

$hoiModPath = "$env:USERPROFILE\Documents\Paradox Interactive\Hearts of Iron IV\mod"
$pdxModPathName = Join-Path $hoiModPath $modName

New-Item -itemtype Junction `
    -path "$hoiModPath" `
    -name "$modName`_Release" `
    -value "$modPath\release\$modName" `
    -force #>$null 2>&1

Copy-Item "$modPath\descriptor.mod" "$hoiModPath\$modName`_Release.mod"
(Get-Content "$hoiModPath\$modName`_Release.mod") -replace ('name=.*', 'name="Tiberium Spread Mechanic Release"') | Set-Content "$hoiModPath\$modName`_Release.mod"
(Get-Content "$hoiModPath\$modName`_Release.mod") -replace ('path=.*', "path=`"mod/$modName`_Release`"") | Set-Content "$hoiModPath\$modName`_Release.mod"
(Get-Content "$hoiModPath\$modName`_Release.mod") -replace ("remote_file_id.*", '') | Set-Content "$hoiModPath\$modName`_Release.mod"

