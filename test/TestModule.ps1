# basic verification of module functionality
# used after the module is built
Write-Host "==============================="
Write-Host "  SimpleTemplate Module tests"
Write-Host "==============================="

Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force

$commands = Get-Command -Module SimpleTemplates
Write-Host "Imported $($commands.Count) commands from SimpleTemplates module: $($commands.Name -join ', ')"


# Note: Do not remove those tests, add them to the Pester later!


