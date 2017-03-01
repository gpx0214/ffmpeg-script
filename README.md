# ffmpeg-script
script of ffmpeg

ffmpeg官方网站 https://ffmpeg.org

windows编译好的文件 static是单文件版，集成了大部分解码器
https://ffmpeg.zeranoe.com/builds/

## 基本用法
ffmpeg -i input.mp4 output.avi

## 换封装格式
ffmpeg -i input.flv -vcodec copy -acodec copy output.mp4

## 提取音频
ffmpeg -i input.mp4 -vn -acodec copy output.aac

## 定长录制命令
ffmpeg -i http://ipv6.bjtu.edu.cn/hls/cctv1hd.m3u8 -vcodec copy -acodec copy -t 60 "C:\%DATE:~0,4%-%DATE:~5,2%-%DATE:~8,2% %TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.ts"

