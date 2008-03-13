//
//  FamilyTreeService.m
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKPersonService.h"
#import "FSKResponse.h"
#import "FSKPersonResponse.h"
#import "FSKPersonSearchRequest.h"

NSString * const PERSON_ENDPOINT  = @"person";
NSString * const SEARCH_ENDPOINT = @"search";
NSString * const USER_ENDPOINT = @"user";
NSString * const PERSONA_ENDPOINT = @"persona";

@implementation FSKPersonService

+ (FSKPersonService *)personServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;
{
	return [[[FSKPersonService alloc] initWithConnection:familySearchConnection delegate:theDelegate] autorelease];
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

-(void)fetchPersonDataWithIds:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@", __PRETTY_FUNCTION__, idList, parameterDict);
	[self makeFamilySearchRequest:@"person" 
		idList:idList 
		parameters:parameterDict];
//	[FSKPersonReadRequest fetchPersonDataWithIds:idList 
//		parameters:parameterDict 
//		connection:self 
//		delegate:self selector:@selector(handleResponse:)];
	
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
	[self makeFamilySearchRequest:@"familytree/v1/search" idList:nil parameters:searchCriteria];
//	[FSKPersonSearchRequest fetchSearchResultsWithCriteria:searchCriteria connection:connection delegate:_delegate selector:@selector(requestFinished:)];
//	[self fetchPersonDataWithIds:nil parameters:searchCriteria];
}

-(void) requestFinished:(FSKResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [response description]);
	if ([_delegate respondsToSelector:@selector(requestFinished:)])
	{
		[_delegate requestFinished:(FSKPersonResponse *)response];
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
