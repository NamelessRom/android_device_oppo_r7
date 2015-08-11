# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/nameless/config/apns.mk)

# Inherit some common Nameless stuff
$(call inherit-product, vendor/nameless/config/common.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/oppo/r7/overlay

# Bootanimation and recovery
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH  := 1080

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    twrp.fstab \
    init.oppo.usb.rc \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc \

# Ramdisk - scripts
PRODUCT_PACKAGES += \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qcom.wifi.sh \
#    init.qcom.bt.sh \
#    init.qcom.post_boot.sh \
#    init.qcom.uicc.sh \

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/mixer_paths.xml:/system/etc/mixer_paths.xml \

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \

# Hardware
PRODUCT_PACKAGES += \
    hwcomposer.msm8916 \
    gralloc.msm8916 \
    copybit.msm8916 \
    memtrack.msm8916 \
    audio.primary.msm8916 \
    audio_policy.msm8916 \
    lights.qcom \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    camera-wrapper.msm8916 \
    libaudio-resampler \
    audiod \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    power.msm8916 \
    keystore.msm8916 \

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert \
#    libOmxAacEnc \
#    libOmxAmrEnc \
#    libOmxEvrcEnc \
#    libOmxQcelp13Enc \

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \

# Permissions
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
        frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \


# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \

# Wifi
PRODUCT_PACKAGES += \
    mac-update \
    wcnss_service \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)