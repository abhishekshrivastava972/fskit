//
//  FamilySearchConnection.m
//  FSKit
//
//  Created by Logan Allred on 6/9/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKConnection.h"
#import "FSKIdentityService.h"
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
#import "FSKDefaultAuthenticationDelegate.h"
#endif

NSString *kFSAPIProductionBaseURLString = @"https://api.familysearch.org";  // Production
NSString *kFSAPIBetaBaseURLString = @"https://apibeta.familysearch.org";  // Beta
NSString *kFSAPIDevBaseURLString = @"http://www.dev.usys.org";  // Development

NSString *kFSK_ERROR_DOMAIN = @"com.googlecode.fskit.error.domain";

NSString * const FSKitNotificationAuthenticationRequired = @"FSKitNotificationAuthenticationRequired";
NSString * const FSKitNotificationAuthenticationURLWillOpen = @"FSKitNotificationAuthenticationURLWillOpen";
NSString * const FSKitNotificationAuthenticationDidSucceed = @"FSKitNotificationAuthenticationDidSucceed";
NSString * const FSKitNotificationAuthenticationDidFail = @"FSKitNotificationAuthenticationDidFail";

@implementation FSKConnection
NSString *userAgentString = @"test";

- (id)init {
	if ((self = [super init]))
	{ 
		baseURLString = kFSAPIProductionBaseURLString;
		[self setConnectionTimeoutInterval:5.0];
		userAgentString = [[NSString stringWithFormat:@"%@/%@", FSKitAgent, FSKitVersion] retain];
		responseDataCache = [[[NSMutableDictionary alloc] init] retain];
		requestQueue = [[[NSMutableArray alloc] init] retain];
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
		delegate = [[FSKDefaultAuthenticationDelegate alloc] init];
#endif
		isAuthenticating = NO;
	}
	return self;
}

- (void) dealloc
{
	[credential release];
	[userAgentString release];
	[responseDataCache release];
	[requestQueue release];
	[super dealloc];
}

+ (id)sharedConnection
{
	static id sharedInstance = nil;
	
	if (sharedInstance == nil)
	{
		sharedInstance = [[self alloc] init];
	}
	
	return sharedInstance;
}

- (NSString *)baseURLString {
	return [[baseURLString retain] autorelease];
}

- (void)setBaseURLString:(NSString *)value {
	if (baseURLString != value) {
		[baseURLString release];
		baseURLString = [value copy];
	}
}


- (NSURLCredential *)credential {
    return [[credential retain] autorelease];
}

- (void)setCredential:(NSURLCredential *)value {
    if (credential != value) {
        [credential release];
        credential = [value copy];
    }
}

- (NSString *)developerKey {
    return [[developerKey retain] autorelease];
}

- (void)setDeveloperKey:(NSString *)value {
    if (developerKey != value) {
        [developerKey release];
        developerKey = [value copy];
    }
}

- (NSString *)sessionId {
    return [[sessionId retain] autorelease];
}

- (void)setSessionId:(NSString *)value {
    if (sessionId != value) {
        [sessionId release];
        sessionId = [value copy];
		isAuthenticating = NO;
    }
}

- (BOOL)hasSessionId
{
	return (sessionId && [sessionId length] > 0);
}

- (BOOL)needsAuthentication
{
    return needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)value
{
    if (needsAuthentication != value)
	{
        needsAuthentication = value;
		if (!needsAuthentication)
		{
			NSLog(@" processing requestQueue");
			FSKRequest *request;
			while ([requestQueue count] > 0) {
				request = [requestQueue objectAtIndex:0];
				[requestQueue removeObjectAtIndex:0];
				[request reissueRequest];
			}
		}
    }
}

-(void)setConnectionTimeoutInterval:(double)aConnectionTimeoutInterval
{
	connectionTimeoutInterval = aConnectionTimeoutInterval;
}

-(NSTimeInterval)connectionTimeoutInterval
{
	return connectionTimeoutInterval;
}

- (void)setUserAgentString:(NSString *)newAgentString override:(BOOL)override {
	if (newAgentString == nil) {
		newAgentString = @"";
	}
	if (override) {
		userAgentString = [[@"" stringByAppendingString:newAgentString] retain];
	} else {
		userAgentString = [[[newAgentString stringByAppendingFormat:@" %@/%@", FSKitAgent, FSKitVersion] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
	}
}

- (NSString *)userAgentString {
	return userAgentString;
}

- (id)delegate {
    return [[delegate retain] autorelease];
}

- (void)setDelegate:(id)value {
	delegate = value;
}

- (void)handleAuthenticationForRequest:(FSKRequest *)request
{
	NSLog(@"%s request:%@", __PRETTY_FUNCTION__, request);
	if ([request isKindOfClass:[FSKIdentityRequest class]])
	{
		[request responseWithData:[request valueForKey:@"responseData"]];
	}
	else
	{
		if (request)
		{
			[requestQueue addObject:request];
			if (!isAuthenticating)
			{
				identityService = [[FSKIdentityService identityServiceWithConnection:self delegate:delegate] retain];
				// until we get the delegate call working, just login
				[identityService login];
			}
		}
	}
}

@end

@implementation FSKConnection(PrivateMethods)

//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, data);
//	[[responseDataCache objectForKey:[connection description]] appendData:data];
//}
//
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{	
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, connection);
//	id<EnunciateXML> returnXML = [[NSXMLDocument alloc] initWithData:[responseDataCache objectForKey:[connection description]]
//														   options:0
//															 error:nil];
//    SEL _selector = @selector(requestFinished:);																	
//	if([_delegate respondsToSelector:_selector])
//		[_delegate performSelector:_selector withObject:returnXML];
//
//   [self release];
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
//	if([_delegate respondsToSelector:@selector(asyncRequestFailed:)])
//		[_delegate performSelector:@selector(asyncRequestFailed:) withObject:error];
//}



@end

