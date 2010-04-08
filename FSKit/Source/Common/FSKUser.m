//
//  FSKUser.m
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKUser.h"

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


+ (FSKUser *)createFromXML:(FSFAMILYTREEV2User *)userElement
{
    id result = [[self alloc] initWithXML:userElement];
    return [result autorelease];
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

- (id)initWithXML:(FSFAMILYTREEV2User *)userElement
{
    if ((self = [super init]) != nil) 
	{
		[self setValue:[[userElement id] retain] forKey:@"userId"];
		
		[self setValue:[[userElement name] retain] forKey:@"name"];
		[self setValue:[[userElement fullName] retain] forKey:@"fullName"];
		[self setValue:[[userElement email] retain] forKey:@"email"];
		[self setValue:[[userElement phone] retain] forKey:@"phone"];
				
		NSEnumerator *enumerator = [[userElement elementsForName:@"aliases"] objectEnumerator];
		id <EnunciateXML>aliasElement;
		while (aliasElement = [enumerator nextObject]) {
			[self addAlias:[[aliasElement attributeForName:@"ref"] stringValue]];
		}
    }
    
    return self;
}

@end
