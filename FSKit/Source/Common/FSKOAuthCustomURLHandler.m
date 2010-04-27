//
//  FSKOAuthCustomURLHandler.m
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKOAuthCustomURLHandler.h"
#import "NSString+URIQuery.h"
#if (TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#endif

@implementation FSKOAuthCustomURLHandler

- (id) initWithDelegate:(id)theDelegate
{
	self = [super init];
	if (self != nil) {
		delegate = theDelegate;
		oauthVerifier = @"";
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
		[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
#endif
	}
	return self;
}

- (void)handleURL:(NSURL *)url
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);	
	// Now you can parse the URL and perform whatever action is needed
	NSDictionary *params = [[url query] queryDictionaryUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"param dict: %@", params);
	NSString *oauthToken = [params valueForKey:@"oauth_token"];
	NSString *verifier = [params valueForKey:@"oauth_verifier"];
	NSLog(@"oauth_verifier: %@", verifier);
    if( oauthToken && verifier ) {
		oauthVerifier = [verifier retain];
		[delegate setVerifier:oauthVerifier];
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Error in URL: %@", params];
        NSLog(@"%@", errorMsg);
    }
}	

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
	NSString *url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
	[self handleURL:[NSURL URLWithString:url]];
}
#else
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);	
	// we're only setup to handle one URL so this pops the authentication webview
	NSLog(@"handleOpenURL:%@", url);
	
	if ([[url scheme] hasPrefix:@"x-com-fskit-oauth-verifier"]) {
		NSLog(@"handleOpenURL: query:%@", [url query]);
		[self handleURL:url];
		 return YES;
	}
	return NO;
}
#endif


- (NSString *) verifier
{
	return oauthVerifier;
}

- (NSURL *) callbackURL
{
	CFStringRef bundleID = CFBundleGetIdentifier(CFBundleGetMainBundle());
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"x-com-fskit-oauth-verifier-%@://result", bundleID]];
	NSLog(@"callbackURL: %@", url);
	return url;
}

@end
