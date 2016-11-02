# ffmpeg-nonfree-docker
This is the dockerfile for https://hub.docker.com/r/corprew/ffmpeg-nonfree-docker/

Dockerfile for ubuntu16.04 ffmpeg which can be used to build mp3 and m4a files amongst other things.

Use this to build other things on top of or use the default bash command to use ffmpeg as per usual.

This version uses as many OS packages as possible to avoid getting permanent version fixed downloads.

# ffmpeg

some details on the provided ffmpeg.

here's a description of the provided ffmpeg:

```
ffmpeg version N-82201-ga566c95 Copyright (c) 2000-2016 the FFmpeg developers
  built with gcc 5.4.0 (Ubuntu 5.4.0-6ubuntu1~16.04.2) 20160609
  configuration: --prefix=/usr/local --pkg-config-flags=--static --extra-cflags='-I$/usr/local/include' --extra-ldflags=-L/usr/local/lib --bindir=/usr/local/bin 
     --enable-gpl 
     --enable-libass 
     --enable-libfdk-aac 
     --enable-libfreetype 
     --enable-libmp3lame 
     --enable-libopus 
     --enable-libtheora 
     --enable-libvorbis 
     --enable-libvpx 
     --enable-libx264 
     --enable-libx265 
     --enable-nonfree
  libavutil      55. 35.100 / 55. 35.100
  libavcodec     57. 65.100 / 57. 65.100
  libavformat    57. 57.100 / 57. 57.100
  libavdevice    57.  2.100 / 57.  2.100
  libavfilter     6. 66.100 /  6. 66.100
  libswscale      4.  3.100 /  4.  3.100
  libswresample   2.  4.100 /  2.  4.100
  libpostproc    54.  2.100 / 54.  2.100
Hyper fast Audio and Video encoder
usage: ffmpeg [options] [[infile options] -i infile]... {[outfile options] outfile}...```
