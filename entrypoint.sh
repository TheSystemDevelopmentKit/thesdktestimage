#!/bin/sh -l

echo "github token is $1"

mkdir ${HOME}/.local
mkdir ${HOME}/.local/bin
PATH="${PATH}:${HOME}./local:${HOME}/.local/bin"

#if [ -d ./thesdk_template ]; then
#    rm -rf ./thesdk_template
#fi
#
#
#git clone https://github.com/TheSystemDevelopmentKit/thesdk_template.git 
#PYTHONPATH="$(pwd)/thesdk_template/Entities"
#export PYTHONPATH
#
#cd ./thesdk_template
#git checkout v1.8_RC
#
#./configure
#
#sed -i 's#\(url = \)\(git@\)\(.*\)\(:\)\(.*$\)#\1https://\3/\5#g' .gitmodules && git submodule sync && git submodule update --init
#./pip3userinstall.sh
#
#cd ./doc/docstrings
#
#make html
#
#git clone https://github.com/TheSystemDevelopmentKit/docs.git
#cd docs && git checkout main && git pull
#cp -rp ../build/html/* ./
#git add -A
#git config --global user.name "user name"
#git config --global user.email "user email"
#git commit -m"Update docs" && git push
#
#OUT="Success"
#echo $OUT
#echo "::set-output name=outstring::$OUT"
exit 0

