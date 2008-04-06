//
//  FSKPersonSummary.m
//  FSKit
//
//  Created by Demo Account on 3/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonSummary.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKPersonSummary

+ (FSKPersonSummary *)createFromXML:(NSXMLElement *)personElement
{
    id result = [[self alloc] initWithXML:personElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)personElement
{
	personId = [[[personElement attributeForName:@"ref"] stringValue] retain];
	name = [[personElement firstValueForXPath:@"*:name/*:form/*:fullText" error:nil] retain];
	gender = [[personElement firstValueForName:@"gender"] retain];
	NSXMLElement *birthElement = [[personElement firstElementWithName:@"birth"] retain];
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
