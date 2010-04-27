//
//  FSKPersonResponse.m
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPersonResponse.h"
#import "FSKPerson.h"
#import "familytree.h"

@implementation FSKPersonResponse

- (id)initWithData:(NSData *)data
{
    if ((self = [super init]) != nil) 
	{
		@try {
			FSFAMILYTREEV2FamilyTree *familytree = [FSFAMILYTREEV2FamilyTree readFromXML:data];
			statusCode = *([familytree statusCode]);
			statusMessage = [[familytree statusMessage] retain];
			version = [[familytree version] retain];
			NSMutableArray *theResults = [NSMutableArray array];
			NSEnumerator *enumerator = [[familytree persons] objectEnumerator];
			FSFAMILYTREEV2Person *personElement;
			while (personElement = [enumerator nextObject]) {
				[theResults addObject:[FSKPerson createFromXML:personElement]];
			}
			persons = [theResults retain];
		}
		@catch (NSException * e) {
			NSLog(@"error: %@", e);
		}
		@finally {
		}
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
NSLog(@"fskpersresp summary %d %@", [persons count], [[persons lastObject] summary]);
	return [[self person] summary];
}

- (FSKPerson *)person
{
	NSLog(@"fskpersresp person %d %@", [persons count], [persons lastObject]);
	return [persons lastObject];
}

- (FSKPersonSummary *)personSummary
{
	NSLog(@"fskpersresp personsummary %d %@", [persons count], [persons lastObject]);
	return [FSKPersonSummary createFromXML:[persons lastObject]];
}

@end
