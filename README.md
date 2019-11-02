# Cheatsheet

## Debian buster at Macbook Pro

### Basic installation
```bash
$ apt-get install sudo vim intel-microcode i3 xorg git
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
sudo dpkg-reconfigure console-setup 
```

```bash
$ vi /etc/X11/xorg.conf.d/90-monitor.conf
Section "Monitor"
    Identifier             "<default monitor>"
    DisplaySize            286 179    # In millimeters
EndSection
```

Sources
- https://wiki.debian.org/InstallingDebianOn/Apple/MacBookPro/Early-2015-13-inch
  
### I3 and URxvt

```bash
$ sudo apt install xsel i3blocks 
$ cp i3/fontawesome.otf /usr/share/fonts/fontawesome.otf
$ cp -r i3 ~/.config/i3
```

### URxvt

```bash
$ cp urxvt/.Xresources ~/.Xresources
$ cp urxvt/ext/clipboard ~/.urxvt/ext/clipboard
```
