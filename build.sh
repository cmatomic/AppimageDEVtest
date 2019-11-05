#/bin/bash

VERSION="3.0.8"
wget http://download.videolan.org/pub/vlc/$VERSION/vlc-$VERSION.tar.xz
tar xJf vlc-$VERSION.tar.xz
mkdir ./vlc-$VERSION/build
chmod 755 -R ./vlc-$VERSION/build
ls ./vlc-$VERSION
#echo "deb http://in.archive.ubuntu.com/ubuntu/ xenial main" | tee /etc/apt/sources.list.d/xenial.list
apt-get update
apt-get --yes install python-software-properties software-properties-common
add-apt-repository ppa:jonathonf/ffmpeg-4 --yes
add-apt-repository ppa:jonathonf/vlc-3 --yes
add-apt-repository universe --yes
apt-get update
apt-get --yes dist-upgrade
apt-get --yes install curl build-essential autoconf  libxcb-image0-dev libtool pkg-config patchelf libtasn1-6-dev libtasn1-3-bin libbsd-dev git automake cmake libgstreamer-plugins-base1.0-dev libopencv-dev autopoint bison  gettext flex libaa1-dev libarchive-dev libaribb24-dev libasound2-dev libass-dev libavahi-client-dev libavc1394-dev libavcodec-dev libavformat-dev liblircclient-dev libavresample-dev libbluray-dev libcaca-dev libcairo2-dev libcddb2-dev libchromaprint-dev libdbus-1-dev libdc1394-22-dev libdca-dev libdvbpsi-dev libdvdnav-dev libdvdread-dev libebml-dev libegl1-mesa-dev libfaad-dev libflac-dev libfluidsynth-dev libfreetype6-dev libfribidi-dev libgl1-mesa-dev libgles2-mesa-dev libgnutls28-dev libgnutls-dev libgtk-3-dev libharfbuzz-dev libidn11-dev libiso9660-dev  libjack-dev libkate-dev liblircclient-dev liblivemedia-dev liblua5.2-dev libmad0-dev libmatroska-dev libmicrodns-dev libmpcdec-dev libmpeg2-4-dev libmpg123-dev libmtp-dev libncursesw5-dev libnfs-dev libnotify-dev libogg-dev libomxil-bellagio-dev libmodplug-dev libopus-dev libplacebo-dev libpng-dev libpostproc-dev libprotobuf-dev libpulse-dev libqt5svg5-dev libqt5x11extras5 libqt5x11extras5-dev libraw1394-dev libresid-builder-dev librsvg2-dev libsamplerate0-dev libsdl-image1.2-dev libsdl1.2-dev libsecret-1-dev libshine-dev libshout3-dev libsidplay2-dev libsmbclient-dev libsndio-dev libsoxr-dev libspatialaudio-dev libspeex-dev libspeexdsp-dev libssh2-1-dev libswscale-dev libsystemd-dev libtag1-dev libtheora-dev libtwolame-dev libudev-dev libupnp-dev libv4l-dev libva-dev libvcdinfo-dev libvdpau-dev libvncserver-dev libvorbis-dev libx11-dev libx264-dev libx265-dev libxcb-composite0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xv0-dev libxcb1-dev libxext-dev libxi-dev libxinerama-dev libxml2-dev libxpm-dev libzvbi-dev lua5.2 oss4-dev protobuf-compiler python3:native qtbase5-dev qtbase5-private-dev wayland-protocols liba52-0.7.4-dev zlib1g-dev libfreerdp-dev libgme-dev libcrystalhd-dev libvpx-dev libaacs-dev libsrtp0-dev libprojectm-qt-dev libpangomm-1.4-dev libbitstream-dev libschroedinger-dev libminizip-dev valgrind libaom-dev libasm-dev libfluidsynth-dev libdsme0-dev libwayland-dev libaribb24-dev libfdk-aac-dev libopenmpt-dev  zsh
#apt-get build-dep vlc --yes
ls


(
  git clone https://github.com/videolabs/libdsm.git
  cd libdsm
  ./bootstrap
  ./configure --prefix=/usr 
  make -j$(nproc)
  make -j$(nproc) install
)

(
  git clone https://github.com/sahlberg/libnfs.git
  cd libnfs/
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make -j$(nproc)
  make -j$(nproc) install
)

(
  ls
  git clone https://code.videolan.org/videolan/libaacs.git
  cd libaacs
  ./bootstrap
  ./configure  --prefix=/usr --libdir=./vlc-$VERSION/build/usr/lib
  make -j$(nproc)
  make -j$(nproc) install
  #make -j$(nproc) DESTDIR=$(pwd)../vlc-$VERSION/build/ install
)
ls

