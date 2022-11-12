@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:PROMPT

SET record_folder="D:\Note_Database\Subject\CPDWG Custom Program Developed With Gidhub\batch_executable\src"
SET record="%record_folder:~1,-1%\record.txt"
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%

ECHO.
ECHO.>> %record%

FOR /F "tokens=* delims=" %%x in (mp4_files_YT.txt) DO (
    ECHO.
    SET file="%%x"
    SET new_file=!file:~0,-5!_compressed.mp4^"
    SET new_filename="%%~nxx"
    ECHO compress_mp4.bat ^>^> processing !file!
    ffmpeg -v quiet -stats -y -i !file! -vcodec h264 -acodec aac !new_file!
    @REM DEL /P !file! @REM extreme dangerous
    DEL !file!
    REN !new_file! !new_filename!
    ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> compressed !file!
    ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> compressed !file!>> %record%
)

ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.
ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.>> %record%

PAUSE
:END
ENDLOCAL

@REM before
@REM D: 578GB
@REM E: 2.9TB
@REM F: 661GB

@REM after
@REM D:
@REM E:
@REM F:

@REM 28873