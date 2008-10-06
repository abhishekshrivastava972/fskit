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

- (FSKDate *)date {
    return [[date retain] autorelease];
}

- (void)setDate:(FSKDate *)value {
    if (date != value) {
        [date release];
        date = [value retain];
    }
}

- (FSKPlace *)place {
    return [[place retain] autorelease];
}

- (void)setPlace:(FSKPlace *)value {
    if (place != value) {
        [place release];
        place = [value retain];
    }
}

- (NSString *)assertionId {
    return [[assertionId retain] autorelease];
}

- (void)setAssertionId:(NSString *)value {
    if (assertionId != value) {
        [assertionId release];
        assertionId = [value copy];
    }
}

- (NSString *)contributor {
    return [[contributor retain] autorelease];
}

- (void)setContributor:(NSString *)value {
    if (contributor != value) {
        [contributor release];
        contributor = [value copy];
    }
}

- (NSString *)modified {
    return [[modified retain] autorelease];
}

- (void)setModified:(NSString *)value {
    if (modified != value) {
        [modified release];
        modified = [value copy];
    }
}

- (NSString *)scope {
    return [[scope retain] autorelease];
}

- (void)setScope:(NSString *)value {
    if (scope != value) {
        [scope release];
        scope = [value copy];
    }
}

- (NSString *)type {
    return [[type retain] autorelease];
}

- (void)setType:(NSString *)value {
    if (type != value) {
        [type release];
        type = [value copy];
    }
}



@end
