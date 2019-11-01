# Cheatsheet

## Debian buster at Macbook Pro

### Basic installation
```bash
$ apt-get install sudo vim intel-microcode i3 xorg
```

```bash
$ echo ‘exec i3’ > ~/.xsession
$ vi ~/.profile
startx
```

### Sound
```bash
$ apt install alsa-util
$ cat /etc/modprobe.d/alsa.conf
# alsa fix
options snd-hda-intel model=mbp101 index=1
# Keep snd-pcsp from beeing loaded as first soundcard
options snd-pcsp index=-2
```

Sources
- https://blog.deimos.fr/2015/04/28/debian-jessie-and-macbookpro-13-2015121-with-kernel-4/

### Wifi
```bash
$ sudo wget -O /lib/firmware/brcm/brcmfmac43602-pcie.bin https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43602-pcie.bin
```
Follow https://wiki.debian.org/WiFi/HowToUse#connman to connect to the wifi.

Sources
- https://wiki.debian.org/WiFi/HowToUse#connman
- https://blog.deimos.fr/2015/04/28/debian-jessie-and-macbookpro-13-2015121-with-kernel-4/

### Screen resolution errors
```bash
$ vi /etc/X11/xorg.conf.d/90-monitor.conf
Section "Monitor"
    Identifier             "<default monitor>"
    DisplaySize            286 179    # In millimeters
EndSection
```

```bash
$ vi ~/.Xresources
! Fonts {{{
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.hintstyle: hintfull
Xft.dpi: 220
! }}}

Rxvt*font: xft:Bitstream Vera Sans Mono:pixelsize=25

$ xrdb ~/.Xresources
```

Sources
- https://wiki.debian.org/InstallingDebianOn/Apple/MacBookPro/Early-2015-13-inch
  
  
