# ffmpeg-script
script of ffmpeg

ffmpeg官方网站 https://ffmpeg.org

windows编译好的文件
static是静态编译单文件版，集成了大部分解码器
shared是动态编译的exe+dll
dev是.h和.lib等
https://ffmpeg.zeranoe.com/builds/


## 准备msys2
http://www.msys2.org/ 
http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20180531.exe 64位 
pacman -S mingw-w64-i686-toolchain 32位 
pacman -S mingw-w64-x86_64-toolchain 64位 
:: 共有 17 组员在组 mingw-w64-x86_64-toolchain 中：
:: 软件库 mingw64
   1) mingw-w64-x86_64-binutils  2) mingw-w64-x86_64-crt-git
   3) mingw-w64-x86_64-gcc  4) mingw-w64-x86_64-gcc-ada
   5) mingw-w64-x86_64-gcc-fortran  6) mingw-w64-x86_64-gcc-libgfortran
   7) mingw-w64-x86_64-gcc-libs  8) mingw-w64-x86_64-gcc-objc
   9) mingw-w64-x86_64-gdb  10) mingw-w64-x86_64-headers-git
   11) mingw-w64-x86_64-libmangle-git  12) mingw-w64-x86_64-libwinpthread-git
   13) mingw-w64-x86_64-make  14) mingw-w64-x86_64-pkg-config
   15) mingw-w64-x86_64-tools-git  16) mingw-w64-x86_64-winpthreads-git
   17) mingw-w64-x86_64-winstorecompat-git

## ffmpeg2.3.6 
1 安装MinGW+MSYS 
C:\MinGW\msys\1.0\msys.bat 
根据VS的安装情况在第一行前面加 
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat" 
参考:http://blog.csdn.net/bobsweetie/article/details/50858358 
 
2 准备工作 

Pacman -Sl 显示包安装情况

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

## 剪辑 mp2 0.024s整倍数
ffmpeg -i "0.mp2" -ss 2:44:05.784 -to 2:47:52.464 -acodec copy "1.mp2"

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
