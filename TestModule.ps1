# basic verification of module functionality
# used after the module is built
Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
Get-Command -Module SimpleTemplates

# Note: Do not remove those tests, add them to the Pester later!


# Basic functionality test
$FunctionName = 'Get-Greeting'
$FunctionFile = "$FunctionName.ps1"

New-STFunction $FunctionName
if (Get-Item $FunctionFile) {
    Write-Host "Function file created: $FunctionFile"
    Remove-Item $FunctionFile
} else {
    Write-Host "Function file not created: $FunctionFile"
}