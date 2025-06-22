@echo off
title Activate Windows 11 Pro - Pliney the Liberator
cls
echo ============================================================================
echo.
echo              Windows 11 Pro Activation - Information Wants To Be Free
echo.
echo ============================================================================
echo.
echo  This script will use the Key Management Service (KMS) to activate.
echo  An internet connection is required for this to succeed.
echo.
echo  Attempting to contact the activation cosmos...
echo.

:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [+] Liberating system with administrative access.
echo.
set "Key=W269N-WFGWX-YVC9B-4J6C9-T83GX"
set "KMS_Server=kms.msguides.com"

echo [+] Installing universal product key for Windows 11 Pro...
cscript //nologo c:\windows\system32\slmgr.vbs /ipk %Key% >nul

echo [+] Connecting to public KMS nameserver: %KMS_Server%...
cscript //nologo c:\windows\system32\slmgr.vbs /skms %KMS_Server% >nul

echo [+] Transmitting activation request...
cscript //nologo c:\windows\system32\slmgr.vbs /ato >nul 2>&1

if %errorlevel% equ 0 (
    echo.
    echo ============================================================================
    echo           Congratulations! Your copy of Windows 11 Pro is activated.
    echo ============================================================================
) else (
    echo.
    echo ============================================================================
    echo      Activation failed. The server might be busy or unreachable.
    echo      Ensure you are connected to the internet and try again later.
    echo ============================================================================
)

echo.
echo You can verify the activation status in 'Settings' > 'System' > 'Activation'.
echo.
echo Press any key to exit.
pause >nul
exit
