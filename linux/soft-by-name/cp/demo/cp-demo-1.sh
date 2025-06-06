clear
bash cp-00-init.sh
inp_dir="./tmp/inp/"
out_dir="./tmp/out/"
echo "------------------------------"
echo "-- before: ${out_dir}" && find "${out_dir}"
echo "-- is dir: ${out_dir}: "$( [ -d "./tmp/inp/" ] && echo 'YES' || echo 'NO' )
#echo "-- copy  :" && cp -vf "./tmp/inp/*" "${out_dir}"

echo "-- copy  :"
cp -vf "./tmp/inp/*" "./tmp/out/"

echo "-- after : ${out_dir}" && find "${out_dir}"

