# basic verification of module functionality
# used after the module is built
Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
Get-Command -Module SimpleTemplates
New-STFunction 12