Write-Output "Closing Roblox..."
taskkill /f /im RobloxPlayerBeta.exe
$location = Get-ChildItem "$env:LOCALAPPDATA\Roblox\Versions\" -Directory
$targetFps = Read-Host "Enter the target FPS"
$json = @"
{
    "DFIntTaskSchedulerTargetFps": $targetFps
}
"@
#Set-Content -Path "$env:LOCALAPPDATA\Roblox\Versions\$folder\ClientSettings\ClientAppSettings.json" -Value $json
foreach ($folder in $location) {Set-Content -Path "$env:LOCALAPPDATA\Roblox\Versions\$folder\ClientSettings\ClientAppSettings.json" -Value $json -erroraction 'silentlycontinue'}
