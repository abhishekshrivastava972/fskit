//
//  FSKOAuthSimpleServer.h
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKOAuthHandler.h"
#import "SimpleHTTPConnection.h"
#import "SimpleHTTPServer.h"

@interface FSKOAuthSimpleServer : NSObject <FSKOAuthVerifierHandler> {
    SimpleHTTPServer *server;
	NSUInteger port;
	NSString *oauthVerifier;
	id delegate;
}

- (id)initWithDelegate:(id)theDelegate;

- (void)processURL:(NSURL *)path connection:(SimpleHTTPConnection *)connection;
- (void)stopProcessing;

- (NSUInteger)port;
- (void)setPort:(NSUInteger)value;

@end
