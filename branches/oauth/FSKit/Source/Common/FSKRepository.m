//
//  FSKRepositoryBase.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKRepository.h"

NSString *cachesDirectory = nil;
NSString *kRepositoryCacheBaseFileName = @"com.googlecode.fskit";

@implementation FSKRepository
- (id)initWithIdentifier:(NSString *)identifier
{
    if ((self = [super init]) != nil) 
	{ 
		cache = [[NSMutableDictionary dictionary] retain];
		repositoryIdentifier = [identifier retain];
		cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	}
	
	return self;
}

- (void)dealloc
{
	[repositoryIdentifier release];
	[cache release];
	[super dealloc];
}

- (id)objectForId:(NSString *)key
{
	id cachedObject = [cache objectForKey:key];
	return cachedObject;
}
- (void)addObject:(id)object withId:(NSString *)objectId
{
	// TODO, search for dup keys
	[cache setObject:object forKey:objectId];
}

- (int)count
{
	return [cache count];
}

- (NSArray *)allObjects
{
	return [cache allValues];
}

- (NSArray *)allKeys
{
	return [cache allKeys];
}

- (void)save
{
	NSString *cacheFilePath = [cachesDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", kRepositoryCacheBaseFileName, repositoryIdentifier]];
	@try {
		[cache writeToFile:cacheFilePath atomically:YES];
	}
	@catch (NSException * e) {
		NSLog(@"Exception writing repository cache (%@) at path %@: %@", repositoryIdentifier, cacheFilePath, e);
	}
	@finally {
		
	}
}

@end