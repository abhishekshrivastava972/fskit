//
//  FSKPedigreeResponse.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKPedigreeResponse.h"
#import "familytree.h"

@implementation FSKPedigreeResponse

//- (void)parsePersonResponse:(id <EnunciateXML>)personsElement
//{
//	NSMutableArray *theResults = [NSMutableArray array];
//	NSEnumerator *enumerator = [[personsElement elementsForName:@"person"] objectEnumerator];
//	id <EnunciateXML>personElement;
//	while (personElement = [enumerator nextObject]) {
//		[theResults addObject:[FSKPerson createFromXML:personElement]];
//	}
//	persons = [theResults retain];
//}

- (id)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]) != nil) 
	{ 
		FSFAMILYTREEV2FamilyTree *familytree = [FSFAMILYTREEV2FamilyTree readFromXML:data];
		NSMutableArray *theResults = [NSMutableArray array];
		NSEnumerator *enumerator = [[[familytree pedigrees] persons] objectEnumerator];
		FSFAMILYTREEV2Person *personElement;
		while (personElement = [enumerator nextObject]) {
			[theResults addObject:[FSKPerson createFromXML:personElement]];
		}
		persons = [theResults retain];
	}
	
	return self;	
}

@end
