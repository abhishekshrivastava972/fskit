//
//  FSKEventSummary.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKEventSummary.h"
#import "FSKDate.h"
#import "FSKPlace.h"

@implementation FSKEventSummary

+ (FSKEventSummary *)createFromXML:(NSXMLElement *)eventElement
{
    id result = [[self alloc] initWithXML:eventElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)eventElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, eventElement);
	date = [[FSKDate createFromXML:[eventElement firstElementWithName:@"date"]] retain];
	place = [[FSKPlace createFromXML:[eventElement firstElementWithName:@"place"]] retain];
	type = [[[eventElement attributeForName:@"type"] stringValue] retain];
	scope = [[[eventElement attributeForName:@"scope"] stringValue] retain];
}

- (id)initWithXML:(NSXMLElement *)eventElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:eventElement];
    }
    
    return self;
}

@end
