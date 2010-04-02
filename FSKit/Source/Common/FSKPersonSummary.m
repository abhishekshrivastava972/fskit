//
//  FSKPersonSummary.m
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPersonSummary.h"
#import "FSKEventSummary.h"

@implementation FSKPersonSummary

+ (FSKPersonSummary *)createFromXML:(FSFAMILYTREEV2SearchPerson *)personElement
{
    id result = [[self alloc] initWithXML:personElement];
    return [result autorelease];
}

- (void)parseXML:(FSFAMILYTREEV2SearchPerson *)personSummaryElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, personSummaryElement);
	NSXMLElement *nameElement = (NSXMLElement *)[personSummaryElement firstNodeForXPath:@"names/name" error:nil];
	if (!nameElement)
	{
		nameElement = [personSummaryElement firstElementWithName:@"name"];
	}
	[self setValue:[[nameElement firstValueForXPath:@".//forms//form/fullText/text()" error:nil] retain] forKey:@"name"];
	NSXMLElement *genderElement = (NSXMLElement *)[personSummaryElement firstNodeForXPath:@".//genders/gender" error:nil];
	if (!genderElement)
	{
		genderElement = [personSummaryElement firstElementWithName:@"gender"];
	}
	[self setValue:[[personSummaryElement firstValueForXPath:@".//type" error:nil] retain] forKey:@"gender"];

	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./events/event/value[@type='Birth']" error:nil]] retain] forKey:@"birthEvent"];
	[self setValue:[birthEvent valueForKeyPath:@"date.original"] forKey:@"birthdate"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./events/event/value[@type='Christening']" error:nil]] retain] forKey:@"christeningEvent"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./events/event/value[@type='Death']" error:nil]] retain] forKey:@"deathEvent"];
	[self setValue:[[FSKEventSummary createFromXML:(NSXMLElement *)[personSummaryElement firstNodeForXPath:@"./events/event/value[@type='Burial']" error:nil]] retain] forKey:@"burialEvent"];
	
	[self setValue:[personSummaryElement firstValueForName:@"minBirthYear"] forKey:@"minBirthYear"];
	[self setValue:[personSummaryElement firstValueForName:@"maxDeathYear"] forKey:@"maxDeathYear"];
}

- (id)initWithXML:(FSFAMILYTREEV2SearchPerson *)personElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:personElement];
    }
    
    return self;
}

- (NSString *)lifespanString;
{
	return [NSString stringWithFormat:@"(%@-%@)", minBirthYear, maxDeathYear];
}

- (NSString *)name {
    return [[name retain] autorelease];
}

- (void)setName:(NSString *)value {
    if (name != value) {
        [name release];
        name = [value copy];
    }
}

- (NSString *)gender {
    return [[gender retain] autorelease];
}

- (void)setGender:(NSString *)value {
    if (gender != value) {
        [gender release];
        gender = [value copy];
    }
}

- (NSString *)birthdate {
    return [[birthdate retain] autorelease];
}

- (void)setBirthdate:(NSString *)value {
    if (birthdate != value) {
        [birthdate release];
        birthdate = [value retain];
    }
}

- (FSKEventSummary *)birthEvent {
    return [[birthEvent retain] autorelease];
}

- (void)setBirthEvent:(FSKEventSummary *)value {
    if (birthEvent != value) {
        [birthEvent release];
        birthEvent = [value retain];
    }
}

- (FSKEventSummary *)christeningEvent {
    return [[christeningEvent retain] autorelease];
}

- (void)setChristeningEvent:(FSKEventSummary *)value {
    if (christeningEvent != value) {
        [christeningEvent release];
        christeningEvent = [value retain];
    }
}

- (FSKEventSummary *)deathEvent {
    return [[deathEvent retain] autorelease];
}

- (void)setDeathEvent:(FSKEventSummary *)value {
    if (deathEvent != value) {
        [deathEvent release];
        deathEvent = [value retain];
    }
}

- (FSKEventSummary *)burialEvent {
    return [[burialEvent retain] autorelease];
}

- (void)setBurialEvent:(FSKEventSummary *)value {
    if (burialEvent != value) {
        [burialEvent release];
        burialEvent = [value retain];
    }
}

- (FSKEventSummary *)marriageEvent {
    return [[marriageEvent retain] autorelease];
}

- (void)setMarriageEvent:(FSKEventSummary *)value {
    if (marriageEvent != value) {
        [marriageEvent release];
        marriageEvent = [value retain];
    }
}

- (FSKPersonSummary *)spouse {
    return [[spouse retain] autorelease];
}

- (void)setSpouse:(FSKPersonSummary *)value {
    if (spouse != value) {
        [spouse release];
        spouse = [value copy];
    }
}

- (BOOL)hasAdditionalSpouses {
    return hasAdditionalSpouses;
}

- (void)setHasAdditionalSpouses:(BOOL)value {
    if (hasAdditionalSpouses != value) {
        hasAdditionalSpouses = value;
    }
}

- (FSKCouple *)parents {
    return [[parents retain] autorelease];
}

- (void)setParents:(FSKCouple *)value {
    if (parents != value) {
        [parents release];
        parents = [value copy];
    }
}

- (BOOL)hasAdditionalParents {
    return hasAdditionalParents;
}

- (void)setHasAdditionalParents:(BOOL)value {
    if (hasAdditionalParents != value) {
        hasAdditionalParents = value;
    }
}

- (NSArray *)children {
    return [[children retain] autorelease];
}

- (void)setChildren:(NSArray *)value {
    if (children != value) {
        [children release];
        children = [value copy];
    }
}

- (BOOL)hasAdditionalChildren {
    return hasAdditionalChildren;
}

- (void)setHasAdditionalChildren:(BOOL)value {
    if (hasAdditionalChildren != value) {
        hasAdditionalChildren = value;
    }
}




@end
