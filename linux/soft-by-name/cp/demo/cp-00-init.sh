echo '--init:BEG'
echo '-- pwd: '`pwd `
rm -rfv "./tmp"
mkdir -vp "./tmp/inp"
mkdir -vp "./tmp/out"
echo "$(date)" >"./tmp/inp/1.txt"
echo '--init:res' && find "./tmp/"
echo '--init:END'