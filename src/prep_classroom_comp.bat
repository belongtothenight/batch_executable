@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM ================================================
@REM Main

CALL :DISPLAY_MSG
CALL :SETTING
CALL :EXEC_SETTING
CALL :END

@REM ================================================
@REM Functions

:DISPLAY_MSG
    CLS
    ECHO.
    ECHO Starting prep_classroom_comp.bat ......
    EXIT /B 0

:SETTING
    ECHO.
    SET /P              launch_OBS=1. NOT Launch OBS              (y/[n])?
    SET /P         open_i_learning=2. NOT Open i-Learning         (y/[n])?
    SET /P            open_i_touch=3. NOT Open i-Touch            (y/[n])?
    SET /P       open_google_drive=4. NOT Open Google Drive       (y/[n])?
    SET /P     open_youtube_studio=5. NOT Open YouTube Studio     (y/[n])?
    EXIT /B 0

:EXEC_SETTING
    ECHO.
    ECHO Launching ......
    IF /I NOT "%launch_OBS%"=="y" (
        CD /D "C:\Program Files\obs-studio\bin\64bit\
        START "OBS" obs64.exe
        ECHO Launched OBS at C:\Program Files\obs-studio\bin\64bit
    )
    IF /I NOT "%open_i_learning%"=="y" (
        START "i-Learning" "https://i-learning.cycu.edu.tw/"
        ECHO Launched i-Learning at https://i-learning.cycu.edu.tw/
    )
    IF /I NOT "%open_i_touch%"=="y" (
        START "i-Touch" "https://itouch.cycu.edu.tw/"
        ECHO Launched i-Touch at https://itouch.cycu.edu.tw/
    )
    IF /I NOT "%open_google_drive%"=="y" (
        START "Google Drive" "https://drive.google.com/drive/my-drive"
        ECHO Launched Google Drive at https://drive.google.com/drive/my-drive
    )
    IF /I NOT "%open_youtube_studio%"=="y" (
        START "YouTube Studio" "https://studio.youtube.com/"
        ECHO Launched YouTube Studio at https://studio.youtube.com/
    )
    EXIT /B 0

:END
    ECHO.
    PAUSE
    ENDLOCAL
