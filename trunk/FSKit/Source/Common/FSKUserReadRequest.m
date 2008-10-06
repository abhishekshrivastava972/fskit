//
//  FSKUserReadRequest.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKUserReadRequest.h"


@implementation FSKUserReadRequest

NSString *kUserEndpoint = @"user";

-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
						   delegate:(id)aDelegate 
						   selector:(SEL)aSelector
{
	self = [super initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	return self;
}											 

+ (void)fetchUserDataWithIds:(NSSet *)idList 
					parameters:(NSDictionary *)parameters 
					connection:aFamilySearchConnection 
					  delegate:(id)aDelegate 
					  selector:(SEL)aSelector
{
	FSKUserReadRequest *request = [[[self alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request sendUserReadRequestWithIds:idList parameters:parameters];
}

- (void)sendUserReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;
{
	[self fetchFamilySearchDataAtEndpoint:@"familytree/v1/user" WithIds:idList parameters:parameters];
}

- (FSKUserResponse *)responseWithXML:(NSXMLDocument *)xmlDoc
{
	NSLog(@"%s", __PRETTY_FUNCTION__);	
	FSKUserResponse *response = [[FSKUserResponse alloc] initWithXML:xmlDoc];
	NSLog(@"response code: %d message: %@", [response statusCode], [response statusMessage]);	
	return [response autorelease];
}

@end
