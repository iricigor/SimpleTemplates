Describe 'Import-Module' {

    BeforeAll {
        Import-Module ./bin/Debug/netstandard2.0/SimpleTemplates.dll -Force
    }

    It 'There should be two new functions created' {
        $functions = Get-Command -module SimpleTemplates
        $functions | Should -HaveCount 2
    }
}

