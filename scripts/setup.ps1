$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$previousLocation = Get-Location
$previousCacheSetting = $env:MATHLIB_NO_CACHE_ON_UPDATE

try {
    Set-Location -LiteralPath $projectRoot
    $env:Path = "$(Join-Path $env:USERPROFILE '.elan\bin');$env:Path"
    Get-Command elan -ErrorAction Stop | Out-Null

    $toolchain = (Get-Content -LiteralPath 'lean-toolchain' -Raw).Trim()
    & elan toolchain install $toolchain
    if ($LASTEXITCODE -ne 0) { throw 'Lean toolchain installation failed.' }

    # Fetch dependencies first, then run the cache download explicitly once.
    $env:MATHLIB_NO_CACHE_ON_UPDATE = '1'
    & lake update
    if ($LASTEXITCODE -ne 0) { throw 'Lake dependency update failed.' }

    & lake exe cache get
    if ($LASTEXITCODE -ne 0) { throw 'Mathlib cache download failed.' }

    & lake build
    if ($LASTEXITCODE -ne 0) { throw 'Project build failed.' }

    Write-Output 'Lean4Study setup and build completed successfully.'
} finally {
    $env:MATHLIB_NO_CACHE_ON_UPDATE = $previousCacheSetting
    Set-Location -LiteralPath $previousLocation.Path
}
