//
//  FSKRepositoryBase.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FSKRepositoryBase.h"


@implementation FSKRepositoryBase
- (id)initWithConnection:(FSKConnection *)aConnection;
{
    if ((self = [super init]) != nil) 
	{ 
		cache = [[NSMutableDictionary dictionary] retain];
		connection = [aConnection retain];
	}
	
	return self;
}

- (void)dealloc
{
	[connection release];
	[cache release];
	[super dealloc];
}

- (id)objectForId:(NSString *)key
{
	id cachedObject = [cache objectForKey:key];
	if (!cachedObject)
	{
		// fetch and put in cache
		cachedObject = [self createObjectForKey:key];
	}
	
	return cachedObject;
}

- (int)count
{
	return [cache count];
}

@end

@implementation FSKRepositoryBase (PrivateMethods)


- (id)createObjectForKey:(NSString *)key
{
	NSException* myException = [NSException
								exceptionWithName:@"RepositoryObjectCreationException"
								reason:@"Implementation of -(id)createObjectForKey:(NSString *)key should be overridden in the repository subclass"
								userInfo:nil];
	@throw myException;
}

@end
