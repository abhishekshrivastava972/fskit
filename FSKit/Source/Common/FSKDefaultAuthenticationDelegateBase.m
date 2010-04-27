//
//  FSKDefaultAuthenticationDelegateBase.m
//  FSKit
//
//  Created by Logan Allred on 4/27/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKDefaultAuthenticationDelegateBase.h"


@implementation FSKDefaultAuthenticationDelegateBase

- (id)initWithConnection:(FSKConnection *)aConnection;
{
	self = [super init];
	if (self != nil) {
		connection = [aConnection retain];
	}
	return self;
}

- (void) dealloc
{
	[connection release];
	[super dealloc];
}


- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url;
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);
	[self handleAuthenticationURL:url];
}

- (NSURL *)callbackURL
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return [verifierHandler callbackURL];
}

- (void)setVerifier:(NSString *)verifier
{
	NSLog(@"%s verifier:%@", __PRETTY_FUNCTION__, verifier);
	[connection processVerifier:verifier];
}

- (BOOL)automaticallyRequestAuthenticationFromURL:(NSURL *)inAuthURL withCallbackURL:(NSURL *)inCallbackURL {
	NSLog(@"%s url: %@ callback: %@", __PRETTY_FUNCTION__, inAuthURL, inCallbackURL);
	authenticationURL = [[NSURL URLWithString:[NSString stringWithFormat:@"%@&template=mobile", [inAuthURL standardizedURL]]] retain];
	[self handleAuthenticationURL:authenticationURL];
	return NO;	
}

- (void)authenticationDidSucceedWithToken:(NSString *)token
{
	NSLog(@"%s token: %@", __PRETTY_FUNCTION__, token);
	[connection setSessionId:token];
	[connection setNeedsAuthentication:NO];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationDidSucceed object:token];
	//	[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
	//	[loginController cancelAuthentication];
}

- (void)authenticationDidFailWithError:(NSError *)error
{
	NSLog(@"%s error: %@", __PRETTY_FUNCTION__, error);
	[connection setSessionId:nil];
	[connection setNeedsAuthentication:YES];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationDidFail object:error];
}

@end
