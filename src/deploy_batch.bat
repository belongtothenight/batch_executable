@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM Notices
SET l1=This file copys all files here to PATH directory.
SET l2=Only batch files are copied.
SET l3=****All files will be overwrited****
ECHO.
ECHO deploy_batch.bat^>^> %l1%
ECHO deploy_batch.bat^>^> %l2%
ECHO deploy_batch.bat^>^> %l3%
ECHO.

@REM 1. Set parameters
SET dstfolder="C:\bat"
SET srcfolder="D:\Note_Database\Subject\CPDWG Custom Program Developed With Gidhub\batch_executable\src"
SET recordfile=record.txt
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%

@REM 2. Display all files in folder.
CALL dir
PAUSE

@REM 3. Copy all files and export log.
ECHO.>>%srcfolder%\%recordfile%
FOR /F "tokens=*" %%a IN ('dir /b %srcfolder%') DO (
    SET filename=%%a
    SET format=!filename:~-3!
    IF "!format!"=="bat" (
        ECHO deploy_batch.bat^>^> %mydate%:%mytime% ^>^> copying !filename!>>%srcfolder%\%recordfile%
        SET srcfile=%srcfolder%\!filename!
        COPY /Y !srcfile! "%dstfolder%"
    ) ELSE (
        ECHO deploy_batch.bat^>^> %mydate%:%mytime% ^>^> skipping !filename!>>%srcfolder%\%recordfile%
    )
    
)

ECHO.
ECHO deploy_batch.bat^>^> %mydate%:%mytime% ^>^> All files are copied. >>%srcfolder%\%recordfile%
PAUSE