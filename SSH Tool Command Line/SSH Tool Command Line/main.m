//
//  main.m
//  SSH Tool Command Line
//
//  Created by Steven Strand on 4/12/15.
//  Copyright (c) 2015 Steven Strand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

typedef struct {
    char server[50];
    char username[50];
    char password[50];
} Computer;

Boolean verifyNotBlank(NSString *string)
{
    if ([string length] == 0) {
        return false;
    }
    return true;
}

int main(int argc, const char * argv[]) {
    char localUsername[50] = {0};
    printf("Local Username: ");
    scanf("%s", localUsername);
    char server[50] = {0};
    printf("Server Address: ");
    scanf("%s", server);
    char username[50] = {0};
    printf("Remote Username: ");
    scanf("%s", username);
    char password[50] = {0};
    printf("Password: ");
    scanf("%s", password);
    
    int pid = [[NSProcessInfo processInfo] processIdentifier];
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    NSTask *task = [[NSTask alloc] init];
    task.standardOutput= pipe;
    
    [task setCurrentDirectoryPath:[NSString stringWithFormat:@"/Users/%s/Desktop", localUsername]];
    [task setLaunchPath:@"/bin/ls"];
    
    
    NSArray *args = [NSArray arrayWithObjects:@"-al", [NSString stringWithFormat:@"/Users/%s/.ssh/", localUsername], nil];
    [task setArguments: args];
    
    [task launch];
    NSData *data = [file readDataToEndOfFile];
    [file closeFile];
    [task terminate];
    
    NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    if ([grepOutput rangeOfString:@"id_rsa"].location == NSNotFound) {
        NSLog(@"id_rsa does not exist.  Please generate an id_rsa via the command ssh-keygen -t rsa in terminal.");
    } else {
        NSLog(@"id_rsa exists for %s.  Copying id_rsa to remote machine %s.", localUsername, server);
        NSTask *task = [[NSTask alloc] init];
        [task setLaunchPath:@"/bin/cat"];
        NSArray *args = [NSArray arrayWithObjects:[NSString stringWithFormat:@"/Users/%s/.ssh/id_rsa.pub", localUsername],[NSString stringWithFormat:@"/Users/%s/.ssh/", username], @"|", @"/usr/bin/ssh",[NSString stringWithFormat:@"%s@hostname", username], @"'cat", @">>", @".ssh/authorized_keys'", nil];
        [task setArguments:args];
        [task launch];
        [file closeFile];
        
        NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    }
    
    printf("%s\n", server);
    printf("%s\n", username);
    printf("%s\n", password);

    
    return 0;
}
