//
//  FSKPerson.m
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKPerson.h"
#import "NSXMLElement+BExtensions.h"
#import "FSKUtils.h"

@implementation FSKPerson

- (NSString *)fullName
{
	return [summary name];
}

- (NSString *)gender
{
	return [summary gender];
}

- (FSKEventSummary *)birthEvent
{
	return [[self summary] birthEvent];
}

- (FSKEventSummary *)deathEvent
{
	return [[self summary] deathEvent];
}


- (NSString *)personId {
    return [[personId retain] autorelease];
}

- (void)setPersonId:(NSString *)value {
    if (personId != value) {
        [personId release];
        personId = [value copy];
    }
}


+ (FSKPerson *)createFromXML:(NSXMLElement *)personElement
{
    id result = [[self alloc] initWithXML:personElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)personElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, personElement);
	[self setValue:[[[personElement attributeForName:@"id"] stringValue] retain] forKey:@"personId"];
	NSXMLElement *propertiesElement = [personElement firstElementWithName:@"properties"];

	if (propertiesElement)
	{
		[self setValue:[NSNumber numberWithBool:[[propertiesElement firstValueForName:@"living"] boolValue]] forKey:@"living"];
		[self setValue:[NSNumber numberWithBool:[[propertiesElement firstValueForName:@"modifiable"] boolValue]] forKey:@"modifiable"];
		[self setValue:[[FSKUtils dateFromISO8601String:[propertiesElement firstValueForName:@"modified"]] retain] forKey:@"modified"];
		[self setValue:[NSNumber numberWithBool:[[propertiesElement firstValueForName:@"multipleFamiliesAsChild"] boolValue]] forKey:@"multipleFamiliesAsChild"];
		[self setValue:[NSNumber numberWithBool:[[propertiesElement firstValueForName:@"multipleFamiliesAsParent"] boolValue]] forKey:@"multipleFamiliesAsParent"];
	}
	
	// On a Person Read, the summary information is in a <summary> element, but
	// on a Person Search, the summary information are direct children of the person
	// element, so we'll check for the intermediate summary element and fallback
	// to the person element if it's not there
	NSXMLElement *summaryElement = [personElement firstElementWithName:@"assertions"];
	if (!summaryElement)
	{
		[self setValue:[[[personElement attributeForName:@"ref"] stringValue] retain] forKey:@"personId"];
		summaryElement = personElement;
	}
	summary = [[FSKPersonSummary createFromXML:summaryElement] retain];
	[summary setValue:personId forKey:@"personId"];
	detail = [[FSKPersonDetail createFromXML:summaryElement] retain];
	
}

- (id)initWithXML:(NSXMLElement *)personElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:personElement];
    }
    
    return self;
}

- (FSKPersonSummary *)summary {
    return [[summary retain] autorelease];
}


- (FSKPersonDetail *)detail {
    return [[detail retain] autorelease];
}

@end
