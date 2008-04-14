//
//  FSKPersonResponse.m
//  FSKit
//
//  Created by Demo Account on 3/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonResponse.h"
#import "FSKPersonSummary.h"

@implementation FSKPersonResponse

- (void)parsePersonResponse:(NSXMLElement *)personsElement
{
	NSMutableArray *theResults = [NSMutableArray array];
	NSEnumerator *enumerator = [[personsElement elementsForName:@"person"] objectEnumerator];
	NSXMLElement *personElement;
	while (personElement = [enumerator nextObject]) {
		[theResults addObject:[FSKPersonSummary createFromXML:personElement]];
	}
	persons = [theResults retain];
}
	
- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		[self parsePersonResponse:[[xmlDocument rootElement] firstElementWithName:@"persons"]];
	}
	
	return self;	
}

- (void)dealloc
{
	[persons release];
	[super dealloc];
}

- (NSArray *)personList
{
	return [[persons retain] autorelease];
}

- (FSKPersonSummary *)summary
{
NSLog(@"fskpersresp summary %d %@", [persons count], [persons lastObject]);
	return [persons lastObject];
}

@end
