@echo off
setlocal enabledelayedexpansion

:: Specify the path to your .env file
set ENV_FILE_PATH=E:\Softwares\setting_env_vars\.env

:: Read each line from the .env file
for /f "delims=" %%a in ('type "%ENV_FILE_PATH%"') do (
    :: Split the line into KEY and VALUE
    set "line=%%a"
    for /f "tokens=1* delims==" %%b in ("!line!") do (
        set KEY=%%b
        set VALUE=%%c
        :: Set the environment variable using setx for system-wide, replace with set for current session
        setx !KEY! !VALUE!
    )
)

echo Environment variables have been set.