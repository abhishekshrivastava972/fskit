//
//  FSKSearchResponse.m
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKSearchResponse.h"
#import "FSKSearchResult.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKSearchResponse

- (void)parseSearchResponse:(NSXMLElement *)searchesElement
{
	interestingResultsCount = [[[searchesElement attributeForName:@"count"] stringValue] intValue];
	NSMutableArray *theResults = [[NSMutableArray array] retain];
	NSEnumerator *enumerator = [[searchesElement elementsForName:@"search"] objectEnumerator];
	NSXMLElement *searchElement;
	while (searchElement = [enumerator nextObject]) {
		[theResults addObject:[FSKSearchResult searchResultFromXML:searchElement]];
	}
	searchResults = [NSArray arrayWithArray:theResults];
}
	
- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		[self parseSearchResponse:[[xmlDocument rootElement] firstElementWithName:@"searches"]];
	}
	
	return self;	
}

- (void)dealloc
{
	[searchResults release];
	[super dealloc];
}

- (NSArray *)searchResults
{
	return [[searchResults retain] autorelease];
}
@end
