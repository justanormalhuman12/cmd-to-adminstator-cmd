@echo off
:: Check for Administrator rights
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with Administrator rights.
) else (
    echo Requesting Administrator rights...
    :: Re-launch the batch file with administrator rights
    PowerShell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /B
)

:: Your main script here
echo Hello, World! This script is running with Administrator privileges.
pause