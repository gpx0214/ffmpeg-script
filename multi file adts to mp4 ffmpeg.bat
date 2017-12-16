CD /D "%~dp0"

:start
if "%~1"=="" goto end

ffmpeg -i "%~1" -bsf:a aac_adtstoasc -vcodec copy -acodec copy "%~dpn1.mp4"
:IF EXIST "%~1.mp4" del "%~1"

:pause
shift /1
goto start
:end
