//
//  FSKIdentityService.m
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityService.h"
#import "FSKIdentityResponse.h"
#import "FSKLoginController.h"

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

-(void) requestFinished:(NSXMLElement *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
}

-(void) requestFailed:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

@end

@implementation FSKIdentityService(PrivateMethods)
- (void)handleLoginResponse:(NSXMLDocument *)responseXML
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, responseXML);

	NSLog(@"login results:\n%@", [responseXML XMLStringWithOptions:NSXMLNodePrettyPrint]);
//	NSLog(@"session doc: %@ %@ %@", [responseXML rootElement], [responseXML nodesForXPath:@"." error:nil], [[[responseXML nodesForXPath:@"./session" error:nil] lastObject] attributeForName:@"version"]);
	NSXMLElement *rootNode = [responseXML rootElement];
	NSLog(@"root node: %@ %@ %@", [[[rootNode nodesForXPath:@"//session/@id" error:nil] lastObject] stringValue], [rootNode nodesForXPath:@"//session/@id" error:nil], [[rootNode attributeForName:@"version"] stringValue]);
	
	FSKIdentityResponse *response = [[FSKIdentityResponse alloc] initWithXML:responseXML];
	[connection setSessionId:[response sessionId]]; 
}

- (void)handleAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if ([challenge previousFailureCount] < 3)
	{
		// set default value, allow app delegate to override
		NSWindow *window = [NSApp mainWindow];
		if ([_delegate respondsToSelector:@selector(windowForAuthenticationSheet:)])
		{
			window = [_delegate windowForAuthenticationSheet:(FSKRequest *)self];
		}
		
		FSKLoginController *loginController = [[FSKLoginController alloc] init];
		[loginController startAuthentication:challenge window:window];
	} else
	{
		// If we don't have a valid credential, or have already failed auth 3x...
		[[challenge sender] cancelAuthenticationChallenge:challenge];
	}
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, challenge);
	[self handleAuthenticationChallenge:challenge];
}

-(void)fetchIdentityData:(NSString *)module path:(NSSet *)idList parameters:(NSDictionary *)parameterDict
{
	NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, module, idList, parameterDict);
	[self makeFamilySearchRequest:module idList:idList parameters:parameterDict];
//	return nil;
}

@end
