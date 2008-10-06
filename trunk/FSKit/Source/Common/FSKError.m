//
//  FSKError.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKError.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKError

- (void)parseError:(NSXMLElement *)errorElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, errorElement);
	NSMutableDictionary *info = [[NSMutableDictionary dictionary] retain];
	[self setValue:[[[errorElement attributeForName:@"code"] objectValue] retain] forKey:@"code"];
	[info setValue:[[[errorElement attributeForName:@"fsapi-v1:level"] objectValue] retain] forKey:@"level"];
	
	[info setValue:[[errorElement firstValueForName:@"fsapi-v1:details"] retain] forKey:@"details"];
	[info setValue:[[errorElement firstValueForName:@"fsapi-v1:message"] retain] forKey:@"message"];

	[self setValue:info forKey:@"userInfo"];
}

- (id)initWithError:(NSError *)error
{
	if (self = [super initWithDomain:[error domain]	code:[error code] userInfo:[error userInfo]])
	{
		
	}
	
	return self;
}

- (id)initWithXML:(NSXMLElement *)errorElement
{
    if ((self = [super init]) != nil) 
	{ 
		[self parseError:errorElement];
	}
	
	return self;	
}

@end
