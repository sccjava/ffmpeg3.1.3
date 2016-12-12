rm -r ./compiled

XCode_Name="Xcode.app"
SDK_Version="iPhoneOS9.3.sdk"

rm -r ./compiled/armv7

echo "Configure for armv7 build"

./configure \
--cc=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang \
--sysinclude=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include \
--sysroot=/Applications/$XCode_Name/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/$SDK_Version \
--target-os=darwin \
--arch=arm \
--cpu=cortex-a8 \
--extra-cflags='-arch armv7 -I../../openssl/iOS/include' \
--extra-ldflags='-arch armv7' \
--extra-libs='-L../../openssl/iOS/lib/ -lssl -lcrypto' \
--prefix=compiled/armv7 \
--enable-cross-compile \
--disable-encoder=mpeg1video \
--disable-encoder=mpeg4 \
--disable-armv5te \
--enable-swscale-alpha \
--disable-doc \
--disable-ffserver \
--disable-asm \
--disable-debug \
--enable-static \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--enable-encoders \
--enable-network \
--enable-encoder=pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le \
--enable-decoders \
--enable-decoder=vorbis,wma,wmalossless,wmapro,wmav1,wmav2,aac,aac_latm,ac3,alac,als,amrnb,amrwb,ape,avs,dvbsub,dvdsub,dvvideo,flac,flashsv,flashsv2,flv,fraps,g722,g723_1,g726,g729,gif,h263,h263i,h263p,h264,indeo2,indeo3,indeo4,indeo5,mp1,mp1float,mp2,mp2float,mp3,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,mpeg1video,mpeg2video,mpeg4,mpegvideo,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,png,ppm,qtrle,tiff,vp8,vc1,vc1image \
--disable-muxers \
--enable-muxer=xwma,h263,h264,ipod,matroska,matroska_audio,mp4,mpegts,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,vc1t,webm,ogg,m4v,flv,avi \
--enable-demuxer=asf \
--enable-protocols \
--enable-protocol=file \
--enable-openssl \
--enable-nonfree \
--disable-indevs \
--disable-outdevs \
--disable-symver

make clean
make && make install




rm -r ./compiled/armv7s

echo "Configure for armv7s build"

./configure \
--cc=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang \
--sysinclude=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include \
--sysroot=/Applications/$XCode_Name/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/$SDK_Version \
--target-os=darwin \
--arch=arm \
--cpu=cortex-a8 \
--extra-cflags='-arch armv7s -I../../openssl/iOS/include' \
--extra-ldflags='-arch armv7s' \
--extra-libs='-L../../openssl/iOS/lib/ -lssl -lcrypto' \
--prefix=compiled/armv7s \
--enable-cross-compile \
--disable-encoder=mpeg1video \
--disable-encoder=mpeg4 \
--disable-armv5te \
--enable-swscale-alpha \
--disable-doc \
--disable-ffserver \
--disable-asm \
--disable-debug \
--enable-static \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--enable-encoders \
--enable-network \
--enable-encoder=pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le \
--enable-decoders \
--enable-decoder=vorbis,wma,wmalossless,wmapro,wmav1,wmav2,aac,aac_latm,ac3,alac,als,amrnb,amrwb,ape,avs,dvbsub,dvdsub,dvvideo,flac,flashsv,flashsv2,flv,fraps,g722,g723_1,g726,g729,gif,h263,h263i,h263p,h264,indeo2,indeo3,indeo4,indeo5,mp1,mp1float,mp2,mp2float,mp3,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,mpeg1video,mpeg2video,mpeg4,mpegvideo,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,png,ppm,qtrle,tiff,vp8,vc1,vc1image \
--disable-muxers \
--enable-muxer=xwma,h263,h264,ipod,matroska,matroska_audio,mp4,mpegts,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,vc1t,webm,ogg,m4v,flv,avi \
--enable-demuxer=asf \
--enable-protocols \
--enable-protocol=file \
--enable-openssl \
--enable-nonfree \
--disable-indevs \
--disable-outdevs \
--disable-symver

