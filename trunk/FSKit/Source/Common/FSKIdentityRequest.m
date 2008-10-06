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
	FSKIdentityRequest *request = [[[self alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request fetchFamilySearchDataAtEndpoint:[NSString stringWithFormat:@"identity/v1/%@", endpoint] 
							WithIds:idList 
							parameters:parameters];
}

- (FSKIdentityResponse *)responseWithXML:(NSXMLDocument *)xmlDoc
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKIdentityResponse *response = [[FSKIdentityResponse alloc] initWithXML:xmlDoc];
	return [response autorelease];
}


- (void)sendLoginRequest
{
	[FSKIdentityRequest fetchIdentityData:@"login" WithIds:nil parameters:[NSDictionary dictionaryWithObjectsAndKeys:[familySearchConnection developerKey], @"key", nil] connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendLogoutRequest
{
	[FSKIdentityRequest fetchIdentityData:@"logout" WithIds:nil parameters:nil connection:familySearchConnection delegate:_delegate selector:_selector];
}
@end
