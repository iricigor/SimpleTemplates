BeforeAll {
    Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
}

Describe 'Import-Module' {
    It 'There should be two new functions created' {
        $functions = Get-Command -module SimpleTemplates
        $functions.Count | Should -Be 2
    }
}

