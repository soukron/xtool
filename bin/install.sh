#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
XTOOL_BASEDIR=${HOME}/opt
XTOOL_DIR=${XTOOL_BASEDIR}/xtool
XTOOL_VERSION="$( cat ${SCRIPT_DIR}/../VERSION )"

echo This script will install XTool wrapper ${XTOOL_VERSION} in ${XTOOL_BASEDIR} and will set it as the default version.
echo Press [ENTER] to continue or press CTRL+C to cancel...
read

echo Installing XTool wrapper ${XTOOL_VERSION}...
echo - Creating directories in ${XTOOL_BASEDIR}...
[ ! -d ${XTOOL_BASEDIR} ] && mkdir ${XTOOL_BASEDIR}
[ ! -d ${XTOOL_BASEDIR}/bin ] && mkdir ${XTOOL_BASEDIR}/bin
[ ! -d ${XTOOL_BASEDIR}/xtool ] && mkdir ${XTOOL_BASEDIR}/xtool

echo - Copying files to ${XTOOL_DIR}/${XTOOL_VERSION}
[ ! -d ${XTOOL_DIR}/${XTOOL_VERSION} ] && mkdir ${XTOOL_DIR}/${XTOOL_VERSION}
GLOBIGNORE='.git*' cp -a $SCRIPT_DIR/../* ${XTOOL_DIR}/${XTOOL_VERSION}

echo - Setting ${XTOOL_VERSION} as default version...
ln -sf ${XTOOL_VERSION} ${XTOOL_DIR}/default

echo - Creating ${XTOOL_DIR}/bin directory and symlinks...
[ ! -d ${XTOOL_DIR}/bin ] && mkdir ${XTOOL_DIR}/bin
ln -sf ../xtool/default/lib/xtool-exec ${XTOOL_BASEDIR}/bin/xtool-exec
ln -sf ../xtool/default/lib/xtool-main ${XTOOL_BASEDIR}/bin/xtool-main

echo - Installing hello sample application in ${XTOOL_BASEDIR}/hello-world...
[ ! -d ${XTOOL_BASEDIR}/hello-world ] && cp -a $SCRIPT_DIR/../resources/samples/hello-world ${XTOOL_BASEDIR}
ln -sf ../hello-world/bin/hello ${XTOOL_BASEDIR}/bin/hello
echo

echo Done! Remember to add ${XTOOL_BASEDIR}/bin to your \${PATH} to use this software.
