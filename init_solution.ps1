Write-Host "Updating Git submodule."
git submodule update --init --recursive --quiet

# x86
Write-Host "Creating native x86 project."
$path = "$($PSScriptRoot)/artifacts/bin32"
New-Item -Force -ItemType directory -Path $path
Set-Location -Path $path

cmake ./../../native -DCMAKE_CONFIGURATION_TYPES:STRING="Debug;Release" -G "Visual Studio 17 2022" -A "Win32"

# x64
Write-Host "Creating native x64 project."
$path = "$($PSScriptRoot)/artifacts/bin64"
New-Item -Force -ItemType directory -Path $path
Set-Location -Path $path

cmake ./../../native -DCMAKE_CONFIGURATION_TYPES:STRING="Debug;Release" -G "Visual Studio 17 2022" -A "x64"

# return
Set-Location -Path $PSScriptRoot
