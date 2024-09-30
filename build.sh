pacman -Sy grub --noconfirm
mv out/* old-out/.
rm -rf work
mkarchiso -v ./archlive
