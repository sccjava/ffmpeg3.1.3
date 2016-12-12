LOCAL_PATH := $(call my-dir)
LIBAV_PATH := $(LOCAL_PATH)

LIBAV_CONFIG := Android_config

include $(LIBAV_PATH)/libavcodec/Android.mk
#include $(LIBAV_PATH)/libavdevice/Android.mk
include $(LIBAV_PATH)/libavutil/Android.mk
#include $(LIBAV_PATH)/libavfilter/Android.mk
include $(LIBAV_PATH)/libavformat/Android.mk
#include $(LIBAV_PATH)/libswscale/Android.mk
include $(LIBAV_PATH)/libavresample/Android.mk