(
 ls
  git clone https://code.videolan.org/videolan/libbdplus.git
  cd libbdplus
  ./bootstrap
  ./configure  --prefix=/usr --prefix=/usr --libdir=/usr/lib
  make -j$(nproc)
  make -j$(nproc) install
(
ls
  #wget http://download.videolan.org/pub/vlc/$VERSION/vlc-$VERSION.tar.xz
  #tar xJf vlc-$VERSION.tar.xz
  cd vlc-$VERSION
  ./configure --enable-debug --enable-chromecast=no --enable-a52 --enable-aa --enable-aom --enable-aribsub --enable-avahi --enable-bluray --enable-caca --enable-chromaprint  --enable-dbus --enable-dca --enable-dvbpsi --enable-dvdnav --enable-faad --enable-flac --enable-fluidsynth --enable-freetype --enable-fribidi --enable-gles2 --enable-gnutls --enable-harfbuzz --enable-jack --enable-kate --enable-libass --enable-libmpeg2 --enable-libxml2 --enable-lirc --enable-live555 --enable-mad --enable-matroska --enable-mod --enable-mpc --enable-mpg123 --enable-mtp --enable-ncurses --enable-notify --enable-ogg --enable-opus --enable-pulse --enable-qt --enable-realrtsp --enable-samplerate --enable-sdl-image --enable-sftp --enable-shine --enable-shout --enable-skins2 --enable-sndio --enable-soxr --enable-spatialaudio --enable-speex --enable-svg --enable-svgdec --enable-taglib --enable-theora --enable-twolame --enable-upnp --enable-vdpau --enable-vnc --enable-vorbis --enable-x264 --enable-x265 --enable-zvbi --enable-alsa  --enable-dc1394  --enable-dv1394 --enable-libplacebo --enable-linsys --enable-nfs --enable-omxil --enable-udev --enable-v4l2 --enable-wayland --enable-libva --enable-vcd --enable-smbclient --enable-debug --disable-crystalhd --disable-d3d11va --disable-decklink --disable-directx --disable-dxva2  --disable-fluidlite --disable-freerdp --disable-goom --disable-gst-decode --disable-libtar --disable-macosx --disable-macosx-avfoundation --disable-macosx-qtkit --disable-mfx --disable-opencv --disable-projectm --disable-schroedinger --disable-sparkle  --disable-telx --disable-vpx --disable-vsxu --disable-wasapi  --with-kde-solid=/usr/share/solid/actions/ --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) DESTDIR=$(pwd)/build/ install
  #chmod 755 -R ./vlc-$VERSION/build
  cd build
  cp ../../org.videolan.vlc.desktop ./
  ls
  cp ../../AppRun .
  ls
  chmod +x AppRun
  cp ./usr/share/icons/hicolor/256x256/apps/vlc.png ./
  mkdir -p ./usr/plugins/iconengines/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/iconengines/libqsvgicon.so ./usr/plugins/iconengines/
  mkdir -p ./usr/plugins/platforms/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/libqxcb.so ./usr/plugins/platforms/
  rm usr/lib/vlc/plugins/plugins.dat
  ./vlc-$VERSION/build/usr/lib/vlc/vlc-cache-gen ./vlc-$VERSION/build/usr/lib/vlc/plugins
)


#rm -f /usr/lib/libfreetype.so.6 || true
#find  /usr/lib/x86_64-linux-gnu/ -maxdepth 1 -name "libaacs.so.0" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
#find  /usr/lib/x86_64-linux-gnu/ -maxdepth 1 -name "libaacs.so.0.5.1" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
#find ./libbdplus/build/usr/lib/x86_64-linux-gnu/ -maxdepth 1 -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
find ./vlc-$VERSION/build/usr/lib/ -maxdepth 1 -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
find ./vlc-$VERSION/build/usr/lib/vlc/ -maxdepth 1 -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
find ./vlc-$VERSION/build/usr/lib/vlc/plugins/ -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../../:$ORIGIN/../../../' {} \;

wget "https://github.com/azubieta/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x ./linuxdeployqt-continuous-x86_64.AppImage
LINUX_DEPLOY_QT_EXCLUDE_COPYRIGHTS=true appimage-wrapper linuxdeployqt-continuous-x86_64.AppImage vlc-$VERSION/build/org.videolan.vlc.desktop -bundle-non-qt-libs
ls ./vlc-$VERSION/build/usr/lib/
rm -f ./vlc-$VERSION/build/usr/lib/libfreetype.so.6
ls ./vlc-$VERSION/build/usr/lib/
LINUX_DEPLOY_QT_EXCLUDE_COPYRIGHTS=true ARCH=x86_64 appimage-wrapper linuxdeployqt-continuous-x86_64.AppImage vlc-$VERSION/build/org.videolan.vlc.desktop -appimage

mkdir -p release

cp ./VLC_media_player*.AppImage release/
md5sum ./VLC_media_player*.AppImage > release/MD5.txt

# Reasons for disabling features:
# chromecast:"protobuf" bug in gnutls-bin, preventing it from working correctly (during the build the binary was segfaulting)on Ubuntu xenial
# https://trac.videolan.org/vlc/ticket/18329
# crystalhd: unusble without firmware (#934242)
# d3d11va: Windows only
# decklink: not in Debian/Ubuntu xenial
# directx: Windows only
# dxva2: Windows only
# fluidlite: fluidsynth is enabled
# freerdp: scheduled for removal (#888323)
# goom: not in Debian/Ubuntu xenial
# gst-decode: not needed when having libavcodec
# libtar: security issue (#737534)
# macosx*: MacOX only
# mfx: currently not supported on Linux
# opencv: developer plugin not required by end users
# projectm: broken
# schroedinger: removed from Debian (#845037)
# sparkle: MacOS X only
# telx: incompatible with zvbi
# vpx: not needed when having libavcodec
# vsxu: not in Debian/Ubuntu xenial
# wasapi: Windows only

