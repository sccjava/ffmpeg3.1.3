LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

include $(LOCAL_PATH)/../av.mk

LOCAL_SRC_FILES := $(FFFILES)

LOCAL_C_INCLUDES :=		\
	$(LOCAL_PATH)/..	\
	$(LOCAL_PATH)/../$(LIBAV_CONFIG)

LOCAL_CFLAGS := $(FFCFLAGS)

LOCAL_LDLIBS := -lz -llog
LOCAL_SHARED_LIBRARIES := avutil avresample #$(AFFLIBS)

LOCAL_MODULE := $(FFNAME)

LOCAL_MODULE_TAGS := optional

LOCAL_ARM_MODE := arm

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif

include $(BUILD_SHARED_LIBRARY)
