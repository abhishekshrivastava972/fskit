//
//  FSKPersonReadRequest.m
//  FSKit
//
//  Created by Logan Allred on 3/12/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
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
	FSKPersonReadRequest *request = [[[self alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector] autorelease];
	[request sendPersonReadRequestWithIds:idList parameters:parameters];
}

- (void)sendPersonReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;
{
	[self fetchFamilySearchDataAtEndpoint:@"familytree/v1/person" WithIds:idList parameters:parameters];
}

- (FSKPersonResponse *)responseWithXML:(NSXMLDocument *)xmlDoc
{
	NSLog(@"%s", __PRETTY_FUNCTION__);	
	FSKPersonResponse *response = [[FSKPersonResponse alloc] initWithXML:xmlDoc];
	return [response autorelease];
}

@end
