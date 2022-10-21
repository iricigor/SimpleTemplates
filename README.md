# Simple Templates

This project is aimed to create set of simple PowerShell cmdlets in C# that would assist developers in writing PowerShell modules.

## Commands

Planned list of commands is:
- `New-STFunction` - creates simple PowerShell function
- `New-STAdvancedFunction` - create PS function with begin, process and end blocks
- `New-STTestCase` - creates a Pester test case

Ultimatelly, all of this will be followed by `New-STModule` and maybe more (pipelines, documentation, etc.)

Project is done in scope of Hacktoberfest 2022

## Tasks list

- [Currently worked on tasks ![GitHub milestone](https://img.shields.io/github/milestones/progress-percent/iricigor/Simple-Templates/2?style=plastic)](https://github.com/iricigor/Simple-Templates/milestone/2)
- [All tasks  ](https://github.com/iricigor/Simple-Templates/issues)
![GitHub issues](https://img.shields.io/github/issues/iricigor/Simple-Templates?style=plastic)
![GitHub closed issues](https://img.shields.io/github/issues-closed/iricigor/Simple-Templates?style=plastic)
- [Open a new issue](https://github.com/iricigor/Simple-Templates/issues/new/choose)


## Links

- https://hacktoberfest.com/
- [Using C# to Create PowerShell Cmdlets: The Basics @red-gate.com](https://www.red-gate.com/simple-talk/development/dotnet-development/using-c-to-create-powershell-cmdlets-the-basics/)
- [How to create a Standard Library binary module @learn.microsoft.com](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/create-standard-library-binary-module?view=powershell-7.2)
- [Using Visual Studio Code to debug compiled cmdlets](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode-for-debugging-compiled-cmdlets)

## Similar projects
- https://github.com/PowershellFrameworkCollective/psframework - active
- https://github.com/PowerShellOrg/Plaster - legendary, but last PR in 2021
- https://github.com/PoshCode/ModuleBuilder - last release in 2020

## Initial project creation

Run `dotnet` commands:

```batch
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
dotnet new psmodule
dotnet new gitignore
dotnet build
```

Then, verify it in PowerShell:
```powershell
Import-Module '.\bin\Debug\netstandard2.0\Simple_Templates.dll'
Get-Module 'Simple_Templates'
Test-SampleCmdlet 12
```

It should generate output similar to this:
```
FavoriteNumber FavoritePet
-------------- -----------
            12 Dog
```
