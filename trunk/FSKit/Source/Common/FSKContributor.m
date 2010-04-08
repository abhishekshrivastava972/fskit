//
//  FSKContributor.m
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKContributor.h"
#import "enunciate_common.h"


@implementation FSKContributor
- (NSString *)contributorId {
    return [[contributorId retain] autorelease];
}

+ (FSKContributor *)createFromXML:(id <EnunciateXML>)contributorElement
{
    id result = [[self alloc] initWithXML:contributorElement];
    return [result autorelease];
}

- (void)parseXML:(id <EnunciateXML>)contributorElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, contributorElement);
	[self setValue:[[[contributorElement attributeForName:@"id"] stringValue] retain] forKey:@"userId"];
	
	[self setValue:[[contributorElement firstValueForName:@"name"] retain] forKey:@"name"];
	[self setValue:[[contributorElement firstValueForName:@"fullName"] retain] forKey:@"fullName"];
	[self setValue:[[contributorElement firstValueForName:@"email"] retain] forKey:@"email"];
	[self setValue:[[contributorElement firstValueForName:@"phone"] retain] forKey:@"phone"];
	
	id <EnunciateXML>addressElement = [contributorElement firstElementWithName:@"address"];
	if (addressElement)
	{
		[self setValue:[[addressElement firstValueForName:@"address1"] retain] forKey:@"address1"];
		[self setValue:[[addressElement firstValueForName:@"address2"] retain] forKey:@"address2"];
		[self setValue:[[addressElement firstValueForName:@"address3"] retain] forKey:@"address3"];
		[self setValue:[[addressElement firstValueForName:@"address4"] retain] forKey:@"address4"];
		[self setValue:[[addressElement firstValueForName:@"city"] retain] forKey:@"city"];
		[self setValue:[[addressElement firstValueForName:@"state"] retain] forKey:@"state"];
		[self setValue:[[addressElement firstValueForName:@"province"] retain] forKey:@"province"];
		[self setValue:[[addressElement firstValueForName:@"postalCode"] retain] forKey:@"postalCode"];
		[self setValue:[[addressElement firstValueForName:@"country"] retain] forKey:@"country"];
		[self setValue:[[addressElement firstValueForName:@"street1"] retain] forKey:@"street1"];
		[self setValue:[[addressElement firstValueForName:@"street2"] retain] forKey:@"street2"];
		[self setValue:[[addressElement firstValueForName:@"street3"] retain] forKey:@"street3"];
	}
	
	NSEnumerator *enumerator = [[contributorElement elementsForName:@"aliases"] objectEnumerator];
	id <EnunciateXML>aliasElement;
	while (aliasElement = [enumerator nextObject]) {
		[aliases addObject:[[aliasElement attributeForName:@"ref"] stringValue]];
	}
	
}

- (id)initWithXML:(id <EnunciateXML>)contributorElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:contributorElement];
    }
    
    return self;
}

@end
