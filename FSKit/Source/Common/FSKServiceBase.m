//
//  FamilySearchService.m
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKServiceBase.h"
#import "FSKRequest.h"
#import "FSKIdentityService.h"
#import "FSKPersonReadRequest.h"

@implementation FSKServiceBase
- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate
{
    if ((self = [super init]) != nil) 
	{ 
		connection = [familySearchConnection retain];
		_delegate = theDelegate ? theDelegate : [familySearchConnection delegate];
	}
	
	return self;
}

- (void)dealloc
{
	[connection release];
	[super dealloc];
}

-(void) makeFamilySearchRequest:(NSString *)endpoint
						 idList:(NSSet *)idList 
						 parameters:(NSDictionary *)parameterDict;
{
	[FSKPersonReadRequest fetchPersonDataWithIds:idList parameters:parameterDict connection:connection delegate:self selector:@selector(requestFinished:)];
}
-(NSDictionary *)properties
{
	return properties;
}

-(void) requestFinished:(NSXMLElement *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	if ([connection needsAuthentication])
	{
		[[FSKIdentityService identityServiceWithConnection:connection delegate:self] login];
	}
}

-(void) requestFailed:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	if ([connection needsAuthentication])
	{
		[[FSKIdentityService identityServiceWithConnection:connection delegate:self] login];
	}
}

@end
