#Requires -Version 5.0
Param([Parameter(Mandatory=$true)][String]$DockerTarget)
Write-Output "Deploy container $DockerTarget"
docker push $DockerTarget
Write-Output "Deploy complete"