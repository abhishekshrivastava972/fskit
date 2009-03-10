//
//  FSKPersonRepository.m
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPersonRepository.h"
#import "FSKPerson.h"

@implementation FSKPersonRepository
- (id)init
{
    if ((self = [super init]) != nil) 
	{ 

	}
	
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (FSKPerson *)createObjectForId:(NSString *)key
{
	FSKPerson *cachedPerson = [[FSKPerson alloc] init];
	[cachedPerson setValue:key forKey:@"personId"];
	[cache setValue:cachedPerson forKey:key];
	return cachedPerson;
}

- (FSKPerson *)personForId:(NSString *)personId
{
	FSKPerson *cachedPerson = [super objectForId:personId];
	if (!cachedPerson)
	{
		// fetch and put in cache
		cachedPerson = [self createObjectForId:personId];
	}
	
	return cachedPerson;
}

@end
