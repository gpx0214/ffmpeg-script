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

<pre>
交大ipv6 普通ipv4路由器后不能使用
http://ipv6.bjtu.edu.cn/hls/cctv1hd.m3u8
http://ipv6.bjtu.edu.cn/hls/cctv3hd.m3u8
http://ipv6.bjtu.edu.cn/hls/cctv5hd.m3u8
http://ipv6.bjtu.edu.cn/hls/cctv5phd.m3u8
http://ipv6.bjtu.edu.cn/hls/cctv6hd.m3u8
http://ipv6.bjtu.edu.cn/hls/cctv8hd.m3u8
http://ipv6.bjtu.edu.cn/hls/btv1hd.m3u8
http://ipv6.bjtu.edu.cn/hls/btv2hd.m3u8
http://ipv6.bjtu.edu.cn/hls/btv6hd.m3u8
http://ipv6.bjtu.edu.cn/hls/btv11hd.m3u8
http://ipv6.bjtu.edu.cn/hls/hunanhd.m3u8
http://ipv6.bjtu.edu.cn/hls/jshd.m3u8
http://ipv6.bjtu.edu.cn/hls/zjhd.m3u8
http://ipv6.bjtu.edu.cn/hls/dfhd.m3u8
http://ipv6.bjtu.edu.cn/hls/ahhd.m3u8
http://ipv6.bjtu.edu.cn/hls/hljhd.m3u8
http://ipv6.bjtu.edu.cn/hls/lnhd.m3u8
http://ipv6.bjtu.edu.cn/hls/szhd.m3u8
http://ipv6.bjtu.edu.cn/hls/gdhd.m3u8
http://ipv6.bjtu.edu.cn/hls/tjhd.m3u8
http://ipv6.bjtu.edu.cn/hls/hbhd.m3u8
http://ipv6.bjtu.edu.cn/hls/sdhd.m3u8
http://ipv6.bjtu.edu.cn/hls/chchd.m3u8

北邮ipv4外网 按流量计费网络慎用
http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8
http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8
http://ivi.bupt.edu.cn/hls/cctv5hd.m3u8
http://ivi.bupt.edu.cn/hls/cctv5phd.m3u8
http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8
http://ivi.bupt.edu.cn/hls/cctv8hd.m3u8
http://ivi.bupt.edu.cn/hls/btv1hd.m3u8
http://ivi.bupt.edu.cn/hls/btv2hd.m3u8
http://ivi.bupt.edu.cn/hls/btv6hd.m3u8
http://ivi.bupt.edu.cn/hls/btv11hd.m3u8
http://ivi.bupt.edu.cn/hls/hunanhd.m3u8
http://ivi.bupt.edu.cn/hls/jshd.m3u8
http://ivi.bupt.edu.cn/hls/zjhd.m3u8
http://ivi.bupt.edu.cn/hls/dfhd.m3u8
http://ivi.bupt.edu.cn/hls/ahhd.m3u8
http://ivi.bupt.edu.cn/hls/hljhd.m3u8
http://ivi.bupt.edu.cn/hls/lnhd.m3u8
http://ivi.bupt.edu.cn/hls/szhd.m3u8
http://ivi.bupt.edu.cn/hls/gdhd.m3u8
http://ivi.bupt.edu.cn/hls/tjhd.m3u8
http://ivi.bupt.edu.cn/hls/hbhd.m3u8
http://ivi.bupt.edu.cn/hls/sdhd.m3u8
http://ivi.bupt.edu.cn/hls/chchd.m3u8
http://ivi.bupt.edu.cn/hls/cqhd.m3u8
</pre>
