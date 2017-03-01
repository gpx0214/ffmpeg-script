CD /D "%~dp0"
:chcp 65001
:chcp 934
:start
if "%~1"=="" goto end

ffmpeg -i "%~1" -vf crop=5120:3840:0:0 -s 1280x960  "%~dpn1_1280_960.jpg"
:IF EXIST "%~1.jpg" del "%~1"

:pause
shift /1
goto start
:end
