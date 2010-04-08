//
//  FSKUserResponse.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKUserResponse.h"
#import "FSKUser.h"
#import "familytree.h"

@implementation FSKUserResponse

- (id)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]) != nil) 
	{ 
		FSFAMILYTREEV2FamilyTree *familytree = [FSFAMILYTREEV2FamilyTree readFromXML:data];
		NSMutableArray *theResults = [NSMutableArray array];
		NSEnumerator *enumerator = [[familytree users] objectEnumerator];
		FSFAMILYTREEV2User *userElement;
		while (userElement = [enumerator nextObject]) {
			[theResults addObject:[FSKUser createFromXML:userElement]];
		}
		users = [theResults retain];
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
