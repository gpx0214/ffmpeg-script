# ffmpeg-script
script of ffmpeg

ffmpeg官方网站 https://ffmpeg.org

windows编译好的文件
static是静态编译单文件版，集成了大部分解码器
shared是动态编译的exe+dll
dev是.h和.lib等
https://ffmpeg.zeranoe.com/builds/

## ffmpeg2.3.6 
1 安装MinGW+MSYS 
C:\MinGW\msys\1.0\msys.bat 
根据VS的安装情况在第一行前面加 
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat" 
参考:http://blog.csdn.net/bobsweetie/article/details/50858358 
 
2 准备工作 
2.1 下载SDL1.2 解决编译不输出ffplay的问题 
http://www.libsdl.org/release/SDL-1.2.14.tar.gz 
bin 全部复制到C:/msys/mingw/lib 
include 全部复制到C:/msys/mingw/include 
lib 全部复制到C:/msys/mingw/bin 
i386-mingw32msvc-sdl-config重命名为sdl-config 修改配置prefix=c:/MinGW  prefix=c:/MinGW

2.1 下载YASM 解决yasm不存在影响部分.o文件生成的error
访问http://yasm.tortall.net/Download.html
选通用版的 Win32 .exe (for general use on 32-bit Windows) 
参考:http://blog.csdn.net/hutianyou123/article/details/76515947
下载http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win32.exe
改名yasm.exe，复制到D:/MinGW/msys/1.0/bin

2.1 安装pkg-config
解决"pkg-config not found, library detection may fail."
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.tar.gz
放到msys\bin
http://ftp.gnome.org/pub/gnome/binaries/win32/glib/2.18/glib_2.18.4-1_win32.zip
bin\libglib-2.0-0.dll放到msys\bin 不要用新版本 
win下打开bin\pkg-config.exe检查libglib-2.0-0.dll是否正常

打开C:\MinGW\msys\1.0\msys.bat
顶级目录相当于C:\MinGW\msys\1.0\
切换到ffmpeg源码目录

编译命令
>./configure --enable-memalign-hack --disable-debug --enable-shared --disable-static
输出
>检查SDL 后面的支持情况 对生成ffplay很重要
>Creating config.mak, config.h, and doc/config.texi...

>make

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

<pre>
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm1006/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm1073/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm1039/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm876/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm1025/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm974/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/am603/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/am774/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/am927/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm986/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm945/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm994/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://audiolive.rbc.cn:1935/live/fm1043/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm1051/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm1065/96K/tzwj_video.m3u8
ffplay.exe -autoexit -showmode 2 -x 640 -y 512 http://123.56.16.201:1935/live/fm1075/96K/tzwj_video.m3u8


CRI aac-lc 64k/48.0
http://sk.cri.cn/887.m3u8
http://sk.cri.cn/915.m3u8
http://sk.cri.cn/905.m3u8

http://nhzs-lh.akamaihd.net/i/nhzs_1@381075/master.m3u8
http://hyhq-lh.akamaihd.net/i/hyhq_1@381074/index_48_a-p.m3u8?sd=10&rebase=on


RBC aac-lc 96k/48.0
新闻广播 http://123.56.16.201:1935/live/fm1006/96K/tzwj_video.m3u8
城市广播 http://audiolive.rbc.cn:1935/live/fm1073/96K/tzwj_video.m3u8
交通广播 http://audiolive.rbc.cn:1935/live/fm1039/96K/tzwj_video.m3u8
文艺广播 http://123.56.16.201:1935/live/fm876/96K/tzwj_video.m3u8
体育广播 http://audiolive.rbc.cn:1935/live/fm1025/96K/tzwj_video.m3u8
音乐广播 http://123.56.16.201:1935/live/fm974/96K/tzwj_video.m3u8
故事广播 http://123.56.16.201:1935/live/am603/96K/tzwj_video.m3u8
外语广播 http://audiolive.rbc.cn:1935/live/am774/96K/tzwj_video.m3u8
爱家广播 http://audiolive.rbc.cn:1935/live/am927/96K/tzwj_video.m3u8
古典音乐 http://audiolive.rbc.cn:1935/live/fm986/96K/tzwj_video.m3u8
动听调频 http://audiolive.rbc.cn:1935/live/fm945/96K/tzwj_video.m3u8
教学广播 http://123.56.16.201:1935/live/fm994/96K/tzwj_video.m3u8
长书广播 http://audiolive.rbc.cn:1935/live/fm1043/96K/tzwj_video.m3u8
戏曲曲艺 http://123.56.16.201:1935/live/fm1051/96K/tzwj_video.m3u8
欢乐时光 http://123.56.16.201:1935/live/fm1065/96K/tzwj_video.m3u8
怀旧金曲 http://123.56.16.201:1935/live/fm1075/96K/tzwj_video.m3u8

CNR aac-lc 192k/48.0
http://www.radio.cn/index.php?option=default,radio
中国之声 http://ngcdn001.cnr.cn/live/zgzs/index.m3u8
经济之声 http://ngcdn002.cnr.cn/live/jjzs/index.m3u8
音乐之声 http://ngcdn003.cnr.cn/live/yyzs/index.m3u8
文艺之声 http://ngcdn010.cnr.cn/live/wyzs/index.m3u8
都市之声 http://ngcdn004.cnr.cn/live/dszs/index.m3u8
中华之声 http://ngcdn005.cnr.cn/live/zhzs/index.m3u8
神州之声 http://ngcdn006.cnr.cn/live/szzs/index.m3u8
华夏之声 http://ngcdn007.cnr.cn/live/hxzs/index.m3u8
香港之声 http://ngcdn008.cnr.cn/live/xgzs/index.m3u8
民族之声 http://ngcdn009.cnr.cn/live/mzzs/index.m3u8
老年之声 http://ngcdn011.cnr.cn/live/lnzs/index.m3u8
维语广播 http://ngcdn013.cnr.cn/live/wygb/index.m3u8
藏语广播 http://ngcdn012.cnr.cn/live/zygb/index.m3u8
娱乐广播 http://ngcdn014.cnr.cn/live/ylgb/index.m3u8
高速广播 http://ngcdn016.cnr.cn/live/gsgljtgb/index.m3u8
中国乡村之声 http://ngcdn017.cnr.cn/live/xczs/index.m3u8
相声小品频道 http://ngcdn023.cnr.cn/live/xsxp/index.m3u8
古典音乐频道 http://ngcdn022.cnr.cn/live/gdyy/index.m3u8
长篇联播频道 http://ngcdn024.cnr.cn/live/cplb/index.m3u8
中国民乐频道 http://ngcdn021.cnr.cn/live/zgmy/index.m3u8
哈语广播 http://ngcdn025.cnr.cn/live/hygb/index.m3u8

aac-lc 32k/22.05
http://qgzb.cnr.cn/live/bjxwgb/playlist.m3u8
http://qgzb.cnr.cn/live/mp4:bjwygb/playlist.m3u8
http://qgzb.cnr.cn/live/bjjtgb/playlist.m3u8

</pre>
