#!/bin/sh
#
# applypatch.sh
# apply patches
#


dir=`cd $(dirname $0) && pwd`
top=$dir/../../../..

for patch in `ls $dir/*.patch` ; do
    echo ""
    echo "==> patch file: ${patch##*/}"
    patch -p1 -N -i $patch -r - -d $top
done

find . -name "*.orig" -delete

#### Reverts ####

# tinyalsa
cd $top/external/tinyalsa
git revert --no-edit 3bba475d5ad4db3f813ff121ff3d195043307f46

cd $top
