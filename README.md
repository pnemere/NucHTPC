# HTPC/NAS/Whatever setup for Intel NUC

**This is partially here for my own benefit if I have to set up a HTPC again, and also as help for anyone with a NUC and a TV and some spare time**

Over time I plan to script as much of this as possible, perhaps making it an interactive shell script.

## A word about hardware
I'm using a 2015 Celeron NUC (https://ark.intel.com/products/85254/Intel-NUC-Kit-NUC5CPYH). Advantages include:
- Low power draw (about 15W)
- Almost completely silent, can heat up and a fan turns on but you hardly hear it
- Very small, can screw it to the back of a monitor/TV

### Installed extra hardware:
- 4gb of RAM
- Old 150gb 5400rpm 2.5" SATA drive I had lying around (only intending to store music on it)
- OS was previously running off a 4gb SD Card
- Now running off a spare 16gb Compact Flash card connected via a USB adapter.
- Other storage comes from USB external TB drives with various file systems (see later).

OS doesn't reside on data storage drives, so this way my music collection has plenty of room, and I can easily switch OS's by swapping out memory cards.

*Windows doesn't allow installation on an SD/CF card, and takes heaps of room, so I chose Linux, and Lubuntu is supposed to be more light-weight...*

Intel provides open source graphics drivers for Linux, and from what I read this is the best/most complete/supported linux graphics driver stack, with support for VA-API, meaning hardware video decoding should be possible.

Lubuntu recognised all hardware in my NUC model, though I read newer ones have built in WiFi adapters which need newer drivers than are available in Lubuntu 17.

## HTPC - Hardware video decoding issues

One disappointment with this setup was that it turns out that on Linux, both Chrome and Firefox browsers (and apparently Opera too) have completely disabled hardware video decoding! This means a slower NUC like mine struggles to decode 1080P video streamed over the internet (Netflix or Youtube). It sounds like Chrome may be working towards allowing hardware decoding via VA-API, but that was posted late 2017, it's now mid 2018, so we may need to fiddle.

Installing video players and playing 1080 or 4K content locally is fine, because the player software is able to access hardware.

Besides this, Linux is great for running a NAS-like setup with the ability to act as a HTPC

## HTPC - Software

Kodi (https://kodi.tv) seems to be the go-to HTPC software that people install on Windows or Linux based HTPCs.
I've previously ran OpenELEC (https://openelec.tv/) which is a custom Linux OS that comes with Kodi already installed in a "kiosk" like mode, where it starts on bootup. This worked well enough, but I find it limiting to only be able to browse giant menu options and need to use a remote with up/down/left/right buttons.

Instead I prefer to have a more desktop-like OS and control the mouse with my phone, using Missing Link (something I wrote/maintain http://peaklabs.net/)

To play videos, I prefer to install VLC. Sure Kodi shows DVD covers for movies and all that, but personally I don't need it. Missing Link works with Kodi setups too though!

Lubuntu comes pre-installed with Firefox and Transmission (a bit torrent client) so no need to worry about these.

## Pre-requisites
Ideally all this could be a chef recipe or something, or saved as an ISO... if I were doing 1000's it'd make more sense that way, but for one-off experiments, this seems simpler:

- Download Lubuntu ISO, downloaded 17.04 (https://lubuntu.net/)
- Install via normal means (I used https://etcher.io/)
- Apply any updates, etc. (Lubuntu upgraded itself to 18.04... only made the bootable ISO recently!)

## Setup

### Enable SSH
`http://lubuntuhowto.blogspot.com/2014/09/how-to-install-ssh-server-on-lubuntu.html`

### Configuring Lubuntu fonts and panels to have larger icons/text to click on
```
$ rm -r ~/.config/lxpanel
cp /usr/share/lxpanel/profile/Lubuntu/panels/panel ~/.config/lxpanel/Lubuntu/panels
$ lxpanelctl restart
```
### Setting up so USB drives are accessible from all accounts
By default, USB drives are in /media and owned by the logged in user. We want root to auto-mount them on startup and have them available to all users (needed when setting up Samba later).

To do this, run the following
```
sudo mkdir /mnt/Elements
sudo mkdir /mnt/Music
sudo mkdir /mnt/4TB
```

### Configuring Transmission
- I just opened it and told it where to read torrents from and where to save downloads

### Software to install
- Install missing link
- VLC
`sudo apt-get install vlc`
- Adblock plugin on Firefox, or use pi-hole (https://pi-hole.net/)
- Install support for exFAT file system for Lubuntu (so large external drives can work, which are also windows & apple compatible)
`sudo apt-get install exfat-fuse exfat-utils`
- Install samba server
`Maybe use lubuntu synaptic package manager?`

### Setup intel driver for no tearing
See: https://askubuntu.com/questions/240923/enable-sync-to-vblank-on-lxde-with-intel-video-card

Basically write a config file to: /usr/share/X11/xorg.conf.d/20-intel.conf
Containing:
```
Section "Device"
Identifier  "Intel Graphics"
Driver      "intel"
Option      "AccelMethod"  "sna"
Option         "TearFree" "true"
EndSection
```
