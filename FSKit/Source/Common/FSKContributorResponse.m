//
//  FSKContributorResponse.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKContributorResponse.h"
#import "FSKContributor.h"
#import "familytree.h"

@implementation FSKContributorResponse

- (id)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]) != nil) 
	{ 
		FSFAMILYTREEV2FamilyTree *familytree = [FSFAMILYTREEV2FamilyTree readFromXML:data];
		NSMutableArray *theResults = [NSMutableArray array];
		NSEnumerator *enumerator = [[familytree contributors] objectEnumerator];
		FSFAMILYTREEV2Person *contributor;
		while (contributor = [enumerator nextObject]) {
			[theResults addObject:[FSKContributor createFromXML:contributor]];
		}
		contributors = [theResults retain];		
	}
	
	return self;	
}

- (void)dealloc
{
	[contributors release];
	[super dealloc];
}

- (NSArray *)ContributorList
{
	return [[contributors retain] autorelease];
}

- (FSKContributor *)Contributor
{
	NSLog(@"fskcontributorsresp Contributor %d %@", [contributors count], [contributors lastObject]);
	return [contributors lastObject];
}

@end
