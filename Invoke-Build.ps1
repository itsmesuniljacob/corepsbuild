#Requires -Version 5.0
#Requires -Modules PSScriptAnalyzer, Pester
#Requires -Modules @{ ModuleName="PSScriptAnalyzer"; ModuleVersion="1.16" }
#Requires -Modules @{ ModuleName="Pester"; ModuleVersion="4.0" }
Param([Parameter(Mandatory=$true)][String]$DockerTarget)
Write-Output "Run static analysis test"
$result = Invoke-Pester ./StaticAnalysis* -PassThru -OutputFile StaticAnalysisTestResults.xml -OutputFormat NUnitXml
If ($result.FailedCount -ne 0) {
    Write-Output "Static analysis test failed - aborting build"
    Exit $result.FailedCount
}
Write-Output "Build docker image as $DockerTarget"
docker build -t $DockerTarget .
Write-Output "Build complete"