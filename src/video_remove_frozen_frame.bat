@REM This file can automatically remove the frozen frame of all video file in side designated folder.
@REM FFmpeg is required.
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM video folder
SET folder=C:\Users\dachu\Videos\Minecraft\
@REM log file
SET recordfile=record.txt
@REM ffmped settings
SET hi=100
SET lo=100
SET frac=1
SET max=20

FOR /F "tokens=2" %%i in ('date /t') do set mydate=%%i
SET mytime=%time%

ECHO video_remove_frozen_frame.bat^>^> starting video_remove_frozen_frame.bat
ECHO video_remove_frozen_frame.bat^>^> This file automatically remove the frozen frame of all video file in side designated folder.
ECHO video_remove_frozen_frame.bat^>^> Make sure FFmpeg is installed.
ECHO video_remove_frozen_frame.bat^>^> Make sure the video is located in %folder%
ECHO video_remove_frozen_frame.bat^>^> press CTRL+C to exit
ECHO video_remove_frozen_frame.bat^>^> press ENTER to continue^
PAUSE

ECHO.>>%folder%^%recordfile%
ECHO video_remove_frozen_frame.bat^>^> starting processing>>%folder%^%recordfile%
CALL cd %folder%
CALL dir
ECHO.

FOR /f "delims=|" %%f in ('dir /b %folder%') do (
    ECHO.
    ECHO.
    ECHO ------------------------------------------------------------------------------------
    SET filename=%%f
    SET format=!filename:~-3!
    IF "!format!"=="mp4" (
        SET newfilename=!filename:~0,-4! ffr.mp4
        ECHO video_remove_frozen_frame.bat^>^> processing:        !filename!
        CALL ffmpeg -v quiet -stats -i "!filename!" -vf mpdecimate=hi=%hi%:lo=%lo%%:frac=%frac%:max=%max%,setpts=N/FRAME_RATE/TB -an "!newfilename!"
        ECHO video_remove_frozen_frame.bat^>^> %mydate%:%mytime%  finished:          !newfilename!>>%folder%^%recordfile%
    ) ELSE (
        ECHO video_remove_frozen_frame.bat^>^> format:            !format!
        ECHO video_remove_frozen_frame.bat^>^> %mydate%:%mytime%  skipping:          !filename!>>%folder%^%recordfile%
    )
)
PAUSE