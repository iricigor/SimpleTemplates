Describe 'File creation' {

    BeforeAll {
        Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
        Push-Location 'TestDrive:\'
        $FunctionName = 'Get-BF'
        $FunctionFile = "$FunctionName.ps1"
        New-STFunction -FunctionName $FunctionName
    }

    It 'There should be a new file created' {
        Join-Path 'TestDrive:\' $FunctionFile | Should -Exist
    }

    It 'There should be no file without extension' {
        $FunctionName | Should -Not -Exist
    }

    It 'Should declare a function' {
        . ./$FunctionFile
        Get-Command $FunctionName | Should -Not -BeNullOrEmpty
    }

    It 'Function should have valid help' {
        . ./$FunctionFile
        Get-Help $FunctionName | Should -Not -BeNullOrEmpty
    }

    It 'Should create file in current directory' {
        New-Item 'TestDrive:\' -Name 'Test' -ItemType Directory
        Set-Location 'TestDrive:\Test'
        New-STFunction -FunctionName $FunctionName
        Join-Path 'TestDrive:\Test' $FunctionFile | Should -Exist
    }

    AfterAll {
        Remove-Item $FunctionFile -Force -ErrorAction SilentlyContinue
        Pop-Location
    }
}

Describe 'Pipeline input' {

    BeforeAll {
        Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
        Push-Location 'TestDrive:\'
        $FunctionsArrayNames = 1..3 | ForEach-Object {"Get-BF$_"}
        $FunctionsArrayFiles = $FunctionsArrayNames | ForEach-Object { "$_.ps1" }
    }

    It 'Should accept an array' {
        $FunctionsArrayNames | New-STFunction
    }

    It 'Should create a file for each item in the array' {
        $FunctionsArrayFiles | Should -Exist
    }

    AfterAll {
        Remove-Item $FunctionsArrayFiles -Force -ErrorAction SilentlyContinue
        Pop-Location
    }
}
