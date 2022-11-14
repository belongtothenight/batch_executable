@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM ================================================
@REM Main

CALL :NOTICE
CALL :VARIABLES
CALL :WRITE_START
CALL :MAIN
CALL :WRITE_END
CALL :END

@REM ================================================
@REM Functions

:NOTICE
ECHO compress_mp4.bat ^>^> This script is for compressing mp4 files.
ECHO compress_mp4.bat ^>^> ffmpeg and cmdutils are required.
ECHO compress_mp4.bat ^>^> To stop the script, please close the window instead of pressing Ctrl+C.
PAUSE
EXIT /B 0

:VARIABLES
SET record_folder="D:\Note_Database\Subject\CPDWG Custom Program Developed With Gidhub\batch_executable\src"
SET record="%record_folder:~1,-1%\record.txt"
SET filelog=mp4_files_YT.txt
EXIT /B

:WRITE_START
ECHO.>> %record%
EXIT /B

:MAIN
FOR /F "tokens=* delims=" %%x in (%filelog%) DO (
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

        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> processing !file!
        @REM ffmpeg -v quiet -stats -y -i !file! -vcodec libx264 -crf 20 -acodec aac !new_file!
        ffmpeg -v quiet -stats -y -i !file! -vcodec h264 -acodec aac !new_file!
        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> compressed !new_file!

        recycle -f !file!
        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> deleted !new_file!

        REN !new_file! !new_filename!
        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> renamed !new_file!

        FOR /F "delims=" %%I IN ('ffprobe -v error -select_streams v:0 -show_entries format^=size -of default^=nokey^=1:noprint_wrappers^=1 !file! 2^>^&1') DO SET "size2=%%I"

        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> compressed^(byte^) !size1! ^-^> !size2! !file!
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> compressed^(byte^) !size1! ^-^> !size2! !file!>> %record%
    ) ELSE (
        CALL :DATE_TIME mydate,mytime
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> skipped !file!
        ECHO compress_mp4.bat ^>^> !mydate!:!mytime! ^>^> skipped !file!>> %record%
    )
    @REM PAUSE
)
EXIT /B

:WRITE_END
CALL :DATE_TIME mydate,mytime
ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.
ECHO compress_mp4.bat ^>^> %mydate%:%mytime% ^>^> finished compressing mp4 files.>> %record%
EXIT /B

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