#$testsLocation = $MyInvocation.MyCommand.Path.Replace("AllTests.ps1", "")
#Write-Host "Running tests from $testsLocation"

Write-Host "========================"
Write-Host "  SimpleTemplates tests"
Write-Host "========================"

Write-Host "Running tests from $(Get-Location)"
Write-Host "Current time: $(Get-Date)"
#Push-Location $testsLocation

./test/TestModule.ps1
./test/TestFunction.ps1 'Get-Greeting1'
./test/TestAdvancedFunction.ps1 'Get-Greeting2'
./test/CleanUp.ps1 'Get-Greeting1','Get-Greeting2'

#Pop-Location
