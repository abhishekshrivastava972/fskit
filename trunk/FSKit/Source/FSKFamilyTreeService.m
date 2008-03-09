//
//  FamilyTreeService.m
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKFamilyTreeService.h"

NSString * const PERSON_ENDPOINT  = @"person";
NSString * const SEARCH_ENDPOINT = @"search";
NSString * const USER_ENDPOINT = @"user";
NSString * const PERSONA_ENDPOINT = @"persona";

@implementation FSKFamilyTreeService

+ (FSKFamilyTreeService *)familyTreeServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;
{
	return [[[FSKFamilyTreeService alloc] initWithConnection:familySearchConnection delegate:theDelegate] autorelease];
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;
{
    if ((self = [super initWithConnection:familySearchConnection delegate:theDelegate]) != nil) 
	{ 
		moduleName = @"familytree";
		versionString = @"v1";
	}
	
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

-(void)fetchFamilyTreeData:(NSString *)module path:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, module, idList, parameterDict);
	[self makeFamilySearchRequest:module idList:idList parameters:parameterDict];
//	return nil;
}

-(void)fetchPersonDataWithIds:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@", __PRETTY_FUNCTION__, idList, parameterDict);
	[self fetchFamilyTreeData:@"person" path:idList parameters:parameterDict];
}


- (void)readPersons:(NSSet *)personIds {
	[self fetchPersonDataWithIds:personIds parameters:[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"summary", @"values", nil], @"view", nil]];
}

- (void)readPerson:(NSString *)personId {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	//return 
	[self readPersons:[NSSet setWithObject:personId]];
}

-(void)searchByFullName:(NSString *)fullName
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSMutableDictionary *criteriaDict = [NSMutableDictionary dictionaryWithObject:fullName forKey:@"name"];
	[self searchWithCriteria:criteriaDict];
}

-(void)searchByFamilyName:(NSString *)familyName givenNames:(NSString *)givenNames
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSMutableDictionary *criteriaDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:givenNames, @"givenName", familyName, @"familyName"];
	[self searchWithCriteria:criteriaDict];
}

-(void)searchWithCriteria:(NSDictionary *)searchCriteria
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	[self fetchFamilyTreeData:@"search" path:nil parameters:searchCriteria];
}

-(void) requestFinished:(NSXMLElement *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [response name]);
	if ([_delegate respondsToSelector:@selector(requestFinished:)])
	{
		[_delegate requestFinished:response];
	}
}

-(void) requestFailed:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	
}

/*
		[FSKIdentityRequest *loginRequest = [[FSKIdentityRequest alloc] initWithFamilySearchConnection:familySearchConnection delegate:self selector:@selector(loginComplete:)];
		[loginRequest login];   

- (void)loginComplete:(FSKIdentityResponse *)response
{
	if ([response statusCode] == 200)
	{
		[connection setSessionId:[response sessionId]];
	}
}
*/

@end
