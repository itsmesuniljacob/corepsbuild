Function Invoke-DockerRun {
    Param([Parameter(Mandatory=$true)][String]$Command)
    docker run $DockerTarget PowerShell -Command "$Command"
}
Describe "container" {
    It "should have at least one nuget package provider installed" {
        $result = Invoke-DockerRun -Command "Write-Output (Get-PackageProvider -ListAvailable -Name NuGet).Count"
        $result | Should -BeGreaterThan 0
    }
    It "should have at least one Pester module installed" {
        $result = Invoke-DockerRun -Command "Write-Output (Get-Module -ListAvailable -Name Pester).Count"
        $result | Should -BeGreaterThan 0
    }
    It "should have at least one PSScriptAnalyzer module installed" {
        $result = Invoke-DockerRun -Command "Write-Output (Get-Module -ListAvailable -Name PSScriptAnalyzer).Count"
        $result | Should -BeGreaterThan 0
    }
}