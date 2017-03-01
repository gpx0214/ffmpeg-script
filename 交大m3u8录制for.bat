CD /D "%~dp0"

:start

for /l %%i in (1,1,5) do ffmpeg -i http://ipv6.bjtu.edu.cn/hls/cctv1hd.m3u8 -vcodec copy -acodec copy -t 60 -y "%DATE:~0,4%-%DATE:~5,2%-%DATE:~8,2% %TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.ts"

:pause

:end
