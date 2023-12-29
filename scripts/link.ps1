
$modPath = $PSScriptRoot
$modPath = Split-Path -Path $modPath -Parent
$modName = Split-Path (Split-Path $PSScriptRoot) -Leaf

$hoiModPath = "$env:USERPROFILE\Documents\Paradox Interactive\Hearts of Iron IV\mod"
$pdxModPathName = Join-Path $hoiModPath $modName

New-Item -itemtype Junction `
    -path "$hoiModPath" `
    -name "$modName`_DevBuild" `
    -value "$modPath" `
    -force #>$null 2>&1

Copy-Item "$modPath\descriptor.mod" "$hoiModPath\$modName`_DevBuild.mod"
(Get-Content "$hoiModPath\$modName`_DevBuild.mod") -replace ("remote_file_id.*", '') | Set-Content "$hoiModPath\$modName`_DevBuild.mod"