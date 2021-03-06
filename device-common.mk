#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 The Carbon Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG := normal large hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# DEMENTED build.prop tweaks
PRODUCT_PROPERTY_OVERRIDES := \
    tf.enable=y \
    ro.carrier=wifi-only \
    wifi.interface=wlan0 \
    drm.service.enabled=true \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=350 \
    ro.kernel.android.checkjni=0 \
    ro.media.enc.jpeg.quality=100 \
    ro.config.nocheckin=1 \
    debug.performance.tuning=1 \
    persist.service.swiqi.enable=1 \
    video.accelerate.hw=1 \
    ro.ril.enable.3g.prefix=1 \
    ro.ril.hep=1 \
    ro.ril.hsxpa=3 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.a53=1 \
    ro.ril.hsupa.category=5 \
    persist.sys.purgeable_assets=1 \
    pm.sleep_mode=1 \
    ro.home_app_adj=1 \
    ro.ext4fs=1 \
    persist.sys.use_dithering=0 \
    ro.ril.disable.power.collapse=0 \
    dalvik.vm.heapstartsize=128m \
    dalvik.vm.heapgrowthlimit=320m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heaputilization=0.05 \
    dalvik.vm.heapidealfree=8388608 \
    dalvik.vm.heapconcurrentstart=2097152 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.dexopt-data-only=1 \
    ro.config.hw_quickpoweron=true \
    ro.dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-flags=v=n,o=v \
    debug.composition.type=gpu \
    ro.max.fling_velocity=15000 \
    ro.min.fling_velocity=8000 \
    ro.config.hw_fast_dormancy=1 \
    net.dns1=8.8.4.4 \
    net.dns2=8.8.8.8 \
    ro.semc.sound_effects_enabled=true \
    ro.semc.xloud.supported=true \
    htc.audio.alc.enable=1 \
    htc.audio.swalt.enable=1 \
    htc.audio.swalt.mingain=14512 \
    persist.service.xloud.enable=1 \
    persist.service.enhance.enable=1 \
    ro.semc.clearaudio.supported=true \
    persist.service.clearaudio.enable=1 \
    ro.sony.walkman.logger=1 \
    ro.somc.clearphase.supported=true \
    persist.service.clearphase.enable=1

# DEMENTED bootanimation...Credit JaeKar
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/common/media/grouper/bootanimation.zip:system/media/bootanimation.zip

# Fix over clocking
PRODUCT_COPY_FILES += \
        device/asus/grouper/system/etc/init.d/03dementedcpuclock:system/etc/init.d/03dementedcpuclock

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_COPY_FILES += \
    device/asus/grouper/fstab.grouper:root/fstab.grouper \
    device/asus/grouper/ueventd.grouper.rc:root/ueventd.grouper.rc \
    device/asus/grouper/init.grouper.usb.rc:root/init.grouper.usb.rc \
    device/asus/grouper/gps.conf:system/etc/gps.conf

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcm4329.ko
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
    device/asus/grouper/vold.fstab:system/etc/vold.fstab \
    device/asus/grouper/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/asus/grouper/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    device/asus/grouper/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
    device/asus/grouper/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES := \
    lights.grouper \
    audio.primary.grouper \
    power.grouper \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

# NFC packages
PRODUCT_PACKAGES += \
    nfc.grouper \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/asus/grouper/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/asus/grouper/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/asus/grouper/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/asus/grouper/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/asus/grouper/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/asus/grouper/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
