param([string[]]$FunctionName)
Write-Host "========================"
Write-Host "  Tests clean up tasks"
Write-Host "========================"

foreach ($F1 in $FunctionName) {
    Write-Host "`nRemoving function file $F1..."
    Remove-Item "$F1.ps1"
}
