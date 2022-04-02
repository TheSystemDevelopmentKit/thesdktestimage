#/usr/bin/env bash

#if [ -d /thesdk_template ]; then
#    rm -rf /thesdk_template
#fi
#git clone https://github.com/TheSystemDevelopmentKit/thesdk_template.git
#
#cd /thesdk_template
#git checkout v1.8_RC
#
#./configure
#
#sed -i 's#\(url = \)\(git@\)\(.*\)\(:\)\(.*$\)#\1https://\3/\5#g' .gitmodules && git submodule sync && git submodule update --init
#./pip3userinstall.sh
#
#cd doc/docstrings
#
#make html
#cat build/html/index.html
OUT="Success"
echo $OUT
echo "::set-output name=outstring::$OUT"
exit 0

