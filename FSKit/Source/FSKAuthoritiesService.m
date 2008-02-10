//
//  AuthoritiesService.m
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKAuthoritiesService.h"

NSString * const PLACE_ENDPOINT   = @"place";
NSString * const NAME_ENDPOINT    = @"name";
NSString * const DATE_ENDPOINT    = @"date";
NSString * const CULTURE_ENDPOINT = @"culture";

@implementation FSKAuthoritiesService
+(FSKAuthoritiesService *)authoritiesServiceWithConnection:(FSKConnection *)connection
{
	return [[[FSKAuthoritiesService alloc] initWithConnection:connection] autorelease];
}

-(id)initWithConnection:(FSKConnection *)familySearchConnection
{
	self = [super init];
	moduleName = @"authorities";
	versionString = @"v1";

	connection = familySearchConnection;
	
	return self;
}
@end
