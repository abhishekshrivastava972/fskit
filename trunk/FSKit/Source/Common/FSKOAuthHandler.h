//
//  FSOAuthHandlerAppDelegate.h
//  FSOAuthHandler
//
//  Created by Logan Allred on 12/13/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MPOAuth/MPOAuth.h>

#if TARGET_OS_IPHONE
#else
@class SimpleHTTPConnection, SimpleHTTPServer;
#endif
@class FSKConnection;

@interface FSKOAuthHandler : NSObject <MPOAuthAuthenticationMethodOAuthDelegate> {
#if TARGET_OS_IPHONE
#else
    SimpleHTTPServer *server;
#endif
	MPOAuthAPI *_oauthAPI;
	NSString *oauthVerifier_;
//	OAToken *requestToken;
	NSURL *customURL;
	NSDictionary *identityProperties;
	id _delegate;
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

#if TARGET_OS_IPHONE
#else
- (void)processURL:(NSURL *)path connection:(SimpleHTTPConnection *)connection;
#endif
- (void)stopProcessing;

- (void)setIdentityProperties:(NSDictionary *)properties;
- (void)setCustomURL:(NSURL *)url;
- (void)authenticate;

@end
