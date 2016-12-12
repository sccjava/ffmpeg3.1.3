#/!/bin/sh

ANDROID_NDK='/home/sunny/java/android-ndk-r9d'

if [ -z "${ANDROID_NDK}" ];then
	echo "ANDROID_NDK not defined"
	exit 1
fi

TOOLCHAIN_PATH=${ANDROID_NDK}/toolchains

CRT_PREFIX=
if [ -d ${TOOLCHAIN_PATH}/arm-linux-androideabi-4.6/prebuilt/linux-x86/lib/gcc/arm-linux-androideabi/4.6.x-google ];then
	CRT_PREFIX=.x-google
fi

TOOLCHAIN_ARM=${TOOLCHAIN_PATH}/arm-linux-androideabi-4.6/prebuilt/linux-x86
CROSS_ARM=${TOOLCHAIN_ARM}/bin/arm-linux-androideabi-
CRT_PATH_ARM=${TOOLCHAIN_ARM}/lib/gcc/arm-linux-androideabi/4.6${CRT_PREFIX}/armv7-a
SYSTEM_LIB_ARM=${ANDROID_NDK}/platforms/android-9/arch-arm/usr/lib
LDSCRIPTS_ARM=${TOOLCHAIN_ARM}/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x
ARM_GCC_LIB=${TOOLCHAIN_ARM}/lib/gcc/arm-linux-androideabi/4.6/armv7-a


CFLAGS_COMMON="-fPIC -DANDROID -DPIC"

CFLAGS_ARM_NEON="-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -marm -mvectorize-with-neon-quad \
	-I${ANDROID_NDK}/platforms/android-9/arch-arm/usr/include \
	${CFLAGS_COMMON} \
    -I../../openssl/android/include"


LDFLAGS_ARM="-Wl,-T,${LDSCRIPTS_ARM} \
	-Wl,-rpath-link=${SYSTEM_LIB_ARM} \
	-L${SYSTEM_LIB_ARM} \
    -nostdlib \
	${CRT_PATH_ARM}/crtbegin.o \
	${CRT_PATH_ARM}/crtend.o \
	-lc -lm -ldl"


CONFIG_LIBAV="--enable-shared \
    --disable-static \
	--disable-debug \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-avresample \
	--disable-swscale \
	--disable-avdevice \
	--disable-encoders \
	--enable-encoder=pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le \
	--disable-decoders \
	--enable-decoder=vorbis,wma,wmalossless,wmapro,wmav1,wmav2,aac,aac_latm,ac3,alac,als,amrnb,amrwb,ape,avs,dvbsub,dvdsub,dvvideo,flac,flashsv,flashsv2,flv,fraps,g722,g723_1,g726,g729,gif,h263,h263i,h263p,h264,indeo2,indeo3,indeo4,indeo5,mp1,mp1float,mp2,mp2float,mp3,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,mpeg1video,mpeg2video,mpeg4,mpegvideo,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,png,ppm,qtrle,tiff,vp8,vc1,vc1image \
	--disable-muxers \
	--enable-muxer=xwma,h263,h264,ipod,matroska,matroska_audio,mp4,mpegts,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,vc1t,webm,ogg,m4v,flv,avi \
	--enable-demuxer=asf \
	--enable-network \
	--enable-protocols \
	--enable-protocol=file \
    --enable-openssl \
	--disable-indevs \
	--disable-outdevs \
    --disable-symver" 


    cross=${CROSS_ARM}
	arch=armv7a
	cflags=${CFLAGS_ARM_NEON}
	ldflags=${LDFLAGS_ARM}
	config_libav=${CONFIG_LIBAV}
#	out_path=Android_config

    export CFLAGS=-I../../openssl/android/include
	export CXXFLAGS="-D__STDC_CONSTANT_MACROS"

	./configure --target-os=linux \
		--arch=${arch} \
		--enable-cross-compile \
		--cc=${cross}gcc \
		--cross-prefix=${cross} \
		--nm=${cross}nm \
		--extra-cflags="${cflags}" \
		--extra-ldflags="${ldflags}" \
        --extra-libs="-L../../openssl/android/lib -lssl -lcrypto -L${ARM_GCC_LIB} -lgcc" \
        --prefix=build \
		${config_libav}
#	mkdir -p ${out_path}/libavutil
#	mv libavutil/avconfig.h ${out_path}/libavutil/
#	mv config.mak ${out_path}
#	mv config.h ${out_path}

ndk-build
