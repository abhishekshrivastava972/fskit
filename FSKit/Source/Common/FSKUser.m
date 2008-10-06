//
//  FSKUser.m
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKUser.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKUser

- (NSString *)userId {
    return [[contributorId retain] autorelease];
}

- (void)setUserId:(NSString *)value {
    if (contributorId != value) {
        [contributorId release];
        contributorId = [value copy];
    }
}


+ (FSKUser *)createFromXML:(NSXMLElement *)userElement
{
    id result = [[self alloc] initWithXML:userElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)userElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, userElement);
	[self setValue:[[[userElement attributeForName:@"id"] stringValue] retain] forKey:@"userId"];

	[self setValue:[[userElement firstValueForName:@"name"] retain] forKey:@"name"];
	[self setValue:[[userElement firstValueForName:@"fullName"] retain] forKey:@"fullName"];
	[self setValue:[[userElement firstValueForName:@"email"] retain] forKey:@"email"];
	[self setValue:[[userElement firstValueForName:@"phone"] retain] forKey:@"phone"];
	
	NSXMLElement *addressElement = [userElement firstElementWithName:@"address"];
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

	NSEnumerator *enumerator = [[userElement elementsForName:@"aliases"] objectEnumerator];
	NSXMLElement *aliasElement;
	while (aliasElement = [enumerator nextObject]) {
		[self addAlias:[[aliasElement attributeForName:@"ref"] stringValue]];
	}
	
}

- (void)addAlias:(NSString *)value
{
	if (!aliases)
	{
		aliases = [[NSMutableArray array] retain];
	}
	if ([aliases containsObject:value])
	{
		[aliases addObject:value];
	}
}

- (id)initWithXML:(NSXMLElement *)userElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:userElement];
    }
    
    return self;
}

@end
