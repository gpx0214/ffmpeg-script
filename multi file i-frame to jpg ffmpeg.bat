CD /D "%~dp0"
:start
if "%~1"=="" goto end

ffmpeg -i "%~1" -vf select="eq(pict_type\,I)" -vsync 0 "%~dpn1%%04d.jpg"

:pause
shift /1
goto start
:end
