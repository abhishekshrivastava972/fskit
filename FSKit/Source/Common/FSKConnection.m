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
NSString *FSAPIVersion = @"v1";


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
		_delegate = [[FSKDefaultAuthenticationDelegate alloc] init];
#endif
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

+ (id)sharedInstance
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
    return [[_sessionId retain] autorelease];
}

- (void)setSessionId:(NSString *)value {
    if (_sessionId != value) {
        [_sessionId release];
        _sessionId = [value copy];
    }
}

- (BOOL)hasSessionId
{
	return (_sessionId && [_sessionId length] > 0);
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
			NSEnumerator *enumerator = [requestQueue objectEnumerator];
			while (request = [enumerator nextObject]) {
				[request reissueRequest];
			}
		}
		[requestQueue removeAllObjects];
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
    return [[_delegate retain] autorelease];
}

- (void)setDelegate:(id)value {
	_delegate = value;
}

- (void)handleAuthenticationForRequest:(FSKRequest *)request
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if ([request isKindOfClass:[FSKIdentityRequest class]])
	{
		[request responseWithXML:[request valueForKey:@"responseData"]];
	}
	else
	{
		[requestQueue addObject:request];
		if (!_isAuthenticating)
		{
			[[[FSKIdentityService identityServiceWithConnection:self delegate:_delegate] retain] login];
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
//	NSXMLDocument *returnXML = [[NSXMLDocument alloc] initWithData:[responseDataCache objectForKey:[connection description]]
//														   options:nil
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

