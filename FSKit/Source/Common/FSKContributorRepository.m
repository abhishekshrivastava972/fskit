//
//  FSKUserRepository.m
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKContributorRepository.h"
#import "FSKContributorReadRequest.h"

@implementation FSKContributorRepository
static FSKContributorRepository *sharedInstance = nil;

+ (FSKContributorRepository*)instanceWithConnection:(FSKConnection *)aConnection
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
		repository = [[[FSKRepository alloc] initWithIdentifier:[self className]] retain];
		connection = [aConnection retain];
	}
	
	return self;
}

- (void)dealloc
{
	[connection release];
	[repository release];
	[super dealloc];
}


- (FSKContributor *)contributorForId:(NSString *)contributorId;
{
//	FSKUser *cachedUser = [cache objectForKey:userId];
//	if (!cachedUser)
//	{
//		// fetch and put in cache
//		cachedUser = [[FSKUser alloc] init];
//		[cachedUser setValue:userId forKey:@"userId"];
//		
//		[FSKUserReadRequest fetchUserDataWithIds:[NSSet setWithObject:userId] parameters:nil connection:connection delegate:self selector:@selector(request:didReturnResponse:)]; 
//	}
//	
//	return cachedUser;
	return nil;
}

- (void)request:(FSKRequest *)request 
didReturnResponse:(FSKResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
//	FSKUserResponse *userResponse = (FSKUserResponse *)response;
//	FSKUser *responseUser = [[userResponse userList] lastObject];
//	FSKUser *cachedUser = [cache objectForKey:[responseUser userId]];
//	[cache setObject:responseUser forKey:[[userResponse valueForKey:@"requestedIds"] lastObject]];
}

- (void)request:(FSKRequest *)request 
didFailWithError:(FSKError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}
@end
