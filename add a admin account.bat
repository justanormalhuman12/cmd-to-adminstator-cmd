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

:: Add a new administrator account
set /P newUsername="your username"
set /P newPassword="your password"

:: Create the new user
net user %newUsername% %newPassword% /add

:: Add the new user to the Administrators group
net localgroup Administrators %newUsername% /add

echo The new administrator account %newUsername% has been created.

pause
