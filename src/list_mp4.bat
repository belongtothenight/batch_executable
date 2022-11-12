@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:PROMPT

CALL :VARIABLES

ECHO.
ECHO.>> %record%

CALL :TREEPROCESS %d1%
CALL :TREEPROCESS %d2%
CALL :TREEPROCESS %d3%
@REM CALL :TREEPROCESS %d4%
@REM CALL :TREEPROCESS %d5%
@REM CALL :TREEPROCESS %d6%

ECHO folder_contain_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished exporting log of mp4 files.
ECHO folder_contain_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished exporting log of mp4 files.>> %record%
PAUSE
GOTO :END

:VARIABLES
SET record_folder="D:\Note_Database\Subject\CPDWG Custom Program Developed With Gidhub\batch_executable\src"
SET record="%record_folder:~1,-1%\mp4_files.txt"
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%
SET d1="D:\"
SET d2="E:\"
SET d3="F:\"
@REM SET d1="D:\Note_Database\YouTube"
@REM SET d2="D:\Note_Database\Subject"
@REM SET d3="E:\Note_Database\YouTube"
@REM SET d4="E:\Note_Database\Subject"
@REM SET d5="F:\Note_Database\YouTube"
@REM SET d6="F:\Note_Database\Subject"
EXIT /B

:TREEPROCESS
SET directory="%~1"
ECHO %directory%
FOR /F "delims=" %%F in ('dir /b /s /a-d %directory%') DO (
    @REM ECHO %%F
    SET file=%%F
    SET format=!file:~-4!
    IF "!format!"==".mp4" (
        ECHO !file!
        ECHO !file!>> %record%
    )
)
EXIT /B


:END
ENDLOCAL