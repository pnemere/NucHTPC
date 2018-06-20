# Configuring Lubuntu fonts and panels to have larger icons/text to click on
./setup-panels.sh

# Configure power management so don't have to login
#sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
#sudo apt-get purge light-locker

# Configuring Transmission
./setup-transmission.sh

# Software to install
./setup-software.sh

# Setup intel driver for no tearing
./setup-video.sh

# Setup NAS
./setup-nasdrives.sh
./setup-samba.sh

reboot