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
  for CMD_NAME in gvw-cli gvw gow gofmtw godocw
  do
    rm -f ${INSTALL_DIR}/${CMD_NAME}
  done

  # Remove all general commands
  for CMD_NAME in go gofmt godoc
  do
    [[ -e ${INSTALL_DIR}/${CMD_NAME} \
      && -L ${INSTALL_DIR}/${CMD_NAME} \
      && $(readlink ${INSTALL_DIR}/${CMD_NAME} | tr -d '\n') = ${INSTALL_DIR}/gvw-cli ]] && rm -f ${INSTALL_DIR}/${CMD_NAME}
  done

  echo "Complete uninstallation."

fi
