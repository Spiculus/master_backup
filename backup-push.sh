# !/bash/bin
# This script will create a backup, encrypt it, copy it into a working
# repository, and then push it to the remote repository using lfs to handle larger files.

echo "Creating backup"
sudo tar -cvpzf backup.tar.gz /home/splinter/Pictures /home/splinter/Downloads /home/splinter/scripts /home/splinter/TestJavas /home/splinter/Videos
echo "Encrypting backup and moving to local repository"
sudo ccrypt backup.tar.gz # you will get a prompt to create password
sudo mv -i backup.tar.gz.cpt /home/splinter/large-repo/backup.tar.gz.cpt
echo "Pushing backup to remote repository"
cd /home/splinter/large-repo
sudo git init
sudo git lfs track backup.tar.gz.cpt
sudo git add backup.tar.gz.cpt
sudo git commit -m bakup.tar.gz.cpt
sudo git push origin master 
# you will get a prompt to enter username and password. I believe you can avoid this by cloning the remote repsitory directly,
# or using 'git config' options but I am not 100%, will update.
