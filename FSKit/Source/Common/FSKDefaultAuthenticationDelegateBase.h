//
//  FSKDefaultAuthenticationDelegateBase.h
//  FSKit
//
//  Created by Logan Allred on 4/27/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKConnection.h"
#import "FSKOAuthHandler.h"

@class FSKRequest;

@interface FSKDefaultAuthenticationDelegateBase : NSObject {
	FSKConnection *connection;
	id<FSKOAuthVerifierHandler> verifierHandler;
	NSURL *authenticationURL;	
}

- (id) initWithConnection:(FSKConnection *)aConnection;

- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url; 

- (void)performAuthentication;

@end
