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
	refId = [[[searchElement attributeForName:@"id"] stringValue] retain];
	score = [[searchElement firstValueForName:@"score"] retain];
	person = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"person/assertions" error:nil]] retain];
	father = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[1]/assertions" error:nil]] retain];
	mother = [[FSKPersonSummary createFromXML:(NSXMLElement *)[searchElement firstNodeForXPath:@"./*:parents/*:parent[2]/assertions" error:nil]] retain];

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
		[childrenArray addObject:[FSKPersonSummary createFromXML:[childElement firstElementWithName:@"assertions"]]];
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


- (NSNumber *)score {
    return [[score retain] autorelease];
}

- (void)setScore:(NSNumber *)value {
    if (score != value) {
        [score release];
        score = [value copy];
    }
}

- (NSString *)refId {
    return [[refId retain] autorelease];
}

- (void)setRefId:(NSString *)value {
    if (refId != value) {
        [refId release];
        refId = [value copy];
    }
}

- (FSKPersonSummary *)person {
    return [[person retain] autorelease];
}

- (void)setPerson:(FSKPersonSummary *)value {
    if (person != value) {
        [person release];
        person = [value retain];
    }
}

- (FSKPersonSummary *)father {
    return [[father retain] autorelease];
}

- (void)setFather:(FSKPersonSummary *)value {
    if (father != value) {
        [father release];
        father = [value retain];
    }
}

- (FSKPersonSummary *)mother {
    return [[mother retain] autorelease];
}

- (void)setMother:(FSKPersonSummary *)value {
    if (mother != value) {
        [mother release];
        mother = [value retain];
    }
}

- (NSArray *)spouses {
    return [[spouses retain] autorelease];
}

- (void)setSpouses:(NSArray *)value {
    if (spouses != value) {
        [spouses release];
        spouses = [value retain];
    }
}

- (NSArray *)children {
    return [[children retain] autorelease];
}

- (void)setChildren:(NSArray *)value {
    if (children != value) {
        [children release];
        children = [value retain];
    }
}


@end
