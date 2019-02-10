Param([Parameter(Mandatory=$true)][String]$DockerTarget)
docker run $DockerTarget PowerShell -Command "$PSVersionTable"
