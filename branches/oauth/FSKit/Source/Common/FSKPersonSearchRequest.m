//
//  FSKPersonSearchRequest
//  FSKit
//
//  Created by Logan Allred on 3/12/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
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
	FSKPersonSearchRequest *request = [[[self alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request sendSearchRequestWithCriteria:parameters];
}				 

- (void)sendSearchRequestWithCriteria:(NSDictionary *)parameters
{
	[self fetchFamilySearchDataAtEndpoint:@"familytree/v2/search" WithIds:nil parameters:parameters];
}

- (FSKSearchResponse *)responseWithData:(NSData *)data
{
	NSLog(@"%s", __PRETTY_FUNCTION__);	
	FSKSearchResponse *response = [[FSKSearchResponse alloc] initWithData:data];
	NSLog(@"response code: %d message: %@", [response statusCode], [response statusMessage]);	
	return [response autorelease];
}


@end
