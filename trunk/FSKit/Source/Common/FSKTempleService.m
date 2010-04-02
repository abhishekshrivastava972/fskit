//
//  TempleService.m
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKTempleService.h"
#import "FSKConnection.h"


@implementation FSKTempleService

+(FSKTempleService *)templeServiceWithConnection:(FSKConnection *)connection
{
	return [[[FSKTempleService alloc] initWithConnection:connection] autorelease];
}

-(id)initWithConnection:(FSKConnection *)familySearchConnection
{
	self = [super init];
	moduleName = @"temple";
	versionString = @"v1";

	connection = familySearchConnection;
	
	return self;
}

- (NSArray *)fetchTempleList{
	NSURL *myURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/temple/v1/temple/%@", [connection baseURLString], @""]];
	NSLog(@"url: %@", myURL);
	NSError* err = nil;
	NSXMLDocument *doc=[[NSXMLDocument alloc] initWithContentsOfURL:myURL options:0 error:&err];
	if (err) {
		NSLog(@"Error: %@", err);
	}
	NSLog(@"\n%@",[doc XMLStringWithOptions:NSXMLNodePrettyPrint]);	
	NSLog(@"temple nodes: %@", [doc nodesForXPath:@"//temples/temple" error:&err]);
		if (err) {
			NSLog(@"Error: %@", err);
		}
		
		return [doc nodesForXPath:@"//temples/temple" error:nil];
//	return [NSArray arrayWithObjects:@"first", @"second", nil];
}
- (NSXMLNode *)fetchTempleWithCode:(NSString *)code {
	NSURL *myURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/temple/v1/temple/%@", [connection baseURLString], code]];
	NSLog(@"url: %@", myURL);
	NSError* err = nil;
	NSXMLDocument *doc=[[NSXMLDocument alloc] initWithContentsOfURL:myURL options:0 error:&err];
	if (err) {
		NSLog(@"Error: %@", err);
	}
	NSLog(@"\n%@",[doc XMLStringWithOptions:NSXMLNodePrettyPrint]);	
	
	return [[doc nodesForXPath:@"//temples/temple" error:nil] lastObject];
								//	return [NSArray arrayWithObjects:@"first", @"second", nil];
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
