//
//  FSKPersonReadRequest.m
//  FSKit
//
//  Created by Demo Account on 3/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonReadRequest.h"
#import "FSKRequest.h"

@implementation FSKPersonReadRequest
NSString *kPersonEndpoint = @"person";

-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
						   delegate:(id)aDelegate 
						   selector:(SEL)aSelector
{
	self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	return self;
}											 

+ (void)fetchPersonDataWithIds:(NSSet *)idList 
			   parameters:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector
{
	[FSKRequest fetchFamilySearchData:[NSString stringWithFormat:@"familytree/v1/%@", kPersonEndpoint] 
							WithIds:idList 
							parameters:parameters 
							connection:aFamilySearchConnection 
							delegate:aDelegate 
							selector:aSelector];
}

- (void)sendPersonReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;
{
	[FSKPersonReadRequest fetchPersonDataWithIds:idList parameters:parameters connection:familySearchConnection delegate:_delegate selector:_selector];
}


@end
