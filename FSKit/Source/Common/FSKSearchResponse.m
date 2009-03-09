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
	totalCount = [[[searchesElement attributeForName:@"count"] stringValue] intValue];
	closeMatchesCount = [[[searchesElement attributeForName:@"close"] stringValue] intValue];
	partialMatchesCount = [[[searchesElement attributeForName:@"partial"] stringValue] intValue];
	NSMutableArray *theResults = [[NSMutableArray array] retain];
	NSEnumerator *enumerator = [[searchesElement elementsForName:@"search"] objectEnumerator];
	NSXMLElement *searchElement;
	while (searchElement = [enumerator nextObject]) {
		[theResults addObject:[FSKSearchResult searchResultFromXML:searchElement]];
	}
	searchResults = [[NSArray arrayWithArray:theResults] retain];
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

- (NSArray *)closeMatches
{
	return [searchResults subarrayWithRange:NSMakeRange(0, MIN(closeMatchesCount, totalCount))];
}

- (NSArray *)partialMatches
{
	return [searchResults subarrayWithRange:NSMakeRange(closeMatchesCount, MIN(partialMatchesCount, totalCount)-closeMatchesCount)];;
}

- (int)totalCount {
    return totalCount;
}

- (int)partialMatchesCount {
    return partialMatchesCount;
}

- (int)closeMatchesCount {
    return closeMatchesCount;
}

- (NSString *)contextId {
    return [[contextId retain] autorelease];
}

- (void)setContextId:(NSString *)value {
    if (contextId != value) {
        [contextId release];
        contextId = [value copy];
    }
}


@end
