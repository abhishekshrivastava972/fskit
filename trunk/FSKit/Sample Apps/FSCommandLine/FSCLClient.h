//
//  FSCLClient.h
//  FSCommandLine
//
//  Created by Logan Allred on 8/31/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FSKit/FSKit.h>
#import <pwd.h>
#import <unistd.h>
#import <stdio.h>

@interface FSCLClient : NSObject {
	FSKConnection *connection;
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url;

@end
