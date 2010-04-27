//
//  FSKError.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKError.h"

@implementation FSKError

- (void)parseError:(id <EnunciateXML>)errorElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, errorElement);
//	NSMutableDictionary *info = [[NSMutableDictionary dictionary] retain];
//	[self setValue:[[[errorElement attributeForName:@"code"] stringValue] retain] forKey:@"code"];
//	[info setValue:[[[errorElement attributeForName:@"fsapi-v1:level"] stringValue] retain] forKey:@"level"];
//	
//	[info setValue:[[errorElement firstValueForName:@"fsapi-v1:details"] retain] forKey:@"details"];
//	[info setValue:[[errorElement firstValueForName:@"fsapi-v1:message"] retain] forKey:@"message"];
//
//	[self setValue:info forKey:@"userInfo"];
}

- (id)initWithError:(NSError *)error
{
	if (self = [super initWithDomain:[error domain]	code:[error code] userInfo:[error userInfo]])
	{
		
	}
	
	return self;
}

- (id)initWithXML:(id <EnunciateXML>)errorElement
{
    if ((self = [super init]) != nil) 
	{ 
		[self parseError:errorElement];
	}
	
	return self;	
}

@end
