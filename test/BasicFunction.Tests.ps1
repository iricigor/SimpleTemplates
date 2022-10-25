BeforeAll {
    Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force

    $FunctionsArrayNames = 'Get-BF1','Get-BF2'
    $FunctionsArrayFiles = $FunctionsArrayNames | ForEach-Object { "$_.ps1" }

}

Describe 'File creation' {

    BeforeAll {
        $FunctionName = 'Get-BF'
        $FunctionFile = "$FunctionName.ps1"
        Set-Location 'TestDrive:\'
        New-STFunction -FunctionName $FunctionName
        . ./$FunctionFile
    }

    It 'There should be a new file created' {
        $FunctionFile | Should -Exist
    }

    It 'There should be no file without extension' {
        $FunctionName | Should -Not -Exist
    }
}

Describe 'File content' {

    It 'Should declare a function' {
        . ./$FunctionFile
        Get-Command $FunctionName | Should -Not -BeNullOrEmpty
    }

    It 'Function should have valid help' {
        . ./$FunctionFile
        Get-Help $FunctionName | Should -Not -BeNullOrEmpty
    }

}

Describe 'Pipeline input' {
    It 'Should accept an array' {
        $FunctionsArrayNames | New-STFunction
    }
}

AfterAll {
    Remove-Item $FunctionFile -Force -ErrorAction SilentlyContinue
}
