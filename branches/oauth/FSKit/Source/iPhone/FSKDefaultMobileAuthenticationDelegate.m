//
//  FSKDefaultMobileAuthenticationDelegate.m
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKDefaultMobileAuthenticationDelegate.h"
#import "FSKOAuthCustomURLHandler.h"

@implementation FSKDefaultMobileAuthenticationDelegate

- (id)initWithConnection:(FSKConnection *)aConnection;
{
	self = [super initWithConnection:aConnection];
	if (self != nil) {
		verifierHandler = [[[FSKOAuthCustomURLHandler alloc] initWithDelegate:self] retain];
	}
	return self;
}

- (void)dealloc
{
	[verifierHandler release];
	[super dealloc];
}

- (void)handleAuthenticationURL:(NSURL *)url
{
	NSLog(@"%s url:%@", __PRETTY_FUNCTION__, url);
	NSLog(@"controller: %@", [self controllerForAuthenticationView:nil]);
	[[UIApplication sharedApplication] openURL:url];
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url;
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);
	[self handleAuthenticationURL:url];
}

- (UIViewController *)controllerForAuthenticationView:(FSKRequest *)request
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	id nextResponder = [[[UIApplication sharedApplication] keyWindow] nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    }
	return nil;
}

- (NSURL *)callbackURL
{
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

- (void)authenticate
{
	[[UIApplication sharedApplication] openURL:authenticationURL];
}

- (void)authenticationDidSucceedWithToken:(NSString *)token
{
	[connection setSessionId:token];
	[connection setNeedsAuthentication:NO];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationDidSucceed object:token];
}

- (void)authenticationDidFailWithError:(NSError *)error
{
	NSLog(@"%s error: %@", __PRETTY_FUNCTION__, error);
	[connection setSessionId:nil];
	[connection setNeedsAuthentication:YES];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:FSKitNotificationAuthenticationDidFail object:error];
}

- (void)handleOpenURL:(NSURL *)url;
{
	[verifierHandler handleURL:url];
}

- (void)performAuthentication;
{
	[self handleAuthenticationURL:authenticationURL];
}
@end
