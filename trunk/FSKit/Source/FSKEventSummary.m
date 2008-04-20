//
//  FSKEventSummary.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKEventSummary.h"
#import "FSKDate.h"
#import "FSKPlace.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKEventSummary

+ (FSKEventSummary *)createFromXML:(NSXMLElement *)eventElement
{
    id result = [[self alloc] initWithXML:eventElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)eventElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, eventElement);
	[self setValue:[[FSKDate createFromXML:[eventElement firstElementWithName:@"date"]] retain] forKey:@"date"];
	[self setValue:[[FSKPlace createFromXML:[eventElement firstElementWithName:@"place"]] retain] forKey:@"place"];
	[self setValue:[[[eventElement attributeForName:@"type"] stringValue] retain] forKey:@"type"];
	[self setValue:[[[eventElement attributeForName:@"scope"] stringValue] retain] forKey:@"scope"];
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
