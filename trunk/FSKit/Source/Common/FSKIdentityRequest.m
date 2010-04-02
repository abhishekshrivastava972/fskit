//
//  FSKIdentityRequest.m
//  FSKit
//
//  Created by Logan Allred on 1/23/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityRequest.h"


@implementation FSKIdentityRequest
-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
						   delegate:(id)aDelegate 
						   selector:(SEL)aSelector
{
	if (self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector]) {
        // your initialization code goes here
    }
	return self;
}											 

+ (void)fetchIdentityData:(NSString *)endpoint 
				  WithIds:(NSSet *)idList 
			   parameters:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector
{
	FSKIdentityRequest *request = [[[FSKIdentityRequest alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request fetchFamilySearchDataAtEndpoint:[NSString stringWithFormat:@"identity/v2/%@", endpoint] 
							WithIds:idList 
							parameters:parameters];
}

- (FSKIdentityResponse *)responseWithData:(NSData *)data
{
	NSLog(@"%s data: %@", __PRETTY_FUNCTION__, data);
	FSKIdentityResponse *response = [[FSKIdentityResponse alloc] initWithData:data];
	return [response autorelease];
}


- (void)sendPropertiesRequest;
{
	[FSKIdentityRequest fetchIdentityData:@"properties" WithIds:nil parameters:nil connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendUserProfileRequest;
{
	[FSKIdentityRequest fetchIdentityData:@"user" WithIds:nil parameters:[NSDictionary dictionaryWithObjectsAndKeys:[familySearchConnection developerKey], @"key", nil] connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendUserPermissionRequest
{
	[FSKIdentityRequest fetchIdentityData:@"permission" WithIds:nil parameters:[NSDictionary dictionaryWithObjectsAndKeys:[familySearchConnection developerKey], @"key", nil] connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendSessionPingRequest
{
	[FSKIdentityRequest fetchIdentityData:@"session" WithIds:nil parameters:[NSDictionary dictionaryWithObjectsAndKeys:[familySearchConnection sessionId], @"sessionId", nil] connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendLogoutRequest
{
	[FSKIdentityRequest fetchIdentityData:@"logout" WithIds:nil parameters:[NSDictionary dictionaryWithObjectsAndKeys:[familySearchConnection developerKey], @"key", nil] connection:familySearchConnection delegate:_delegate selector:_selector];
}
@end
