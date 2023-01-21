//
//  MyInstallerPane.m
//  fEMRlogin
//
//  Created by Aaron Hillegass on 1/21/23.
//

#import "MyInstallerPane.h"

@implementation MyInstallerPane

- (IBAction)tryLogin:(id)sender
{
    NSString *username = [self.usernameField stringValue];
    NSString *password = [self.passwordField stringValue];
    if (username.length == 0 || password.length == 0) {
        NSBeep();
        return;
    }
    [self.progressIndicator startAnimation:nil];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:@"https://www.google.com/"]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [self.progressIndicator stopAnimation:nil];
        
        if(((NSHTTPURLResponse *)response).statusCode != 200){
            [self setNextEnabled:NO];
            [self.errorField setStringValue:@"Unsuccessful login"];
            return;
        }
        [self setNextEnabled:YES];
  
    }];
    
    [task resume];
    
}
    


- (NSString *)title
{
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"PaneTitle" value:nil table:nil];
}

@end
