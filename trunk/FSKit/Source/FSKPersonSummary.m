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
	personId = [[personElement attributeForName:@"ref"] stringValue];
	name = [personElement firstValueForName:@"score"];
	gender = [personElement firstValueForName:@"score"];
	NSXMLElement *birthElement = [personElement firstElementWithName:@"birth"];
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
