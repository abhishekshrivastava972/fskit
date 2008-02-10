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
	self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	return self;
}											 

+ (void)fetchIdentityData:(NSString *)endpoint 
				  WithIds:(NSSet *)idList 
			   parameters:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector
{
	[FSKRequest fetchFamilySearchData:[NSString stringWithFormat:@"identity/v1/%@", endpoint] 
							WithIds:idList 
							parameters:parameters 
							connection:aFamilySearchConnection 
							delegate:aDelegate 
							selector:aSelector];
}

- (void)sendLoginRequest
{
	[FSKIdentityRequest fetchIdentityData:@"login" WithIds:nil parameters:nil connection:familySearchConnection delegate:_delegate selector:_selector];
}

- (void)sendLogoutRequest
{
	[FSKIdentityRequest fetchIdentityData:@"logout" WithIds:nil parameters:nil connection:familySearchConnection delegate:_delegate selector:_selector];
}
@end
