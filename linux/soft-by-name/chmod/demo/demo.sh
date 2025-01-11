#------------------------------------------------------------------------------
# 0 > ---
# 1 > --x
# 2 > -w-
# 3 > -wx
# 4 > r--
# 5 > r-x
# 6 > rw-
# 7 > rwx
#-----

#echo  '-- '
#chmod 770 demo-file.bin
#ls -la demo-file.bin
#exit 0

#------------------------------------------------------------------------------

echo  '-- current state'
ls -la demo-file.bin
# -rw-r--r-- 1 ivan ivan 0 янв  3 14:53 demo-file.bin
# Аналог 644

echo  '-- +x'
chmod +x demo-file.bin
ls -la demo-file.bin
# -rwxr-xr-x 1 ivan ivan 0 янв  3 14:53 demo-file.bin

echo  '-- -x'
chmod -x demo-file.bin
ls -la demo-file.bin
# -rw-r--r-- 1 ivan ivan 0 янв  3 14:53 demo-file.bin

echo  '-- 777'
chmod 777 demo-file.bin
ls -la demo-file.bin
# -rwxrwxrwx 1 ivan ivan 0 янв  3 14:53 demo-file.bin

echo  '-- 755'
chmod 755 demo-file.bin
ls -la demo-file.bin
# -rwxr-xr-x 1 ivan ivan 0 янв  3 14:53 demo-file.bin

echo  '-- 744'
chmod 644 demo-file.bin
ls -la demo-file.bin
# -rw-r--r-- 1 ivan ivan 0 янв  3 14:53 demo-file.bin

#------------------------------------------------------------------------------
chmod 755 su-script.sh
chmod +s  su-script.sh
chown root:root  su-script.sh
bash su-script.sh
#------------------------------------------------------------------------------
