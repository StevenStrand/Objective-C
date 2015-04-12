//
//  AppDelegate.h
//  SSH Tool
//
//  Created by Steven Strand on 4/12/15.
//  Copyright (c) 2015 Steven Strand. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic) NSMutableArray *computers;

@property (nonatomic) IBOutlet NSTableView *computerTable;

- (IBAction)addComputer:(id)sender;

@end

