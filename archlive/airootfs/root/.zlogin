# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

# If running from tty1 startx
if [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi

~/.automated_script.sh
