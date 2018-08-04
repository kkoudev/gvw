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
    -d <dir>      Set uninstall directory.
EOF

}


#===========================================
# Entry point of install script.
#===========================================

INSTALL_DIR="/usr/local/bin"

while getopts hrl OPTION "$@"
do
  case ${OPTION} in
    d)
      INSTALL_DIR="${OPTARG}"
      ;;
    *)
      usage
      exit 0
      ;;
  esac
done

# Prompt confirmation message
read -p "Really uninstall gvw? (y/N) : " CONTINUE_UNINSTALL

# Continue uninstall?
if [[ $(printf "${CONTINUE_UNINSTALL}" | tr '[:upper:]' '[:lower:]') = "y" ]]; then

  # Remove all commands
  rm -f ${INSTALL_DIR}/gvw
  rm -f ${INSTALL_DIR}/gow
  rm -f ${INSTALL_DIR}/gofmtw
  rm -f ${INSTALL_DIR}/godocw

  echo "Complete uninstallation."

fi
