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
	NSXMLElement *personElement = [searchElement firstElementWithName:@"person"];
	person = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstElementWithName:@"person"]] retain];
	father = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[@role='Father']" error:nil]] retain];
	mother = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[@role='Mother']" error:nil]] retain];
}

- (id)initWithXML:(NSXMLElement *)searchElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:searchElement];
		score2 = 10;
    }
    
    return self;
}
@end
