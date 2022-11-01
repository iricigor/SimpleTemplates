Write-Host "========================"
Write-Host "  SimpleTemplates tests"
Write-Host "========================"

Write-Host "Running tests from $(Get-Location)"
Write-Host "Tests start time: $(Get-Date)`n"

Invoke-Pester -Path @('./test/Module.Tests.ps1', './test/functions/*') -Output Detailed

Write-Host "`nTests end time: $(Get-Date)"