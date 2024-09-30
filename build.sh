pacman -Sy grub
mv out/* old-out/.
rm -rf work
mkarchiso -v ./archlive
