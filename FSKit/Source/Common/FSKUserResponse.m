//
//  FSKUserResponse.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKUserResponse.h"
#import "FSKUser.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKUserResponse

- (void)parseUserResponse:(NSXMLElement *)usersElement
{
	NSMutableArray *theResults = [NSMutableArray array];
	NSEnumerator *enumerator = [[usersElement elementsForName:@"user"] objectEnumerator];
	NSXMLElement *userElement;
	while (userElement = [enumerator nextObject]) {
		[theResults addObject:[FSKUser createFromXML:userElement]];
	}
	users = [theResults retain];
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		[self parseUserResponse:[[xmlDocument rootElement] firstElementWithName:@"users"]];
	}
	
	return self;	
}

- (void)dealloc
{
	[users release];
	[super dealloc];
}

- (NSArray *)userList
{
	return [[users retain] autorelease];
}

- (FSKUser *)user
{
	NSLog(@"fskusersresp user %d %@", [users count], [users lastObject]);
	return [users lastObject];
}

@end
