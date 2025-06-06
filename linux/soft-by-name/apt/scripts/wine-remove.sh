
apt list --installed |grep wine

# https://askubuntu.com/questions/15551/how-to-remove-wine-completely
sudo apt-get --purge remove wine wine64 libwine fonts-wine
cd $HOME
rm -r .wine
rm .config/menus/applications-merged/wine*
rm -r .local/share/applications/wine
rm .local/share/desktop-directories/wine*
rm .local/share/icons/????_*.xpm

sudo apt-get --purge remove q4wine wine32 libwine


apt policy wine wine32 wine64
sudo dpkg --remove libwine