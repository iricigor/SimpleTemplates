Write-Host "========================"
Write-Host "  SimpleTemplates tests"
Write-Host "========================"

Write-Host "Running tests from $(Get-Location)"
Write-Host "Current time: $(Get-Date)`n"

Invoke-Pester -Path @('./test/Module.Tests.ps1', './test/functions/*') -Output Detailed
