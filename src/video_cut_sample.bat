@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:PROMPT

@SET l1=This file cut first few seconds of video file and save it as new file.
@SET l2=FFmpeg is required.
ECHO.
ECHO video_cut_sample.bat^>^> %l1%
ECHO video_cut_sample.bat^>^> %l2%
ECHO.

@REM 1. Set parameters
SET /P "srcfolder=video_cut_sample.bat^>^> Please input the source folder path: "
SET srcfolder=%srcfolder%\ 
SET /P "dstfolder=video_cut_sample.bat^>^> Please input the destination folder path: "
SET dstfolder=%dstfolder%\ 
SET /P startsecond=video_cut_sample.bat^>^> Please input the cut start in second: 
SET /P durationsecond=video_cut_sample.bat^>^> Please input the cut duration in second: 
SET recordfile=record.txt
FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%

@REM 2. Display all files in folder.
SET /A "len=0"
SET filelist=
FOR /F "delims=|" %%a IN ('dir /b %srcfolder%') DO (
    SET filename="%%a"
    SET format="!filename:~-4,-1!"
    @REM ECHO !format!
    IF "!format!"==""mp4"" (
        SET /A "len+=1"
        SET filelist=!filelist! !filename!
    ) ELSE (
        @REM ECHO skip !filename!
    )
)
ECHO.
ECHO video_cut_sample.bat^>^> available videos: 
ECHO.
FOR %%a IN (%filelist%) DO (
    ECHO %%a
)
ECHO.

ECHO video_cut_sample.bat^>^> total processing file: !len!
ECHO.

SET /P AREYOUSURE=video_cut_sample.bat^>^> cut the Videos (Y/[N]) ?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
ECHO.

@REM 3. Process filepath
@REM get src file path
SET srcfilelist=
ECHO video_cut_sample.bat^>^> source file path:
ECHO.
FOR %%a IN (%filelist%) DO (
    SET filename_temp=%%a
    SET filename_temp=^"%srcfolder:~0,-1%!filename_temp:~1%!
    SET srcfilelist=!srcfilelist! !filename_temp!
)
@REM FOR %%a IN (%srcfilelist%) DO (
@REM     ECHO %%a
@REM )
ECHO.

@REM get dst file path
SET newfilelist=
ECHO video_cut_sample.bat^>^> export file path:
ECHO.
FOR %%a IN (%filelist%) DO (
    SET filename_temp="%%a"
    SET filename_temp=^"%dstfolder:~0,-1%!filename_temp:~2,-6!_cut%startsecond%-%durationsecond%.mp4^"
    SET newfilelist=!newfilelist! !filename_temp!
)
@REM FOR %%a IN (%newfilelist%) DO (
@REM     ECHO %%a
@REM )
ECHO.

@REM trim left space of list
SET "srcfilelist=%srcfilelist:~1%"
SET "newfilelist=%newfilelist:~1%"

@REM convert list to array
SET "i=0"
SET "srcfilelist[!i!]=%srcfilelist: =" & SET /A i+=1 & SET "srcfilelist[!i!]=%"
SET "i=0"
SET "newfilelist[!i!]=%newfilelist: =" & SET /A i+=1 & SET "newfilelist[!i!]=%"
SET "i="

@REM 4. Cut video and export log.
ECHO video_cut_sample.bat^>^> start cutting videos.
ECHO.>>%dstfolder:~0,-1%^%recordfile%
SET /A "len-=1"
FOR /L %%a IN (0, 1, %len%) DO (
    ECHO video_cut_sample.bat^>^>  %mydate%:%mytime% ^>^> cut !srcfilelist[%%a]! to !newfilelist[%%a]!>>%dstfolder:~0,-1%^%recordfile%
    ffmpeg -ss %startsecond% -i !srcfilelist[%%a]! -t %durationsecond% -c copy !newfilelist[%%a]!
)

@REM 5. END
ECHO.
ECHO video_cut_sample.bat^>^> %mydate%:%mytime% ^>^> All files are copied.
ECHO.
PAUSE
:END
ENDLOCAL