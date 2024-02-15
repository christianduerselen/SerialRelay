param (
	[string] $buildConfig = "Release",
	[string] $publishOutputPath = "$PSScriptRoot\..\bin\Publish"
)

# Import helper script
. "$PSScriptRoot\Helper.ps1"

##########
### Check/Change current directory

if ($PSScriptRoot -eq (Get-Location))
{
	Split-Path -Path $PSScriptRoot -Parent | Set-Location
}

##########
### PUBLISH
Write-Host "`nPublishing project...`n"
Invoke-NativeCommand dotnet publish --configuration $buildConfig  "$PSScriptRoot\..\src\SerialRelay\SerialRelay.csproj" /p:DebugType=None /p:DebugSymbols=false --output "$publishOutputPath"
