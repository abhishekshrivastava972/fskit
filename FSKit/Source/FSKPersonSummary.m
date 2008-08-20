//
//  FSKPersonSummary.m
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
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

- (void)parseXML:(NSXMLElement *)personSummaryElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, personSummaryElement);

	[self setValue:[[personSummaryElement firstValueForXPath:@"*:name/*:form/*:fullText" error:nil] retain] forKey:@"name"];
	[self setValue:[[personSummaryElement firstValueForName:@"gender"] retain] forKey:@"gender"];

	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./*:events/*:event[@type='Birth']" error:nil]] retain] forKey:@"birthEvent"];
	[self setValue:[birthEvent valueForKeyPath:@"date.original"] forKey:@"birthdate"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./*:events/*:event[@type='Christening']" error:nil]] retain] forKey:@"christeningEvent"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./*:events/*:event[@type='Death']" error:nil]] retain] forKey:@"deathEvent"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./*:events/*:event[@type='Burial']" error:nil]] retain] forKey:@"burialEvent"];
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
