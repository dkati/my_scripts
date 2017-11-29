echo "Disabling swappiness..."
echo -e "vm.swappiness=0" | sudo tee -a /etc/sysctl.conf
echo "Creating a cron executable on daily basis..."
echo -e "#\x21/bin/sh\\nfstrim -v /" | sudo tee /etc/cron.daily/trim
echo "Allowing system to execute the trim job..."
sudo chmod +x /etc/cron.daily/trim
echo "Now trimming the SSD"
echo ""
sudo fstrim -v /
echo ""

echo "Manually change the mount flag by replacing"
echo "'errors=remount-ro' to 'noatime,errors=remount-ro' "
echo "Sleeping for 3 seconds and opening the file..."
sleep 3
sudo nano /etc/fstab
