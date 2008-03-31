//
//  FSKIdentityService.m
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityService.h"
#import "FSKIdentityResponse.h"

NSString * const LOGIN_ENDPOINT  = @"login";
NSString * const LOGOUT_ENDPOINT = @"logout";

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
		versionString = @"v1";
	}
	
	return self;
}

- (void)login {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKIdentityRequest *request = [[[FSKIdentityRequest alloc] initWithFamilySearchConnection:connection delegate:self selector:@selector(handleLoginResponse:)] retain]; 
	[request sendLoginRequest];
}

- (void)loginWithCredential:(NSURLCredential *)credential
{
//	NSXMLDocument* responseXML = [connection postFamilySearchData:myURL
//												  withData:[[NSString stringWithFormat:@"username=%@&password=%@&key=%@", 
//													  [credential user], [credential password], developerKey] dataUsingEncoding:NSUTF8StringEncoding] ofType:nil];

}

- (void)logout
{
	NSLog(@"%s", __PRETTY_FUNCTION__);

}

//-(void) requestFinished:(NSXMLElement *)response
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
//}
//
//-(void) requestFailed:(NSError *)error
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
//}

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

-(void)fetchIdentityData:(NSString *)module path:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, module, idList, parameterDict);
	[self makeFamilySearchRequest:module idList:idList parameters:parameterDict];
//	return nil;
}

@end
