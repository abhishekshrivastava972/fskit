//
//  FSKDefaultAuthenticationDelegate.h
//  FSKit
//
//  Created by Logan Allred on 3/29/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKConnection.h"

@class FSKIdentityRequest, FSKIdentityResponse;

@interface FSKDefaultAuthenticationDelegate : NSObject {
	FSKConnection *connection;
}

- (void)initWithConnection:(FSKConnection *)aConnection;

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge; 

- (void)request:(FSKRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request;

- (void)request:(FSKIdentityRequest *)request didReturnResponse:(FSKIdentityResponse *)response;

@end
