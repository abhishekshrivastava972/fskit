//
//  FSKPersonRepository.m
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPersonRepository.h"
#import "FSKRepository.h"
#import "FSKPerson.h"
#import "FSKConnection.h"
#import "FSKPersonService.h"
#import "FSKPersonResponse.h"
#import "FSKRequest.h"

@implementation FSKPersonRepository
static FSKPersonRepository *sharedInstance = nil;

+ (FSKPersonRepository*)instanceWithConnection:(FSKConnection *)aConnection
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            [[self alloc] initWithConnection:aConnection]; // assignment not done here
        }
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

- (id)initWithConnection:(FSKConnection *)aConnection
{
    if ((self = [super init]) != nil) 
	{ 
		repository = [[[FSKRepository alloc] init] retain];
		connection = [aConnection retain];
		personService = [FSKPersonService personServiceWithConnection:aConnection delegate:self];
	}
	
	return self;
}


- (int)count
{
	return [repository count];
}

- (NSArray *)allPersons
{
	return [repository allObjects];
}

- (NSArray *)allIds
{
	return [repository allKeys];
}

- (void)dealloc
{
	[connection release];
	[repository release];
	[super dealloc];
}

- (FSKPerson *)createObjectForId:(NSString *)key
{
	FSKPerson *cachedPerson = [[FSKPerson alloc] init];
	[cachedPerson setValue:key forKey:@"personId"];
	[repository addObject:cachedPerson withId:key];
	return cachedPerson;
}

- (FSKPerson *)personForId:(NSString *)personId
{
	FSKPerson *cachedPerson = [repository objectForId:personId];
	if (!cachedPerson)
	{
		// fetch and put in cache
		cachedPerson = [self createObjectForId:personId];
		[personService readPerson:personId];
	}
	
	return cachedPerson;
}

- (void)request:(FSKRequest *)request didReturnResponse:(FSKPersonResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	
}

@end
