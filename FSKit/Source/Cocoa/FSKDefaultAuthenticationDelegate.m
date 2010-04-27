//
//  FSKDefaultAuthenticationDelegate.m
//  FSKit
//
//  Created by Logan Allred on 3/29/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKDefaultAuthenticationDelegate.h"
#import "FSKRequest.h"
#import "FSKResponse.h"
#import "FSKIdentityRequest.h"
#import "FSKIdentityResponse.h"
#import "FSKIdentityService.h"
#import "FSKLoginController.h"
#import "FSKConnection.h"
#import "FSKOAuthSimpleServer.h"

@implementation FSKDefaultAuthenticationDelegate

- (id) initWithConnection:(FSKConnection *)aConnection
{
	self = [super init];
	if (self != nil) {
		connection = [aConnection retain];
		verifierHandler = [[[FSKOAuthSimpleServer alloc] initWithDelegate:self] retain];
	}
	return self;
}

- (void) dealloc
{
	[verifierHandler release];
	[authenticationURL release];
	[connection release];
	[super dealloc];
}


- (void)handleAuthenticationURL:(NSURL *)url
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationURLWillOpen object:self];
	FSKLoginController *loginController = [[FSKLoginController alloc] initWithDelegate:self];
	[loginController startAuthenticationForWindow:[self windowForAuthenticationSheet:nil]];
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url;
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);
	[self handleAuthenticationURL:url];
}

- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return [NSApp mainWindow];	
}

- (void)request:(FSKIdentityRequest *)request didReturnResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	if ([response sessionId])
	{
		[connection setSessionId:[response sessionId]];
		[connection setNeedsAuthentication:NO];
	}
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
	authenticationURL = [inAuthURL retain];
	[self handleAuthenticationURL:inAuthURL];
	return NO;	
}

- (void)authenticate
{
	[[NSWorkspace sharedWorkspace] openURL:authenticationURL];
}

- (void)authenticationDidSucceedWithToken:(NSString *)token
{
	NSLog(@"%s token: %@", __PRETTY_FUNCTION__, token);
	[connection setSessionId:token];
	[connection setNeedsAuthentication:NO];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationDidSucceed object:token];
	[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
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
