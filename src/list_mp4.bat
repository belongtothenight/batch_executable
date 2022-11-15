@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:PROMPT

@REM ================================================
@REM Main

CALL :STARTPROCESS

FOR /L %%L IN (1,1,100) DO (
    CALL :VARIABLES directory,record,mp4log,mode
    ECHO list_mp4.bat ^>^> run: %%L
    @REM ECHO !directory!
    @REM ECHO !record!
    @REM ECHO !mp4log!
    @REM ECHO !mode!
    ECHO.

    IF /I "!mode!"=="S" (
        CALL :SINGLELAYERPROCESS !directory!
    ) ELSE IF /I "!mode!"=="M" (
        CALL :MULTILAYERPROCESS !directory!
    ) ELSE (
        ECHO list_mp4.bat ^>^> invalid mode
        ECHO list_mp4.bat ^>^> typed: !mode!
    )
    
    ECHO.
    SET /P ANS=list_mp4.bat ^>^> Do you want to continue? ^(Y/[N]^)? 
    IF /I "!ANS!" NEQ "Y" (
        CALL :ENDPROCESS
        GOTO :END
    )
    ECHO.
)

ECHO list_mp4.bat ^>^> maximum runtime reached, exiting...
CALL :ENDPROCESS
GOTO :END

@REM ================================================
@REM Main Functions

:STARTPROCESS
ECHO list_mp4.bat ^>^> This script is for listing mp4 files.
PAUSE
ECHO.
EXIT /B

:VARIABLES
SET /P directory=list_mp4.bat ^>^> MP4 directory: 
SET record="%directory%\record.txt"
SET mp4log="%directory%\mp4_files.txt"
SET /P mode=list_mp4.bat ^>^> Mode selection: Single-layer or Multi-layer ^(S/M/[N]^)? 
SET %~1=%directory%
SET %~2=%record%
SET %~3=%mp4log%
SET %~4=%mode%
EXIT /B

:SINGLELAYERPROCESS
SET directory=%~1
@REM ECHO %directory%
FOR /F "delims=" %%F in ('dir /b /a-d "%directory%"') DO (
    SET file=%%F
    SET format=!file:~-4!
    IF "!format!"==".mp4" (
        ECHO %directory%\!file!
        ECHO %directory%\!file!>> %mp4log%
    )
)
EXIT /B

:MULTILAYERPROCESS
SET directory="%~1"
@REM ECHO %directory%
FOR /F "delims=" %%F in ('dir /b /s /a-d %directory%') DO (
    @REM ECHO %%F
    SET file=%%F
    SET format=!file:~-4!
    IF "!format!"==".mp4" (
        ECHO !file!
        ECHO !file!>> %mp4log%
    )
)
EXIT /B

:ENDPROCESS
CALL :DATE_TIME mydate,mytime
ECHO.>> %record%
ECHO list_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished exporting log of mp4 files.
ECHO list_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished exporting log of mp4 files.>> %record%
EXIT /B

@REM ================================================
@REM Functions

:DATE_TIME
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%
@REM ECHO %mydate%:%mytime%
SET %~1=%mydate%
SET %~2=%mytime%
@REM ECHO %~1:%~2
EXIT /B

:END
PAUSE
ENDLOCAL