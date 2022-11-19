@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM ================================================
@REM Main

CALL :NOTICE
CALL :VARIABLES
CALL :WRITE_START
CALL :MAIN
CALL :WRITE_END
GOTO :END

@REM ================================================
@REM Functions

:NOTICE
EXIT /B 0

:VARIABLES
SET /P filepath=compress_video.bat ^>^> Absolute path of the video file log: 
SET /P remove_log=compress_video.bat ^>^> Remove log (y/[n])? 
SET /P recycle=compress_video.bat ^>^> Recycle but delete (y/[n])? 
SET system=^-windows

ECHO %filepath%
ECHO %remove_log%
ECHO %recycle%
ECHO %system%

IF /I "%remove_log%" NEQ "y" (
    SET %remove_log%=
) ELSE (
    SET %remove_log%=^-remove_log
)
IF /I "%recycle%"=="y" (
    SET %recycle%=-recycle
) ELSE (
    SET %recycle%=-del
)

SET cmd="python compress_video.py %filepath% %system% %remove_log% %recycle%"

ECHO %filepath%
ECHO %remove_log%
ECHO %recycle%
ECHO %cmd%

EXIT /B 0

:WRITE_START
EXIT /B 0

:MAIN

EXIT /B 0

:WRITE_END
EXIT /B 0

:END
PAUSE
ENDLOCAL