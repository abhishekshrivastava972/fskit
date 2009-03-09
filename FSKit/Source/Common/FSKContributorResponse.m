//
//  FSKContributorResponse.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKContributorResponse.h"
#import "FSKContributor.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKContributorResponse

- (void)parseContributorResponse:(NSXMLElement *)ContributorsElement
{
	NSMutableArray *theResults = [NSMutableArray array];
	NSEnumerator *enumerator = [[ContributorsElement elementsForName:@"Contributor"] objectEnumerator];
	NSXMLElement *ContributorElement;
	while (ContributorElement = [enumerator nextObject]) {
		[theResults addObject:[FSKContributor createFromXML:ContributorElement]];
	}
	Contributors = [theResults retain];
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		[self parseContributorResponse:[[xmlDocument rootElement] firstElementWithName:@"Contributors"]];
	}
	
	return self;	
}

- (void)dealloc
{
	[Contributors release];
	[super dealloc];
}

- (NSArray *)ContributorList
{
	return [[Contributors retain] autorelease];
}

- (FSKContributor *)Contributor
{
	NSLog(@"fskContributorsresp Contributor %d %@", [Contributors count], [Contributors lastObject]);
	return [Contributors lastObject];
}

@end
