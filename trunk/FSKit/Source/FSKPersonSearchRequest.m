//
//  FSKPersonSearchRequest
//  FSKit
//
//  Created by Demo Account on 3/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonSearchRequest.h"


@implementation FSKPersonSearchRequest

NSString *kSearchEndpoint = @"search";


- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector
{
	self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	return self;
}							

+ (void)fetchSearchResultsWithCriteria:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector
{
	[FSKRequest fetchFamilySearchData:[NSString stringWithFormat:@"familytree/v1/%@", kSearchEndpoint] 
							WithIds:nil 
							parameters:parameters 
							connection:aFamilySearchConnection 
							delegate:aDelegate 
							selector:aSelector];
}				 

- (void)sendSearchRequestWithCriteria:(NSDictionary *)parameters
{
	[FSKPersonSearchRequest fetchSearchResultsWithCriteria:parameters connection:familySearchConnection delegate:_delegate selector:_selector];
}

@end
