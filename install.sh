#!/bin/bash

#===========================================
# Usages.
#===========================================

#-------------------------------------------
# View usage install options.
#-------------------------------------------
usage() {

  cat << EOF
Usage: ${0##*/} [<args>]

    -h            Show this message.
    -d <dir>      Set install directory.
    -v <version>  Set install version.
EOF

}


#===========================================
# Entry point of install script.
#===========================================

INSTALL_DIR="/usr/local/bin"
INSTALL_TAG="master"

while getopts hrl OPTION "$@"
do
  case ${OPTION} in
    d)
      INSTALL_DIR="${OPTARG}"
      ;;
    v)
      INSTALL_TAG="${OPTARG}"
      ;;
    *)
      usage
      exit 0
      ;;
  esac
done

# Download cli script
curl -s "https://raw.githubusercontent.com/kkoudev/gvw/${INSTALL_TAG}/gvw-cli" -o ${INSTALL_DIR}/gvw-cli

# Set executing mode
chmod a+x ${INSTALL_DIR}/gvw-cli

# Creates symbolic links
ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/gvw
ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/gow
ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/gofmtw
ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/godocw
