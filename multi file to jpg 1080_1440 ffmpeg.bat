CD /D "%~dp0"
chcp 65001
:start
if "%~1"=="" goto end

ffmpeg -i "%~1" -vf crop=3840:5120:0:0 -s 1080x1440  "%~dpn1_1080_1440.jpg"
:IF EXIST "%~1.jpg" del "%~1"

:pause
shift /1
goto start
:end
