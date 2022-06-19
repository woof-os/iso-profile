#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="woof-os"
iso_label="WOOF_OS_$(date +%Y%m)"
iso_publisher="Woof OS <https://woof-os.github.io>"
iso_application="Woof OS installation/live CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="woof"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
script="https://gist.githubusercontent.com/ACuteWoof/2496ab1885cb495674c8c1ad42f77f18/raw/c6d676a261fa928ecc64c56092e7d6fcea7d580f/woof-os-profiledef.sh"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
