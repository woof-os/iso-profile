pacman -Sy grub --no-confirm
mv out/* old-out/.
rm -rf work
mkarchiso -v ./archlive
