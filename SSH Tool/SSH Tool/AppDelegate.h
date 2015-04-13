//
//  AppDelegate.h
//  SSH Tool
//
//  Created by Steven Strand on 4/12/15.
//  Copyright (c) 2015 Steven Strand. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSResponder <NSApplicationDelegate, NSTableViewDataSource>
// Computers Array
@property (nonatomic) NSMutableArray *computers;
// Computers Table
@property (nonatomic) IBOutlet NSTableView *computersTable;
// Text Fields
@property (nonatomic) IBOutlet NSTextField *computerField;
@property (nonatomic) IBOutlet NSTextField *usernameField;
@property (nonatomic) IBOutlet NSTextField *passwordField;
// Buttons
@property (nonatomic) IBOutlet NSButton *addButton;
@property (nonatomic) IBOutlet NSButton *generateButton;
@property (nonatomic) IBOutlet NSButton *remoteButton;
// Checbox Button
@property (nonatomic) IBOutlet NSButton *placeButton;

// Actions
#pragma mark - Actions
- (IBAction) generateKeys:(id)sender;
- (IBAction) addComputer:(id)sender;
- (IBAction) remoteComputer:(id)sender;

@end
