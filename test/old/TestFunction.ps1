param([string]$FunctionName)
Write-Host "========================"
Write-Host "  New-STFunction tests"
Write-Host "========================"

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

# testing arrays of functions
"$FunctionName-a1","$FunctionName-a2" | New-STFunction -Verbose