//
//  FSKOAuthHandlerAppDelegate.m
//  FSKOAuthHandler
//
//  Created by Logan Allred on 12/13/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKOAuthHandler.h"
#import "SimpleHTTPConnection.h"
#import "SimpleHTTPServer.h"
#import "NSString+URIQuery.h"
#import "Foundation/NSPathUtilities.h"
#import "FSKSharedDefines.h"

NSString*   FSKOAuthRequestTokenKey = @"request.token.url";
NSString*   FSKOAuthAuthorizeURLKey = @"authorize.url";
NSString*   FSKOAuthAccessTokenKey = @"access.token.url";

@implementation FSKOAuthHandler

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate
{
    if ((self = [super init]) != nil) 
	{ 
		_delegate = theDelegate;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestTokenReceived:) name:MPOAuthNotificationRequestTokenReceived object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessTokenReceived:) name:MPOAuthNotificationAccessTokenReceived object:nil];		
	}
	return self;
}

- (void)dealloc
{
	[identityProperties release];
//	[consumer release];
//	[requestToken release];
	[customURL release];
	[server release];
	[super dealloc];
}

//- (void)getAccessToken
//{
//    NSURL *url = [NSURL URLWithString:[identityProperties valueForKey:FSKOAuthAccessTokenKey]];
//	
//    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
//                                                                   consumer:consumer
//                                                                      token:requestToken
//                                                                      realm:nil   // our service provider doesn't specify a realm
//                                                          signatureProvider:[[OAPlaintextSignatureProvider alloc] init]];
//	
//    [request setHTTPMethod:@"POST"];
//	
//    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
//	
//    [fetcher fetchDataWithRequest:request
//                         delegate:self
//                didFinishSelector:@selector(accessTokenTicket:didFinishWithData:)
//                  didFailSelector:@selector(accessTokenTicket:didFailWithError:)];
//}

- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
	NSString *url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
	// Now you can parse the URL and perform whatever action is needed
	NSURL *path = [NSURL URLWithString:url];
	NSLog(@"url: %@", url);
	NSDictionary *params = [[path query] queryDictionaryUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"param dict: %@", params);
	NSString *oauthToken = [params valueForKey:@"oauth_token"];
	NSString *oauthVerifier = [params valueForKey:@"oauth_verifier"];
	NSLog(@"oauth_verifier: %@", oauthVerifier);
    if( oauthToken && oauthVerifier ) {
		//        [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
		[server replyWithData:[[params description] dataUsingEncoding:NSUTF8StringEncoding] MIMEType:@"text/plain"];
//		[verifierText setStringValue:oauthVerifier];
		oauthVerifier_ = [oauthVerifier retain];
//		[requestToken setVerifier:oauthVerifier];
//		[self getAccessToken];
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Error in URL: %@", params];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application

	//	Retrieving that same token from the Keychain on a different run of your app looks like this:	
//	OAToken *accessToken = [[OAToken alloc] initWithKeychainUsingAppName:@"FSKOAuthHandler"
//													 serviceProviderName:@"www.dev.usys.org"];
//	if (accessToken)
//	{
////		[sessionIdText setStringValue:accessToken.key];
//	}
	
	[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
	
}

- (void)processURL:(NSURL *)url connection:(SimpleHTTPConnection *)connection
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);
	if ([[[url path] pathExtension] length] > 0)
	{
		[server replyWithStatusCode:404 message:@"<html><body><p>404 NOT FOUND</p></body></html>"];
		return;
	}
	NSDictionary *params = [[url query] queryDictionaryUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"param dict: %@", params);
	NSString *oauthToken = [params valueForKey:@"oauth_token"];
	NSString *oauthVerifier = [params valueForKey:@"oauth_verifier"];
	NSLog(@"oauth_verifier: %@", oauthVerifier);
    if( oauthToken && oauthVerifier ) {
//        [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
		[server replyWithData:[[params description] dataUsingEncoding:NSUTF8StringEncoding] MIMEType:@"text/plain"];
		[server closeConnection:connection];
//		[verifierText setStringValue:oauthVerifier];
		oauthVerifier_ = oauthVerifier;
		[server release];
		server = nil;
//		[requestToken setVerifier:oauthVerifier];
//		[self getAccessToken];
		// get accesstoken
		[self authenticate];
//#if TARGET_OS_IPHONE
//		[[UIApplication sharedApplication] openURL:userAuthURL];
//#else
//		[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
//#endif
		
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Error in URL: %@", params];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
    }
}

- (void)stopProcessing
{
	NSLog(@"stop processing");
}

- (void)requestTokenReceived:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
}

- (void)accessTokenReceived:(NSNotification *)inNotification {
	NSLog(@"%s notification: %@", __PRETTY_FUNCTION__, inNotification);
	[_delegate authenticationDidSuceedWithToken:[[inNotification userInfo] objectForKey:@"oauth_token"]];
}

//- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
//	NSLog(@"%s data:%@", __PRETTY_FUNCTION__, data);
//	if (ticket.didSucceed) {
//		NSString *responseBody = [[NSString alloc] initWithData:data
//													   encoding:NSUTF8StringEncoding];
//		requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
////		[requestTokenText setStringValue:requestToken.key];
//		
//		NSString *urlString = [NSString stringWithFormat:@"%@?oauth_token=%@", [identityProperties valueForKey:FSKOAuthAuthorizeURLKey], requestToken.key];
//		NSURL *url = [NSURL URLWithString:urlString];
//		if ([_delegate respondsToSelector:@selector(request:didReceiveAuthenticationURL:)])
//		{
//			[_delegate request:self didReceiveAuthenticationURL:url];
//			return;
//		}		
//	}
//}
//
//- (void)requestTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSData *)data {
//	NSLog(@"%s data:%@", __PRETTY_FUNCTION__, data);
//	if (!ticket.didSucceed) {
////		[requestTokenText setStringValue:@"request_token failed"];
//	}
//}
//
//- (void)accessTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
//	NSLog(@"%s data: %@", __PRETTY_FUNCTION__, data);
//	if (ticket.didSucceed) {
//		NSString *responseBody = [[NSString alloc] initWithData:data
//													   encoding:NSUTF8StringEncoding];
//		requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
////		[sessionIdText setStringValue:requestToken.key];
//		[requestToken storeInDefaultKeychainWithAppName:@"FSKOAuthHandler"
//								   serviceProviderName:@"www.dev.usys.org"];
//		
//		if ([_delegate respondsToSelector:@selector(request:didReceiveAuthenticationToken:)])
//		{
//			[_delegate request:self didReceiveAuthenticationToken:requestToken];
//		}
//	}
//}
//
//- (void)accessTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSData *)data {
//	NSLog(@"%s data: %@", __PRETTY_FUNCTION__, data);
//	if (!ticket.didSucceed) {
////		[sessionIdText setStringValue:@"access_token request failed"];
//	}
//}

- (void)setIdentityProperties:(NSDictionary *)properties
{
	identityProperties = [properties retain];
}

- (void)setCustomURL:(NSURL *)url
{
	customURL = url;
}

- (void)authenticate
{
	NSLog(@"%s", __PRETTY_FUNCTION__);

	if (!_oauthAPI) {
		NSURL *callbackURL = customURL;
		if (!callbackURL)
		{
			server = [[[SimpleHTTPServer alloc] initWithTCPPort:50000
													   delegate:self] retain];
			callbackURL = [NSURL URLWithString:@"http://localhost:50000"];
		}

		NSDictionary *credentials = [NSDictionary dictionaryWithObjectsAndKeys:	kFSK_DEVELOPER_KEY, kMPOAuthCredentialConsumerKey,
									 @"", kMPOAuthCredentialConsumerSecret,
									 nil];
		NSDictionary *configuration = [NSDictionary dictionaryWithObjectsAndKeys:	
									   [NSURL URLWithString:@"http://sisu1a.ldsonly.net/identity/v2/"], MPOAuthAuthenticationURLKey,
									   [NSURL URLWithString:@"http://sisu1a.ldsonly.net/identity/v2/"], MPOAuthBaseURLKey,
									   [identityProperties valueForKey:FSKOAuthRequestTokenKey], MPOAuthRequestTokenURLKey,
									   [identityProperties valueForKey:FSKOAuthAuthorizeURLKey], MPOAuthUserAuthorizationURLKey,
									   [identityProperties valueForKey:FSKOAuthAccessTokenKey], MPOAuthAccessTokenURLKey,
									 nil];
		_oauthAPI = [[MPOAuthAPI alloc] initWithCredentials:credentials
										  withConfiguration:configuration
												  autoStart:NO];
		[_oauthAPI setSignatureScheme:MPOAuthSignatureSchemePlainText];
		[(MPOAuthAuthenticationMethodOAuth *)[_oauthAPI authenticationMethod] setDelegate:self];
		[[_oauthAPI credentials] discardOAuthCredentials];
		[_oauthAPI authenticate];
	} else {
		[_oauthAPI authenticate];
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
	[_oauthAPI discardCredentials];
}

#pragma mark - MPOAuthAuthenticationMethodOAuthDelegate Methods -

- (NSURL *)callbackURLForCompletedUserAuthorization {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSURL *callbackURL = customURL;
	if (!callbackURL)
	{
		callbackURL = [NSURL URLWithString:@"http://localhost:50000"];
	}
	return callbackURL;
}

- (NSString *)oauthVerifierForCompletedUserAuthorization {
	return oauthVerifier_;
}

- (BOOL)automaticallyRequestAuthenticationFromURL:(NSURL *)inAuthURL withCallbackURL:(NSURL *)inCallbackURL {
	return YES;
	
	//	UserAuthViewController *userAuthViewController = [[UserAuthViewController alloc] initWithURL:inAuthURL];
	//	[navigationController pushViewController:userAuthViewController animated:YES];
	//	[userAuthViewController release];
	//	
	//	return NO;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
//	// we're only setup to handle one URL so this pops the authentication webview
//	NSLog(@"handleOpenURL: %@\nitem: %@\ntop: %@\nvisible: %@", url, [navigationController navigationItem], [navigationController topViewController], [navigationController visibleViewController]);
//	
//	if ([[url scheme] isEqualToString:@"x-com-mpoauth-mobile"]) {
//		NSDictionary parameterDict = [MPURLRequestParameter parameterDictionaryFromString:[url query]];
//		NSLog(@"handleOpenURL:\nquery: %@\nparamDict: \n%@", [url query], parameterDict);
//		RootViewController *rootController = [navigationController topViewController];
//		[rootController 
//		 return YES;
//		 }
//		 return NO;
//		 }
		 
@end
