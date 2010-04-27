//
//  FSKOAuthHandlerAppDelegate.m
//  FSKOAuthHandler
//
//  Created by Logan Allred on 12/13/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKOAuthHandler.h"
#import "FSKSharedDefines.h"
#import "FSKConnection.h"

NSString*   FSKOAuthRequestTokenKey = @"request.token.url";
NSString*   FSKOAuthAuthorizeURLKey = @"authorize.url";
NSString*   FSKOAuthAccessTokenKey = @"access.token.url";

@implementation FSKOAuthHandler

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate
{
    if ((self = [super init]) != nil) 
	{ 
		delegate = theDelegate;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestTokenReceived:) name:MPOAuthNotificationRequestTokenReceived object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessTokenReceived:) name:MPOAuthNotificationAccessTokenReceived object:nil];		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessTokenReceived:) name:MPOAuthNotificationAccessTokenRefreshed object:nil];		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestTokenRejected:) name:MPOAuthNotificationRequestTokenRejected object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessTokenRejected:) name:MPOAuthNotificationAccessTokenRejected object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessTokenRejected:) name:MPOAuthNotificationErrorHasOccurred object:nil];		
	}
	return self;
}

- (void)dealloc
{
	[oauthVerifier release];
	[identityProperties release];
	[oauthAPI release];
	[super dealloc];
}

#pragma mark MPOAuthAPI Notifications

- (void)requestTokenReceived:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
}

- (void)requestTokenRejected:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
}

- (void)accessTokenReceived:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
	[delegate authenticationDidSucceedWithToken:[[inNotification userInfo] objectForKey:@"oauth_token"]];
}

- (void)accessTokenRejected:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
	[[oauthAPI credentials] discardOAuthCredentials];
	// TODO figure out error codes
	[delegate authenticationDidFailWithError:[NSError errorWithDomain:kFSK_ERROR_DOMAIN code:401 userInfo:[inNotification userInfo]]];
}

- (NSString *)accessToken;
{
	NSLog(@"%s returning: %@", __PRETTY_FUNCTION__, oauthAPI.credentials.accessToken);
	return oauthAPI.credentials.accessToken;
}

- (void)setIdentityProperties:(NSDictionary *)properties
{
	identityProperties = [properties retain];
}

- (void)authenticate
{
	NSLog(@"%s", __PRETTY_FUNCTION__);

	if (!oauthAPI) {
		NSDictionary *credentials = [NSDictionary dictionaryWithObjectsAndKeys:	kFSK_DEVELOPER_KEY, kMPOAuthCredentialConsumerKey,
									 @"", kMPOAuthCredentialConsumerSecret,
									 nil];
		NSDictionary *configuration = [NSDictionary dictionaryWithObjectsAndKeys:	
									   [NSURL URLWithString:[identityProperties valueForKey:FSKOAuthAuthorizeURLKey]], MPOAuthAuthenticationURLKey,
									   [NSURL URLWithString:[identityProperties valueForKey:FSKOAuthAuthorizeURLKey]], MPOAuthBaseURLKey,
									   [identityProperties valueForKey:FSKOAuthRequestTokenKey], MPOAuthRequestTokenURLKey,
									   [identityProperties valueForKey:FSKOAuthAuthorizeURLKey], MPOAuthUserAuthorizationURLKey,
									   [identityProperties valueForKey:FSKOAuthAccessTokenKey], MPOAuthAccessTokenURLKey,
									 nil];
		oauthAPI = [[MPOAuthAPI alloc] initWithCredentials:credentials
										  withConfiguration:configuration
												  autoStart:NO];
		[oauthAPI setSignatureScheme:MPOAuthSignatureSchemePlainText];
		[(MPOAuthAuthenticationMethodOAuth *)[oauthAPI authenticationMethod] setDelegate:self];
		NSLog(@"isAuthenticated?%d", [oauthAPI isAuthenticated]);
		if (oauthAPI.credentials.accessToken)
		{
			[delegate authenticationDidSucceedWithToken:oauthAPI.credentials.accessToken];
		} else {
			//		[[oauthAPI credentials] discardOAuthCredentials];
			[oauthAPI authenticate];
		}
	} else {
		id<MPOAuthCredentialStore> credentials = [oauthAPI credentials];
//		if (credentials.accessToken && !credentials.requestToken) {
//			[delegate authenticationDidSucceedWithToken:credentials.accessToken];
//		} else {
			[oauthAPI authenticate];
//		}
	}

	NSURL *userAuthURL = [self callbackURLForCompletedUserAuthorization];

	if (identityProperties)
	{
		
    NSURL *url = [NSURL URLWithString:[identityProperties valueForKey:FSKOAuthRequestTokenKey]];
	
//    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
//                                                                   consumer:consumer
//                                                                      token:nil   // we don't have a Token yet
//                                                                      realm:nil   // our service provider doesn't specify a realm
//                                                          signatureProvider:[[OAPlaintextSignatureProvider alloc] init]]; 
//	
//    [request setHTTPMethod:@"POST"];
//	
//    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
//	
//    [fetcher fetchDataWithRequest:request
//                         delegate:self
//                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
//                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];	
	}
}

- (void)signOut
{
	[oauthAPI discardCredentials];
}

- (void)setVerifier:(NSString *)verifier;
{
	oauthVerifier = [verifier retain];
	[oauthAPI authenticate];
}

#pragma mark - MPOAuthAuthenticationMethodOAuthDelegate Methods -

- (NSURL *)callbackURLForCompletedUserAuthorization {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return [delegate callbackURL];
}

- (NSString *)oauthVerifierForCompletedUserAuthorization {
	return oauthVerifier;
}

- (BOOL)automaticallyRequestAuthenticationFromURL:(NSURL *)inAuthURL withCallbackURL:(NSURL *)inCallbackURL {
	NSLog(@"%s url: %@ callback: %@", __PRETTY_FUNCTION__, inAuthURL, inCallbackURL);
	return [delegate automaticallyRequestAuthenticationFromURL:inAuthURL withCallbackURL:inCallbackURL];	
}
		 
@end
