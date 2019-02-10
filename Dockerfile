FROM microsoft/servercore:10.0.14393.2665
RUN PowerShell -Command Install-Module -Name "PSScriptAnalyzer" -Force -SkipPublisherCheck
RUN PowerShell -Command Install-Module -Name "Pester" -Force -SkipPublisherCheck
