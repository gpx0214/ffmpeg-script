CD /D "%~dp0"
:chcp 65001
:chcp 934
:start
if "%~1"=="" goto end

ffmpeg -i "%~1" -vf crop=3840:5120:0:0 -s 960x1280  "%~dpn1_960_1280.jpg"
:IF EXIST "%~1.jpg" del "%~1"

:pause
shift /1
goto start
:end
