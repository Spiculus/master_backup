# !/bash/bin
# This script will delete old backup, create new backup, and encrypt it,
# in a working repository. Then push it to the remote repository using lfs to
# handle larger files.

echo "Removing old backup from repositories"
cd /home/splinter/master_backup
sudo git init
sudo git config --global credential.helper cache
sudo git rm backup.tar.gz.cpt
sudo git commit -a # this will prompt you to make a note of changes
sudo git push https://github.com/Splinter1021/master_backup
echo "Creating new backup"
sudo tar -cvpzf /home/splinter/master_backup/backup.tar.gz /home/splinter/Pictures /home/splinter/Downloads /home/splinter/scripts /home/splinter/TestJavas /home/splinter/Videos
echo "Encrypting backup"
sudo ccrypt /home/splinter/master_backup/backup.tar.gz # you will get a prompt to create password
echo "Pushing backup to remote repository"
sudo git init
sudo git lfs track backup.tar.gz.cpt
sudo git add backup.tar.gz.cpt
sudo git commit -m bakup.tar.gz.cpt
sudo git push https://github.com/Splinter1021/master_backup
# you will get a prompt to enter username and password. I believe you can
# avoid this by cloning the remote repsitory directly, or using 'git config'
# options but I am not 100%, will update.
