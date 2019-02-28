#Requires -Version 5.0
$url="https://ci.appveyor.com/api/testresults/xunit/$($env:APPVEYOR_JOB_ID)"
Write-Output "Uploading test results to $url"
$path=Resolve-Path .\FullTestResults.xml
Write-Output "Uploading test results from $path"
(New-Object 'System.Net.WebClient').UploadFile($url, $path)