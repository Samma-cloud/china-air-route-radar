param(
    [Parameter(Mandatory = $true)]
    [string]$EnvironmentId
)

$ErrorActionPreference = 'Stop'
$sitePath = $PSScriptRoot

if (-not (Test-Path -LiteralPath (Join-Path $sitePath 'index.html'))) {
    throw "index.html was not found in $sitePath"
}
if (-not (Test-Path -LiteralPath (Join-Path $sitePath 'data.json'))) {
    throw "data.json was not found in $sitePath"
}

npx --yes @cloudbase/cli hosting deploy $sitePath --env-id $EnvironmentId --yes
if ($LASTEXITCODE -ne 0) {
    throw "CloudBase deployment failed with exit code $LASTEXITCODE"
}
