//
//  MyInstallerPane.h
//  fEMRlogin
//
//  Created by Aaron Hillegass on 1/21/23.
//

#import <InstallerPlugins/InstallerPlugins.h>

@interface MyInstallerPane : InstallerPane

@property (weak) IBOutlet NSTextField *usernameField;
@property (weak) IBOutlet NSTextField *passwordField;
@property (weak) IBOutlet NSTextField *errorField;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;

- (IBAction)tryLogin:(id)sender;

@end
