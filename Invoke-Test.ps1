Param([Switch]$AppVeyor,[Parameter(Mandatory=$true)][String]$DockerTarget)

$TestName = "PSScriptAnalyzerShouldHaveZeroFindings"
If ($AppVeyor.IsPresent) {
    Add-AppveyorTest -Name $TestName -Outcome Running
}
Write-Information "$TestName Running"

$Results = Invoke-ScriptAnalyzer -Path $pwd -Recurse -ErrorAction SilentlyContinue
If ($Results) {
    $ResultString = $Results | Out-String
    Write-Warning $ResultString
    If ($AppVeyor.IsPresent) { 
        Add-AppveyorMessage -Message "$TestName failed. See test results for more details" -Category Error
        Update-AppveyorTest -Name "$TestName" -Outcome Failed -ErrorMessage $ResultString
    }
    Throw "Fail build: $TestName has findings"
}
Else {
    Write-Information "$TestName passed"
    Update-AppveyorTest -Name "PsScriptAnalyzer" -Outcome Passed
}

docker run $DockerTarget PowerShell -Command "Write-Host 'Pester is working if the next tests fails' ; New-Fixture -Path . -Name Invoke-IShouldFail; Invoke-Pester ./Invoke-IShouldFail* ; Write-Host 'PSScriptAnalyzer is working if it reports 0 rule violations found. Running Invoke-ScriptAnalyzer...' ; Invoke-ScriptAnalyzer -Path . -ReportSummary"