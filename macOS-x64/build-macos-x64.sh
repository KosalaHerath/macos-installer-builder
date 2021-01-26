#!/bin/bash

#Configuration Variables and Parameters

function printSignature() {
  cat ./utils/ascii_art.txt
  echo
}

function printUsage() {
  echo -e "\033[1mUsage:\033[0m"
  echo "$0 [APPLICATION_NAME] [APPLICATION_VERSION]"
  echo
  echo -e "\033[1mOptions:\033[0m"
  echo "  -h (--help)"
  echo
  echo -e "\033[1mExample::\033[0m"
  echo "$0 wso2am 2.6.0"

}

#Start the generator
printSignature

#Argument validation
if [[ "$1" == "-h" ||  "$1" == "--help" ]]; then
    printUsage
    exit 1
fi
if [ -z "$1" ]; then
    echo "Please enter a valid application name for your application"
    echo
    printUsage
    exit 1
else
    echo "Application Name : $1"
fi
if [[ "$2" =~ [0-9]+.[0-9]+.[0-9]+ ]]; then
    echo "Application Version : $2"
else
    echo "Please enter a valid version for your application (fromat [0-9].[0-9].[0-9])"
    echo
    printUsage
    exit 1
fi

#Parameters
DESTDIR=/
TARGET_DIRECTORY="target"
PRODUCT=${1}
VERSION=${2}
DATE=`date +%Y-%m-%d`
TIME=`date +%H:%M:%S`
LOG_PREFIX="[$DATE $TIME]"

#Functions
function go_to_dir() {
    pushd $1 >/dev/null 2>&1
}

function log_info() {
    echo "${LOG_PREFIX}[INFO]" $1
}

function log_warn() {
    echo "${LOG_PREFIX}[WARN]" $1
}

function log_error() {
    echo "${LOG_PREFIX}[ERROR]" $1
}

function rebuild_dirs() { 
    for name in $@ ; do
      echo rm -rf ${TARGET_DIRECTORY}${name}
      echo mkdir -p ${TARGET_DIRECTORY}${name}
    done
}
function update_perms() { 
    for name in $@ ; do
      echo chmod -R 755 ${TARGET_DIRECTORY}${name}
    done
}
function update_perm() { 
    for name in $@ ; do
        echo chmod 755 ${TARGET_DIRECTORY}${name}
    done
}
function replace_var() { 
    echo sed -i '' -e "s/__${1}__/\${${1}}/g" ${TARGET_DIRECTORY}${2}
}
function update_vars() {
    files=$@
    for name in ${files}; do
      for var in DESTDIR VERSION PRODUCT; do
        replace_var ${var} ${name}
      done
    done
}

function deleteInstallationDirectory() {
    log_info "Cleaning $TARGET_DIRECTORY directory."
    rm -rf $TARGET_DIRECTORY

    if [[ $? != 0 ]]; then
        log_error "Failed to clean $TARGET_DIRECTORY directory" $?
        exit 1
    fi
}

function createInstallationDirectory() {
    if [ -d ${TARGET_DIRECTORY} ]; then
        deleteInstallationDirectory
    fi
    mkdir $TARGET_DIRECTORY

    if [[ $? != 0 ]]; then
        log_error "Failed to create $TARGET_DIRECTORY directory" $?
        exit 1
    fi
}

function copyDarwinDirectory(){
  createInstallationDirectory
  cp -r darwin ${TARGET_DIRECTORY}/
  update_perms /darwin/scripts /darwin/Resources
  update_perm /darwin/Distribution
}

function copyBuildDirectory() {
    update_vars /darwin/scripts/postinstall /darwin/Distribution /darwin/Resources/*.html
    update_perms /darwin/scripts/postinstall /darwin/Distribution /darwin/Resources/
    rebuild_dirs /darwinpkg /package /pkg

    #Copy cellery product to /Library/Cellery
    mkdir -p ${TARGET_DIRECTORY}/darwinpkg/Library/${PRODUCT}/${VERSION}
    cp -a ./application/. ${TARGET_DIRECTORY}/darwinpkg/Library/${PRODUCT}/${VERSION}
    update_perms /darwinpkg/Library/${PRODUCT}/${VERSION} /package /pkg

}

function buildPackage() {
    log_info "Apllication installer package building started.(1/3)"
    pkgbuild --identifier org.${PRODUCT}.${VERSION} \
    --version ${VERSION} \
    --scripts ${TARGET_DIRECTORY}/darwin/scripts \
    --root ${TARGET_DIRECTORY}/darwinpkg \
    ${TARGET_DIRECTORY}/package/${PRODUCT}.pkg > /dev/null 2>&1
}

function buildProduct() {
    log_info "Application installer product building started.(2/3)"
    productbuild --distribution ${TARGET_DIRECTORY}/darwin/Distribution \
    --resources ${TARGET_DIRECTORY}/darwin/Resources \
    --package-path ${TARGET_DIRECTORY}/package \
    ${TARGET_DIRECTORY}/pkg/$1 > /dev/null 2>&1
}

function signProduct() {
    log_info "Application installer signing process started.(3/3)"
    mkdir -p ${TARGET_DIRECTORY}/pkg-signed
    chmod -R 755 ${TARGET_DIRECTORY}/pkg-signed

    read -p "Please enter the Apple Developer Installer Certificate ID:" APPLE_DEVELOPER_CERTIFICATE_ID
    productsign --sign "Developer ID Installer: ${APPLE_DEVELOPER_CERTIFICATE_ID}" \
    ${TARGET_DIRECTORY}/pkg/$1 \
    ${TARGET_DIRECTORY}/pkg-signed/$1

    pkgutil --check-signature ${TARGET_DIRECTORY}/pkg-signed/$1
}

function createInstaller() {
    log_info "Application installer generation process started.(3 Steps)"
    buildPackage
    buildProduct ${PRODUCT}-macos-installer-x64-${VERSION}.pkg
    while true; do
        read -p "Do you wish to sign the installer (You should have Apple Developer Certificate) [y/N]?" answer
        [[ $answer == "y" || $answer == "Y" ]] && FLAG=true && break
        [[ $answer == "n" || $answer == "N" || $answer == "" ]] && log_info "Skiped signing process." && FLAG=false && break
        echo "Please answer with 'y' or 'n'"
    done
    [[ $FLAG == "true" ]] && signProduct ${PRODUCT}-macos-installer-x64-${VERSION}.pkg
    log_info "Application installer generation steps finished."
}

function createUninstaller(){
    cp darwin/Resources/uninstall.sh ${TARGET_DIRECTORY}/darwinpkg/Library/${PRODUCT}/${VERSION}
    sed -i '' -e "s/__VERSION__/${VERSION}/g" "${TARGET_DIRECTORY}/darwinpkg/Library/${PRODUCT}/${VERSION}/uninstall.sh"
    sed -i '' -e "s/__PRODUCT__/${PRODUCT}/g" "${TARGET_DIRECTORY}/darwinpkg/Library/${PRODUCT}/${VERSION}/uninstall.sh"
}

#Pre-requisites
command -v mvn -v >/dev/null 2>&1 || {
    log_warn "Apache Maven was not found. Please install Maven first."
    # exit 1
}
command -v ballerina >/dev/null 2>&1 || {
    log_warn "Ballerina was not found. Please install ballerina first."
    # exit 1
}

#Main script
log_info "Installer generating process started."

copyDarwinDirectory
copyBuildDirectory
createUninstaller
createInstaller

log_info "Installer generating process finished"
exit 0
