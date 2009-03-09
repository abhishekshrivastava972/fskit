//
//  FSKContributorReadRequest.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKContributorReadRequest.h"


@implementation FSKContributorReadRequest

NSString *kContributorEndpoint = @"Contributor";

-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
						   delegate:(id)aDelegate 
						   selector:(SEL)aSelector
{
	self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	return self;
}											 

+ (void)fetchContributorDataWithIds:(NSSet *)idList 
					parameters:(NSDictionary *)parameters 
					connection:aFamilySearchConnection 
					  delegate:(id)aDelegate 
					  selector:(SEL)aSelector
{
	FSKContributorReadRequest *request = [[[self alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request sendContributorReadRequestWithIds:idList parameters:parameters];
}

- (void)sendContributorReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;
{
	[self fetchFamilySearchDataAtEndpoint:@"familytree/v2/Contributor" WithIds:idList parameters:parameters];
}

- (FSKContributorResponse *)responseWithXML:(NSXMLDocument *)xmlDoc
{
	NSLog(@"%s", __PRETTY_FUNCTION__);	
	FSKContributorResponse *response = [[FSKContributorResponse alloc] initWithXML:xmlDoc];
	NSLog(@"response code: %d message: %@", [response statusCode], [response statusMessage]);	
	return [response autorelease];
}

@end
