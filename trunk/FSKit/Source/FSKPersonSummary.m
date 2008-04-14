//
//  FSKPersonSummary.m
//  FSKit
//
//  Created by Demo Account on 3/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonSummary.h"
#import "NSXMLElement+BExtensions.h"
#import "FSKEventSummary.h"

@implementation FSKPersonSummary

+ (FSKPersonSummary *)createFromXML:(NSXMLElement *)personElement
{
    id result = [[self alloc] initWithXML:personElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)personElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, personElement);
	personId = [[[personElement attributeForName:@"ref"] stringValue] retain];

	// On a Person Read, the summary information is in a <summary> element, but
	// on a Person Search, the summary information are direct children of the person
	// element, so we'll check for the intermediate summary element and fallback
	// to the person element if it's not there
	NSXMLElement *summaryElement = [personElement firstElementWithName:@"summary"];
	if (!summaryElement)
	{
		summaryElement = personElement;
	}
	
	name = [[summaryElement firstValueForXPath:@"*:name/*:form/*:fullText" error:nil] retain];
	gender = [[summaryElement firstValueForName:@"gender"] retain];

	birthEvent = [[FSKEventSummary createFromXML:(NSXMLElement *)[summaryElement firstNodeForXPath:@"./*:events/*:event[@type='Birth']" error:nil]] retain];
	christeningEvent = [[FSKEventSummary createFromXML:(NSXMLElement *)[summaryElement firstNodeForXPath:@"./*:events/*:event[@type='Christening']" error:nil]] retain];
	deathEvent = [[FSKEventSummary createFromXML:(NSXMLElement *)[summaryElement firstNodeForXPath:@"./*:events/*:event[@type='Death']" error:nil]] retain];
	burialEvent = [[FSKEventSummary createFromXML:(NSXMLElement *)[summaryElement firstNodeForXPath:@"./*:events/*:event[@type='Burial']" error:nil]] retain];
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

@end
