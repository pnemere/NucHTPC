# Assuming exfat support already installed

# Setting up so USB drives are accessible from all accounts
mkdir /mnt/Elements
mkdir /mnt/Music

# TODO: automate this, get UUID from blkid output & write to fstab

# Put them in fstab
blkid
# This should print something like
#/dev/sda1: LABEL="150gb" UUID="0617-83C7" TYPE="exfat" PARTUUID="e4017b22-01"
#/dev/sdb1: LABEL="Elements" UUID="807CE37E7CE36D7A" TYPE="ntfs" PARTUUID="0004836f-01"
#/dev/sdc1: UUID="43cc1733-6d2a-4752-bfc1-a09dd627bc1a" TYPE="ext4" PARTUUID="a8936e8b-01"

# Backup fstab file
cp /etc/fstab /etc/fstab.old

# Add UUIDs to fstab like this:
echo "UUID=807CE37E7CE36D7A /mnt/Elements auto nosuid,nodev,nofail,x-gvfs-show 0 0" >> /etc/fstab
echo "UUID=0617-83C7 /mnt/Music auto nosuid,nodev,nofail,x-gvfs-show 0 0" >> /etc/fstab

