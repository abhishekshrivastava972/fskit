//
//  FSKIdentityService.m
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityService.h"
#import "FSKIdentityResponse.h"

BOOL isReady = NO;


@implementation FSKIdentityService

+ (FSKIdentityService *)identityServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate
{
	return [[[FSKIdentityService alloc] initWithConnection:familySearchConnection delegate:theDelegate] autorelease];
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate
{
    if ((self = [super initWithConnection:familySearchConnection delegate:theDelegate]) != nil) 
	{ 
		moduleName = @"identity";
		versionString = @"v2";
		identityProperties = [[[FSKProperties alloc] initWithFamilySearchConnection:familySearchConnection 
																		  delegate:self 
																		  endpoint:[NSString stringWithFormat:@"%@/%@", moduleName, versionString]] retain];
	}
	return self;
}

- (void)dealloc
{
	[identityProperties release];
	[super dealloc];
}

- (void)fetchProperties
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSLog(@"identityProperties hasProperties? %@", ([identityProperties hasProperties] ? @"YES" : @"NO"));
	[identityProperties refreshProperties];
//	FSKIdentityRequest *request = [[[FSKIdentityRequest alloc] initWithFamilySearchConnection:connection delegate:self selector:@selector(handlePropertiesResponse:)] retain]; 
//	[request sendPropertiesRequest];
}	

- (FSKProperties *)identityProperties;
{
	return identityProperties;
}

- (void)pingSession {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKIdentityRequest *request = [[[FSKIdentityRequest alloc] initWithFamilySearchConnection:connection delegate:self selector:@selector(handleSessionResponse:)] retain]; 
	[request sendSessionPingRequest];
}

- (void)makeReady
{
	// ping session
	[self pingSession];
	// get properties
	[self fetchProperties];
}

- (void)login {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSLog(@"identityProperties hasProperties? %@", ([identityProperties hasProperties] ? @"YES" : @"NO"));
	if ([identityProperties hasProperties])
	{
		[connection handleAuthenticationForRequest:nil];
	} else {
		[self fetchProperties];
	}
}

- (void)authenticationDidSucceedWithToken:(NSString *)token
{
	[connection setSessionId:token];
	[connection setNeedsAuthentication:NO];
	[self pingSession];
	[_delegate authenticationDidSucceedWithToken:token];
}

- (void)loginWithSessionId:(NSString *)sessionId
{
//	NSXMLDocument* responseXML = [connection postFamilySearchData:myURL
//												  withData:[[NSString stringWithFormat:@"username=%@&password=%@&key=%@", 
//													  [sessionId user], [sessionId password], developerKey] dataUsingEncoding:NSUTF8StringEncoding] ofType:nil];

}

- (void)logout
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKIdentityRequest *request = [[[FSKIdentityRequest alloc] initWithFamilySearchConnection:connection delegate:self selector:@selector(handleLoginResponse:)] retain]; 
	[request sendLogoutRequest];
}

//-(void) requestFinished:(id <EnunciateXML>)response
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
//}
//
//-(void) requestFailed:(NSError *)error
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
//}

- (NSArray *)permissions
{
	return nil;
}

- (FSKUserProfile *)profile
{
	return nil;
}

@end

@implementation FSKIdentityService(PrivateMethods)
- (void)handleLoginResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);

	[connection setSessionId:[response sessionId]]; 
	[connection setNeedsAuthentication:NO];
	
	if ([_delegate respondsToSelector:@selector(request:didReturnResponse:)])
	{
		[_delegate request:nil didReturnResponse:response];
	}
	
}

- (void)handlePropertiesResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	
	NSMutableDictionary *propertyDict = [NSMutableDictionary dictionary];
	NSArray *propertiesList = [response valueForKeyPath:@"xmlDocument.properties"];
	NSEnumerator *enumerator = [propertiesList objectEnumerator];
	FSIDENTITYV2AIdentityProperty *property;
	while ((property = [enumerator nextObject])) {
		[propertyDict setObject:[property value] forKey:[property name]];
	}
	properties = propertyDict;
}

-(void)fetchIdentityData:(NSString *)module path:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, module, idList, parameterDict);
	[self makeFamilySearchRequest:module idList:idList parameters:parameterDict];
//	return nil;
}

@end
