//
//  FSKDate.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKDate.h"


@implementation FSKDate

+ (FSKDate *)createFromXML:(NSXMLElement *)dateElement
{
    id result = [[self alloc] initWithXML:dateElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)dateElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, dateElement);
	original = [[dateElement firstValueForName:@"original"] retain];
	normalized = [[dateElement firstValueForName:@"normalized"] retain];
	earliestAstro = [[dateElement firstValueForXPath:@"*:astro/*:earliest" error:nil] retain];
	latestAstro = [[dateElement firstValueForXPath:@"*:astro/*:latest" error:nil] retain];
}

- (id)initWithXML:(NSXMLElement *)dateElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:dateElement];
    }
    
    return self;
}

@end
