//
//  FSOAuthHandlerAppDelegate.h
//  FSOAuthHandler
//
//  Created by Logan Allred on 12/13/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MPOAuth/MPOAuth.h>

@class SimpleHTTPConnection, SimpleHTTPServer, FSKConnection;

@interface FSKOAuthHandler : NSObject <MPOAuthAuthenticationMethodOAuthDelegate> {
    SimpleHTTPServer *server;
	MPOAuthAPI *_oauthAPI;
	NSString *oauthVerifier_;
//	OAToken *requestToken;
	NSURL *customURL;
	NSDictionary *identityProperties;
	id _delegate;
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

- (void)processURL:(NSURL *)path connection:(SimpleHTTPConnection *)connection;
- (void)stopProcessing;

- (void)setIdentityProperties:(NSDictionary *)properties;
- (void)setCustomURL:(NSURL *)url;
- (void)authenticate;

@end
