#!/bin/bash

# 打印 info
make info

# 指定要构建的目标映像
PROFILE="generic"

# 要嵌入映像的软件包列表
PACKAGES=""
# 基础包
## 基础组件
PACKAGES="$PACKAGES curl nano"
## 虚拟网卡驱动
#PACKAGES="$PACKAGES kmod-e1000 kmod-e1000e kmod-vmxnet3" # 虚拟网卡驱动，默认已包含，无需额外添加
## 主题
# PACKAGES="$PACKAGES luci-theme-argon"
## 界面翻译补全
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"

# 系统
## 定时重启
# PACKAGES="$PACKAGES luci-i18n-autoreboot-zh-cn"

# 服务
## sing-box
PACKAGES="$PACKAGES sing-box"
## zerotier
PACKAGES="$PACKAGES luci-i18n-zerotier-zh-cn"


# 移除不需要的包
## 磁盘驱动和挂载
PACKAGES="$PACKAGES -kmod-fs-f2fs -mkf2fs -automount -block-mount"
## 音频驱动
PACKAGES="$PACKAGES -alsa-utils -kmod-ac97 -kmod-sound-hda-codec-hdmi -kmod-sound-hda-codec-realtek -kmod-sound-hda-codec-via -kmod-sound-hda-core -kmod-sound-hda-intel -kmod-sound-i8x0 -kmod-sound-via82xx"
## 网卡驱动
PACKAGES="$PACKAGES -kmod-8139cp -kmod-8139too -kmod-amazon-ena -kmod-amd-xgbe -kmod-bnx2 -kmod-forcedeth -kmod-i40e -kmod-igb -kmod-igbvf -kmod-igc -kmod-ixgbe -kmod-ixgbevf -kmod-pcnet32 -kmod-r8101 -kmod-r8125 -kmod-r8126 -kmod-r8168 -kmod-tg3 -kmod-tulip"
## USB驱动
PACKAGES="$PACKAGES -kmod-usb-audio -kmod-usb-hid -kmod-usb-net -kmod-usb-net-asix -kmod-usb-net-asix-ax88179 -kmod-usb-net-rtl8150 -kmod-usb-net-rtl8152-vendor"
## pppoe 拨号
PACKAGES="$PACKAGES -ppp -ppp-mod-pppoe"
## IPv6
PACKAGES="$PACKAGES -ipv6helper odhcp6c"
## 其他
PACKAGES="$PACKAGES -fstools -partx-utils -fdisk -kmod-button-hotplug -kmod-vmxnet3 -grub2-bios-setup -intel-igpu-firmware-dmc -autocore -kmod-nf-nathelper -kmod-nf-nathelper-extra -luci-lib-ipkg -kmod-nft-offload -kmod-fs-vfat"

# 包含自定义文件的目录
# FILES="files"

# 要禁用的 /etc/init.d 中服务的名称
DISABLED_SERVICES=""

make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" DISABLED_SERVICES="$DISABLED_SERVICES"