make clean
make && make install


rm -r ./compiled/arm64

echo "Configure for arm64 build"

./configure \
--cc=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang \
--sysinclude=/Applications/$XCode_Name/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include \
--sysroot=/Applications/$XCode_Name/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/$SDK_Version \
--target-os=darwin \
--arch=arm \
--cpu=generic \
--extra-cflags='-arch arm64 -I../../openssl/iOS/include' \
--extra-ldflags='-arch arm64' \
--extra-libs='-L../../openssl/iOS/lib/ -lssl -lcrypto' \
--prefix=compiled/arm64 \
--enable-cross-compile \
--disable-encoder=mpeg1video \
--disable-encoder=mpeg4 \
--disable-armv5te \
--enable-swscale-alpha \
--disable-doc \
--disable-ffserver \
--disable-asm \
--disable-debug \
--enable-static \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--enable-encoders \
--enable-network \
--enable-encoder=pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le \
--enable-decoders \
--enable-decoder=vorbis,wma,wmalossless,wmapro,wmav1,wmav2,aac,aac_latm,ac3,alac,als,amrnb,amrwb,ape,avs,dvbsub,dvdsub,dvvideo,flac,flashsv,flashsv2,flv,fraps,g722,g723_1,g726,g729,gif,h263,h263i,h263p,h264,indeo2,indeo3,indeo4,indeo5,mp1,mp1float,mp2,mp2float,mp3,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,mpeg1video,mpeg2video,mpeg4,mpegvideo,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,png,ppm,qtrle,tiff,vp8,vc1,vc1image \
--disable-muxers \
--enable-muxer=xwma,h263,h264,ipod,matroska,matroska_audio,mp4,mpegts,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,vc1t,webm,ogg,m4v,flv,avi \
--enable-demuxer=asf \
--enable-protocols \
--enable-protocol=file \
--enable-openssl \
--enable-nonfree \
--disable-indevs \
--disable-outdevs \
--disable-symver

make clean
make && make install


echo "make fat (universal) libs"
mkdir -p ./compiled/fat/lib

lipo -output ./compiled/fat/lib/libavcodec.a  -create \
-arch armv7  ./compiled/armv7/lib/libavcodec.a \
-arch armv7s ./compiled/armv7s/lib/libavcodec.a \
-arch arm64  ./compiled/arm64/lib/libavcodec.a

lipo -output ./compiled/fat/lib/libavdevice.a  -create \
-arch armv7  ./compiled/armv7/lib/libavdevice.a \
-arch armv7s ./compiled/armv7s/lib/libavdevice.a \
-arch arm64  ./compiled/arm64/lib/libavdevice.a

lipo -output ./compiled/fat/lib/libavformat.a  -create \
-arch armv7 ./compiled/armv7/lib/libavformat.a \
-arch armv7s ./compiled/armv7s/lib/libavformat.a \
-arch arm64 ./compiled/arm64/lib/libavformat.a

lipo -output ./compiled/fat/lib/libavutil.a  -create \
-arch armv7 ./compiled/armv7/lib/libavutil.a \
-arch armv7s ./compiled/armv7s/lib/libavutil.a \
-arch arm64 ./compiled/arm64/lib/libavutil.a

lipo -output ./compiled/fat/lib/libswscale.a  -create \
-arch armv7 ./compiled/armv7/lib/libswscale.a \
-arch armv7s ./compiled/armv7s/lib/libswscale.a \
-arch arm64 ./compiled/arm64/lib/libswscale.a

lipo -output ./compiled/fat/lib/libavfilter.a  -create \
-arch armv7 ./compiled/armv7/lib/libavfilter.a \
-arch armv7s ./compiled/armv7s/lib/libavfilter.a \
-arch arm64 ./compiled/arm64/lib/libavfilter.a

lipo -output ./compiled/fat/lib/libavresample.a  -create \
-arch armv7 ./compiled/armv7/lib/libavresample.a \
-arch armv7s ./compiled/armv7s/lib/libavresample.a \
-arch arm64 ./compiled/arm64/lib/libavresample.a

