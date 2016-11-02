FROM ubuntu:16.04

MAINTAINER Corprew Reed <github-public-incoming@corprew.org>



RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-add-repository multiverse
RUN apt-get update

RUN apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev \
    libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
    libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev wget cmake mercurial libfdk-aac-dev \
    libx264-dev libmp3lame-dev libopus-dev libvpx-dev
    
WORKDIR /usr/local/src/ffmpeg
RUN wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
RUN tar xzvf yasm-1.3.0.tar.gz
WORKDIR /usr/local/src/ffmpeg/yasm-1.3.0
RUN ./configure --prefix="/usr/local/src/ffmpeg" --bindir="/usr/local/bin"
RUN make
RUN make install
RUN make distclean

WORKDIR /usr/local/src/ffmpeg
RUN hg clone https://bitbucket.org/multicoreware/x265
WORKDIR /usr/local/src/ffmpeg/x265/build/linux
RUN PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr/local/src/ffmpeg" -DENABLE_SHARED:bool=off ../../source
RUN make
RUN make install
#RUN make distclean

RUN apt-get install -y libvpx-dev

WORKDIR /usr/local/src/ffmpeg
RUN ldconfig
RUN wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN tar xjvf ffmpeg-snapshot.tar.bz2
WORKDIR /usr/local/src/ffmpeg/ffmpeg
RUN PKG_CONFIG_PATH="/usr/local/src/ffmpeg/lib/pkgconfig" ./configure \
  --prefix="/usr/local" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$/usr/local/include" \
  --extra-ldflags="-L/usr/local/lib" \
  --bindir="/usr/local/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
RUN PATH="$HOME/bin:$PATH" make
RUN make install
RUN make distclean
RUN hash -r
				  

WORKDIR /

CMD ["bin/bash"]