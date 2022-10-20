# basic verification of module functionality
# used after the module is built
Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
Get-Command -Module SimpleTemplates

# Note: Do not remove those tests, add them to the Pester later!


# Basic functionality test
$FunctionName = 'Get-Greeting'
$FunctionFile = "$FunctionName.ps1"

New-STFunction $FunctionName -Verbose
if (!(Get-Item $FunctionFile)) {
    Write-Error "Function file not created: $FunctionFile"
}
Write-Host "Function file created: $FunctionFile"

Write-Host "`nFunction file content:"
Get-Content $FunctionFile

Write-Host "`nExecuting function file..."
. ./$FunctionFile

Write-Host "It should have generate a function $FunctionName"
Get-Command $FunctionName
Get-Help $FunctionName

Write-Host "`nRemoving function file..."
Remove-Item $FunctionFile
