//
//  FSOAuthHandlerAppDelegate.h
//  FSOAuthHandler
//
//  Created by Logan Allred on 12/13/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MPOAuth/MPOAuth.h>

@class FSKConnection;

@interface FSKOAuthHandler : NSObject <MPOAuthAuthenticationMethodOAuthDelegate> {
	MPOAuthAPI *oauthAPI;
	NSString *oauthVerifier;
	NSDictionary *identityProperties;
	id delegate;
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

- (void)setIdentityProperties:(NSDictionary *)properties;
- (void)setVerifier:(NSString *)verifier;
- (void)authenticate;
- (NSString *)accessToken;

@end

@protocol FSKOAuthVerifierHandler <NSObject>

- (NSString *) verifier;
- (NSURL *) callbackURL;

@end

