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
    -v <version>  Set install version.
EOF

}


#===========================================
# Entry point of install script.
#===========================================

readonly INSTALL_DIR="/usr/local/bin"
INSTALL_TAG="master"
SUDO_ACCESS=""

# Apple Silicon?
if [[ $(uname -s) == "Darwin" && $(uname -m) == "arm64" ]]; then
  SUDO_ACCESS="sudo"
fi

while getopts v:h OPTION "$@"
do
  case ${OPTION} in
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
${SUDO_ACCESS} curl -s "https://raw.githubusercontent.com/kkoudev/gvw/${INSTALL_TAG}/gvw-cli" -o ${INSTALL_DIR}/gvw-cli

# Set executing mode
${SUDO_ACCESS} chmod a+x ${INSTALL_DIR}/gvw-cli

# Creates symbolic links
for CMD_NAME in gvw
do
  ${SUDO_ACCESS} ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/${CMD_NAME}
done

# Creates symbolic links for general commands
for CMD_NAME in go gofmt godoc
do

  if [[ -e ${INSTALL_DIR}/${CMD_NAME} ]]; then

    # Not gvw-cli command?
    if [[ ! -L ${INSTALL_DIR}/${CMD_NAME} \
         || (-L ${INSTALL_DIR}/${CMD_NAME} && $(readlink ${INSTALL_DIR}/${CMD_NAME} | tr -d '\n') != ${INSTALL_DIR}/gvw-cli) ]]; then

      read -p "Overwrite already installed \"${CMD_NAME}\" command? (y/N) : " CONTINUE_INSTALL
      [[ $(printf "${CONTINUE_INSTALL}" | tr '[:upper:]' '[:lower:]') != "y" ]] && continue

    fi

  fi

  # Creates symbolic link for general command
  ${SUDO_ACCESS} ln -sf ${INSTALL_DIR}/gvw-cli ${INSTALL_DIR}/${CMD_NAME}

done
