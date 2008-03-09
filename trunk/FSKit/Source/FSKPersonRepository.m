//
//  FSKPersonRepository.m
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPersonRepository.h"


@implementation FSKPersonRepository
- (id)init
{
    if ((self = [super init]) != nil) 
	{ 
		cache = [NSMutableDictionary dictionary];
	}
	
	return self;
}

- (void)dealloc
{
	[cache release];
	[super dealloc];
}

- (FSKPerson *)personForId:(NSString *)personId
{
	FSKPerson *cachedPerson = [cache objectForKey:personId];
	if (!cachedPerson)
	{
		// fetch and put in cache
	}
	
	return cachedPerson;
}

@end
