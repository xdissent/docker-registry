#!/bin/bash
SCRIPT_DIR=$(dirname $0)

cd $SERVICE_APPROOT

[ -d ~/env ] ||
    virtualenv --python=python2.7 ~/env || (echo fail && exit 1)

. ~/env/bin/activate

[ -f ${SCRIPT_DIR}/requirements.txt ] &&
    pip install --download-cache=~/.pip-cache -r ${SCRIPT_DIR}/requirements.txt || (echo fail2 && exit 1)

cp -R ${SCRIPT_DIR}/* ~/

cat > ~/profile << ENDPROFILE
. ${HOME}/env/bin/activate
export PYTHONPATH=${HOME}
ENDPROFILE
