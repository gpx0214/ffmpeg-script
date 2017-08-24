CD /D "%~dp0"

:start
if "%~1"=="" goto end

ffplay.exe -autoexit -showmode 2 -x 640 -y 512 "%~1"

shift /1
goto start
:end
:pause
