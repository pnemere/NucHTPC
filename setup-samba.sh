# Assuming samba already installed

# Backup original config
cp /etc/samba/smb.conf /etc/samba/smb.conf.orig

# Write our shares into the config
cp /etc/samba/smb.conf ./smb.conf
cat samba-shares.txt >> ./smb.conf

# Create NAS user
#adduser nasdude
# ^--- This will prompt for passwords, etc

# Set this user up in samba
#smbpasswd -a nasdude
# ^--- This will prompt for password

# Add samba group
#groupadd samba

# Add the created user to the samba group
#gpasswd -a nasdude samba

# Set samba group to have permissions to read, write exectue on NAS mounts
#setfacl -R -m "g:samba:rwx" /mnt/Elements
#setfacl -R -m "g:samba:rwx" /mnt/Music
