//
//  FSKPedigreeResponse.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FSKPedigreeResponse.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKPedigreeResponse

//- (void)parsePersonResponse:(NSXMLElement *)personsElement
//{
//	NSMutableArray *theResults = [NSMutableArray array];
//	NSEnumerator *enumerator = [[personsElement elementsForName:@"person"] objectEnumerator];
//	NSXMLElement *personElement;
//	while (personElement = [enumerator nextObject]) {
//		[theResults addObject:[FSKPerson createFromXML:personElement]];
//	}
//	persons = [theResults retain];
//}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		[self parsePersonResponse:[[[[xmlDocument rootElement] firstElementWithName:@"pedigrees"] firstElementWithName:@"pedigree"] firstElementWithName:@"persons"]];
	}
	
	return self;	
}

@end
