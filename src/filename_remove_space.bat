@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@SET l1=This file turn spaces in filename into "_".
@SET l2=Make sure you want to do this.
ECHO.
ECHO video_cut_sample.bat^>^> %l1%
ECHO video_cut_sample.bat^>^> %l2%
ECHO.

@REM 1. Set parameters
@REM SET folder="C:\Users\dachu\Videos\Minecraft"
SET /P folder=video_cut_sample.bat^>^> Please input the folder path: 
SET recordfile=record.txt
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%
ECHO.>>%folder%\%recordfile%

@REM 2. Process filename
FOR /F "tokens=*" %%a IN ('dir /b %folder%') DO (
    SET filename=%%a
    SET newname=!filename: =_!
    ECHO filename_remove_space.bat^>^> %mydate%:%mytime% ^>^> rename !filename! ^>^> !newname!>>%folder%\%recordfile%
    SET filename="%folder%\!filename!"
    REN !filename! !newname!
)

ECHO.
ECHO filename_remove_space.bat^>^> %mydate%:%mytime% ^>^> Finished renaming files.
ECHO.
PAUSE
:END