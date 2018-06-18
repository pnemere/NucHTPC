# Configuring Lubuntu fonts and panels to have larger icons/text to click on
./setup-panels.sh

# Configure power management so don't have to login
#sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
#sudo apt-get purge light-locker

# Configuring Transmission
# TODO

# Software to install
./setup-software.sh

# Setup intel driver for no tearing
./setup-video.sh

# Setting up so USB drives are accessible from all accounts
sudo mkdir /mnt/Elements
sudo mkdir /mnt/Music
sudo mkdir /mnt/4TB

sudo blkid
# This should print something like
#/dev/sda1: LABEL="150gb" UUID="0617-83C7" TYPE="exfat" PARTUUID="e4017b22-01"
#/dev/sdb1: LABEL="Elements" UUID="807CE37E7CE36D7A" TYPE="ntfs" PARTUUID="0004836f-01"
#/dev/sdc1: UUID="43cc1733-6d2a-4752-bfc1-a09dd627bc1a" TYPE="ext4" PARTUUID="a8936e8b-01"

# We need entries in 