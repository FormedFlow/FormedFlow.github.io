@echo off
setlocal enabledelayedexpansion
 
cls
echo ----------------------------------------------
echo LoL RADS Registry Fixer by PersianMG (https://mohammadg.com/)
echo ----------------------------------------------
 
:: Ask for 64bit or 32 bit
:getArch
set /p "targetArch=Are you on a 32bit or 64bit machine [enter 32 or 64]?: "
 
if %targetArch% NEQ 32 (
  if %targetArch% NEQ 64 (
    echo "Invalid architecture."
    goto getArch
  )
)
 
:: Get LoL Directory Path
:getPath
set /p "lolpath=What path is League of Legends installed in? [ie: C:\Riot Games\League of Legends]: "
 
:: Check for valid path
if ["%lolpath%"] == [] (
  echo Empty path is not allowed.
  goto getPath
)
 
if not exist "%lolpath%" (
  echo Path points to folder that does not exist.
  goto getPath
)
 
:: Add /rads to path
set lolpath=%lolpath%\RADS
echo Key values will be set to the following RADS path: %lolpath% & echo.
 
:: Add 32 bit registry keys
if %targetArch% EQU 32 (
 
  echo Fixing key: HKCR\VirtualStore\MACHINE\SOFTWARE\Riot Games\RADS
  reg add "HKCR\VirtualStore\MACHINE\SOFTWARE\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
 
  echo Fixing key: HKCU\SOFTWARE\Riot Games\RADS
  reg add "HKCU\SOFTWARE\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
 
  echo Fixing key: HKLM\SOFTWARE\Riot Games\RADS
  reg add "HKLM\SOFTWARE\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
)
 
:: Add 64 bit registry keys
if %targetArch% EQU 64 (
 
  echo Fixing key: HKCR\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Riot Games\RADS
  reg add "HKCR\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
 
  echo Fixing key: HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Riot Games\RADS
  reg add "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
  
  echo Fixing key: HKCU\SOFTWARE\Riot Games\RADS
  reg add "HKCU\SOFTWARE\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
  
  echo Fixing key: HKLM\SOFTWARE\Wow6432Node\Riot Games\RADS
  reg add "HKLM\SOFTWARE\Wow6432Node\Riot Games\RADS" /v LocalRootFolder /t REG_SZ /d "%lolpath%" /f & echo.
)
 
echo All keys fixed!
 
@pause