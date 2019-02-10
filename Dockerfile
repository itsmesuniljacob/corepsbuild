FROM microsoft/windowsservercore
RUN PowerShell -Command Install-Module -Name "PSScriptAnalyzer" -Force -SkipPublisherCheck
RUN PowerShell -Command Install-Module -Name "Pester" -Force -SkipPublisherCheck
