TRX_ENDIAN := le

define Device/en7528_generic
  DEVICE_VENDOR := EN7528
  DEVICE_MODEL := Generic
  DEVICE_DTS := en7528_generic
endef
TARGET_DEVICES += en7528_generic

define Device/tplink_ex20v
  DEVICE_VENDOR := TP-Link
  DEVICE_MODEL := EX20v
  # Single MT7915 DBDC (2.4G phy0 + 5G phy1); internal GSW (no external switch).
  # mt7915-firmware is a separate package (it DEPENDS on the driver, not vice
  # versa), so it must be listed explicitly or the radio comes up firmware-less.
  # İnternet Bilgisi Kurtarma (superonline-wan-recover, luci-app-simple-wan-recover,
  # rp-pppoe-server, tcpdump) kasıtlı olarak derlemeye eklenmiyor. Paket kaynakları
  # repoda duruyor, imajda değil.
  DEVICE_PACKAGES := kmod-mt7915e kmod-mt7915-firmware kmod-usb3 kmod-8021q
  DEVICE_DTS := en7528_tplink_ex20v
  TRX_MODEL := EX20v
  NAND_SIZE := 512m
  # F50L4G41XB geometry (stock bootlog): 4 KiB page, 256 KiB erase block
  # (erase_shift 0x12). The shared Device/Default's 128k/2048 is for the C5v's
  # smaller NAND; ubinize with the wrong PEB/page misaligns and UBI won't attach.
  BLOCKSIZE := 256k
  PAGESIZE := 4096
  IMAGE_SIZE := 411648k
  KERNEL := kernel-bin | append-dtb | tclinux-free-bootbase-jump | lzma | ex20v-tctag | check-size 6291456
  KERNEL_INITRAMFS := kernel-bin | append-dtb
  IMAGES := sysupgrade.bin factory.bin
  # UBI rootfs: standard nand.sh sysupgrade preserves config (rootfs_data ubifs).
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
  IMAGE/factory.bin := append-kernel | pad-to 6291456 | append-ubi
endef
TARGET_DEVICES += tplink_ex20v

define Device/dasan_h660gm-a
  DEVICE_VENDOR := DASAN
  DEVICE_MODEL := H660GM-A
  DEVICE_PACKAGES := kmod-usb2 kmod-mt7603 kmod-mt7615e kmod-mt7663-firmware-ap
  TRX_MODEL := Dewberry
  IMAGES := tclinux.trx
  IMAGE/tclinux.trx := append-kernel | lzma | tclinux-trx
endef

define Device/dasan_h660gm-a-airtel
  $(Device/dasan_h660gm-a)
  DEVICE_VARIANT := Airtel
  DEVICE_DTS := en7528_dasan_h660gm-a-airtel
endef
TARGET_DEVICES += dasan_h660gm-a-airtel

define Device/dasan_h660gm-a-generic
  $(Device/dasan_h660gm-a)
  DEVICE_VARIANT := Generic
  DEVICE_DTS := en7528_dasan_h660gm-a-generic
endef
TARGET_DEVICES += dasan_h660gm-a-generic
