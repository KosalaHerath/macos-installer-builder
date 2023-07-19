[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

# macOS Installer Builder
Generate macOS installers for your applications and products from one command.

For a more detailed process please refer medium blog about the macOS installer builder: https://medium.com/swlh/the-easiest-way-to-build-macos-installer-for-your-application-34a11dd08744
<p align="center"> 
  <img src="https://cdn.dribbble.com/users/1161517/screenshots/7896076/apple-logo-animation.gif" width="600" height="450" />
</p>

## Let’s Build our macOS Installer

First, you need to clone the macOS installer builder repository on your machine and then add needed configurations to it. After that, you only need to run the command to build your application’s installer. Let’s start our journey.

1. Clone macos-installer-builder repository to your local machine. You can clone the repository by the following command. Let’s define the repository’s home as <REPO_HOME>.
```
git clone https://github.com/KosalaHerath/macos-installer-builder.git
```
2. Copy your application’s distribution files (which you need to be copied after the installation) to the application directory which is located at:
```
<REPO_HOME>/macOS-x64/application/
```
3. Modify the following files with your application's information. You can find these resource files in the following location.
```
<REPO_HOME>/macOS-x64/darwin/Resources/
```
#### welcome.html : 
The welcome page of the installer can be defined by this HTML file.

#### conclusion.html :
This file contains the conclusion file’s HTML design and you can change it as you wish. 

#### banner.png :
Add an image of your application’s logo after renaming it as banner.png. 

4. Add your needed modifications to the post-installation script file. This script will run automatically after the installation and you can add your needed functionalities to this file. The file is located at:
```
<REPO_HOME>/macOS-x64/darwin/scripts/postinstall
```
5. Run the following command to build your macOS installer.
```
bash <PRODUCT_HOME>/macOS-x64/build-macos-x64.sh [APPLICATION_NAME] [APPLICATION_VERSION]
```
Note: You should provide an application name and application version. In addition, the application version should be [0–9].[0–9].[0–9] pattern ( Example: 2.6.0 ). This will start the installer generating process (3-step process) and after two progress it will ask your preference on installer signing. Please refer to this section for more details on installer signing. If you have an Apple Developer Installer Certificate issued by the Developer ID Certification Authority of Apple you can sign your installer by giving you certificate ID. If you wish to create the installer without signing you can skip that step (You need an internet connection to sign the installer).

After the successful three steps, the macOS installer builder will create .pkg file of your application on the following location:

#### Signed Package:
```
<REPO_HOME>/macOS-x64/target/pkg-signed/
```

#### Un-signed Package:
```
<REPO_HOME>/macOS-x64/target/pkg/
```
That’s it. Now you can start the installation process by clicking the .pkg file.

## Signing .pkg files

Run the below command to sign the .pkg file
```
productsign --sign "Developer ID Installer: <CERTIFICATE_NAME_AND_ID>" <INSTALLER_NAME>.pkg
```
To verify the signed .pkg file run the following command:
```
pkgutil --check-signature signed/<SIGNED_INSTALLER_NAME>.pkg
```
You will see an output with SHA1 fingerprint after the above command if the .pkg file’s sign validation is successful.

Please suggest any modifications that will improve these implementations by reporting an issue. Happy to help you!

Cheers!! 🍺
