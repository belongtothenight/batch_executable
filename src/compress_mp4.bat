@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM ================================================
@REM Main

CALL :VARIABLES

ECHO.
ECHO.>> %record%

CALL :MAIN

CALL :END

@REM ================================================
@REM Functions

:VARIABLES
SET record_folder="D:\Note_Database\Subject\CPDWG Custom Program Developed With Gidhub\batch_executable\src"
SET record="%record_folder:~1,-1%\record.txt"
SET filelog=mp4_files_YT.txt
CALL :DATE_TIME
EXIT /B

:MAIN
FOR /F "tokens=* delims=" %%x in (%filelog%) DO (
    CALL :DATE_TIME
    ECHO.
    SET file="%%x"
    SET new_file=!file:~0,-5!_temp.mp4^"
    SET new_filename="%%~nxx"
    SET continue=1

    IF NOT EXIST !file! SET continue=0
    @REM FOR /F "delims=" %%I IN ('ffprobe -v error -select_streams v:0 -show_entries stream^=codec_name -of default^=nokey^=1:noprint_wrappers^=1 !file! 2^>^&1') DO SET "encoding=%%I"
    @REM ECHO Encoding: !encoding!
    @REM IF "!encoding!"=="h264" SET continue=0

    IF !continue!==1 (
        FOR /F "delims=" %%I IN ('ffprobe -v error -select_streams v:0 -show_entries format^=size -of default^=nokey^=1:noprint_wrappers^=1 !file! 2^>^&1') DO SET "size1=%%I"

        ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> processing !file!
        ffmpeg -v quiet -stats -y -i !file! -vcodec libx264 -crf 20 -acodec aac !new_file!
        recycle -f !file!
        REN !new_file! !new_filename!

        FOR /F "delims=" %%I IN ('ffprobe -v error -select_streams v:0 -show_entries format^=size -of default^=nokey^=1:noprint_wrappers^=1 !file! 2^>^&1') DO SET "size2=%%I"

        ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> compressed^(byte^) !size1! ^-^> !size2! !file!
        ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> compressed^(byte^) !size1! ^-^> !size2! !file!>> %record%
    ) ELSE (
        ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> skipped !file!
        ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> skipped !file!>> %record%
    )
    @REM PAUSE
)
ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.
ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.>> %record%
EXIT /B

:DATE_TIME
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%
@REM ECHO %mydate%:%mytime%
EXIT /B

:END
PAUSE
ENDLOCAL