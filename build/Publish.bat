@echo off

IF NOT DEFINED PROCESSOR_ARCHITEW6432 (
    set PowerShellExecutable="%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
) ELSE (
    set PowerShellExecutable="%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe"
)

set Directory=%~dp0
set Filename=%~n0

:: Script must be run by a powershell of the current system architecture
%PowerShellExecutable% -ExecutionPolicy Bypass -NoLogo -NoProfile -File "%Directory%%Filename%.ps1"

@echo on
