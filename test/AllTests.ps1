#$testsLocation = $MyInvocation.MyCommand.Path.Replace("AllTests.ps1", "")
#Write-Host "Running tests from $testsLocation"

Write-Host "========================"
Write-Host "  SimpleTemplates tests"
Write-Host "========================"

Write-Host "Running tests from $(Get-Location)"
Write-Host "Current time: $(Get-Date)"
#Push-Location $testsLocation

./test/TestModule.ps1
./test/TestFunction.ps1 'Get-Basic'
./test/TestAdvancedFunction.ps1 'Get-Adv'
./test/CleanUp.ps1 'Get-Basic','Get-Basic-a1','Get-Basic-a2'
./test/CleanUp.ps1 'Get-Adv','Get-Adv-a1','Get-Adv-a2'

#Pop-Location
