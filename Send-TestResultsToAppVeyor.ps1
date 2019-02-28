#Requires -Version 5.0
$url="https://ci.appveyor.com/api/testresults/xunit/$($env:APPVEYOR_JOB_ID)"
$path=Resolve-Path .\FullTestResults.xml
(New-Object 'System.Net.WebClient').UploadFile($url, $path)