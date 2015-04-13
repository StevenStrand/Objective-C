//
//  AppDelegate.m
//  SSH Tool
//
//  Created by Steven Strand on 4/12/15.
//  Copyright (c) 2015 Steven Strand. All rights reserved.
//

#import "AppDelegate.h"

typedef struct {
    char computer;
    char username;
    char password;
} Computer;

NSString *BNRDocPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@implementation AppDelegate
- (void)generateKeys:(id)sender {
    NSLog(@"Generate");
}
- (void)addComputer:(id)sender {
    // Load an existing dataset or create a new one
    NSArray *plist = [NSArray arrayWithContentsOfFile:BNRDocPath()];
    if (plist) {
        // We have a dataset; copy it into tasks
        self.computers = [plist mutableCopy];
    } else {
        self.computers = [NSMutableArray array];
    }
        
    // Get the task
    Computer computer;
    computer.computer = [self.computerField value];
    computer.username = [self.usernameField value];
    computer.password = [self.passwordField value];
    // Quit here if computer is empty
    if ([computer.computer length] == 0 || [computer.username length] == 0 || [computer.password length] == 0) {
        return;
    }
    
    // Add it to the working array
    [self.computers addObject:];
    
    // Refresh the table so that the new item shows up
    [self.taskTable reloadData];
    
    // Log text to console
    NSLog(@"Task entered: %@", text);
    
    // Clear out the text field
    [self.taskField setText:@""];
    
    //Dismiss the keyboard
    [self.taskField resignFirstResponder];
}
- (void)remoteComputer:(id)sender {
    NSLog(@"Remote");
}

- (void)applicationDidFinishLaunching:(NSNotification *) aNotification {
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)addTask:(id)sender
{

}
@end
