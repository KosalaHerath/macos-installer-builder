# fEMR Installers

Creates installers for the fEMR application for Mac and Windows systems.

## File Structure

- `macOS-x64` contains the files for creating the Mac installer.
- `windowsInstaller` contains files for creating the Windows installer.
- `release.py`

Check out the READMEs for the [macOS-x64](macOS-x64/README.md) and [windowsInstaller](windowsInstaller/README.md) directories for further details and instructions on how to create and use the installers.

## Other Repositories

- [AWS](https://github.com/CPSECapstone/self-enrollment-frontend) - AWS code for CI pipeline and API
- [Frontend](https://github.com/CPSECapstone/self-enrollment-frontend) - Frontend React code for self-enrollment webpage

## Building the MacOSX installer

- Make sure that an up-to-date femr docker image has been pushed to Dockerhub from the super-femr repository.
- `cd` into the mac-OS-x64 folder and run `./build-macos-x64.sh femr \[version\]`
- An installer package will be generated in the `/target/pkg/
- To test, double click the .pkg.

## Uploading a release

- Make sure that an up-to-date femr docker image has been pushed to Dockerhub from the super-femr repository.
- Make sure your AWS configuration file is configured to write to the release S3 bucket.
- Run release.py (if necessary, you can install the necessary requirements from the requirements.txt at the top level of this repository)
