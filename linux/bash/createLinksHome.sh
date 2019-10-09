#!/bin/bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
inpDir=`pwd`
outDir=`echo ~`
echo 'inpDir='${inpDir}
echo 'outDir='${outDir}
echo '========'
for DIRNAME in `ls -1d *`
do
    inpPath=$inpDir'/'$DIRNAME
    outPath=$outDir'/'$DIRNAME
    if [ -d $inpPath ]; then
		if [ -e $outPath ]; then
		  echo 'SKIPPED '$outPath 
		else
		  ln -s ${inpPath} ${outPath}
		  echo 'LINKED  '$outPath 
		fi
	fi
done

exit 0
