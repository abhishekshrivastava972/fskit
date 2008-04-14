//
//  FSKSearchResult.m
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKSearchResult.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKSearchResult


+ (id)searchResultFromXML:(NSXMLElement *)searchElement
{
    id result = [[self alloc] initWithXML:searchElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)searchElement
{
	refId = [[[searchElement attributeForName:@"ref"] stringValue] retain];
	score = [[searchElement firstValueForName:@"score"] retain];
	person = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstElementWithName:@"person"]] retain];
	father = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[@role='Father']" error:nil]] retain];
	mother = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[@role='Mother']" error:nil]] retain];

	NSMutableArray *spouseArray = [NSMutableArray array];
	NSEnumerator *spouseList = [[[searchElement firstElementWithName:@"spouse"] elementsForName:@"child"] objectEnumerator];
	NSXMLElement *spouseElement;
	while (spouseElement = [spouseList nextObject]) {
		[spouseArray addObject:[FSKPersonSummary createFromXML:spouseElement]];
	}
	spouses = [spouseArray retain];

	NSMutableArray *childrenArray = [NSMutableArray array];
	NSEnumerator *childrenList = [[[searchElement firstElementWithName:@"children"] elementsForName:@"child"] objectEnumerator];
	NSXMLElement *childElement;
	while (childElement = [childrenList nextObject]) {
		[childrenArray addObject:[FSKPersonSummary createFromXML:childElement]];
	}
	children = [childrenArray retain];
	
}

- (id)initWithXML:(NSXMLElement *)searchElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:searchElement];
    }
    
    return self;
}
@end
