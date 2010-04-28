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


@implementation FSKDefaultAuthenticationDelegate

- (void)initWithConnection:(FSKConnection *)aConnection;
{
	connection = aConnection;
}

- (void)handleAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if ([challenge previousFailureCount] < 3)
	{
		// set default value, allow request delegate to override?
		NSWindow *window = [NSApp mainWindow];
//		if ([[connection _delegate] respondsToSelector:@selector(windowForAuthenticationSheet:)])
//		{
//			window = [_delegate windowForAuthenticationSheet:(FSKRequest *)self];
//		}
		
		FSKLoginController *loginController = [[FSKLoginController alloc] init];
		[loginController startAuthentication:challenge window:window];
	} else
	{
		// If we don't have a valid credential, or have already failed auth 3x...
		[[challenge sender] cancelAuthenticationChallenge:challenge];
}
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	NSLog(@"%s challenge: %@", __PRETTY_FUNCTION__, challenge);
	[self handleAuthenticationChallenge:challenge];
}

- (void)request:(FSKRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
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

@end
