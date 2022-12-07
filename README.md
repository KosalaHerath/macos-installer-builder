# macOS Installer Builder

Creates a macOS installer for the fEMR application.

## File Structure

- `application` contains the files that will be installed on the user's machine upon running the installer.
- `darwin/Resources` contains resources used by the installer, such as the banner image, html pages, and other required texts. 
- `darwin/scripts` contains the preinstall and postinstall scripts that are used to install necessary dependencies when the installer runs. 

## Creating the Installer
To compile the files into a .pkg installer:
```
./macOS-x64/build-macos-x64.sh [APPLICATION_NAME] [APPLICATION_VERSION]
```
This will create the .pkg installer under the `/macOS-x64/target/pkg` directory. The installer can now be double clicked inside Finder and the installer will run through the necessary steps to install the fEMR software. 

Acknowledgements: https://medium.com/swlh/the-easiest-way-to-build-macos-installer-for-your-application-34a11dd08744
