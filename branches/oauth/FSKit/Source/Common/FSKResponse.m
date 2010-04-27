//
//  FSKResponse.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKResponse.h"
#import "FSKError.h"
#import "enunciate_common.h"

@implementation FSKResponse
- (void)parseData
{
	// subclasses should override
}

- (id)initWithData:(NSData *)data;
{
    if ((self = [super init]) != nil) 
	{
		[self parseData];
	}
	
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (int)statusCode
{
    return statusCode;
}

- (NSString *)statusMessage
{
    return [[statusMessage retain] autorelease];
}

- (NSString *)version
{
    return [[version retain] autorelease];
}

- (BOOL)deprecated
{
    return deprecated;
}

- (NSArray *)results
{
    return [[results retain] autorelease];
}

- (NSArray *)errors
{
    return [[errors retain] autorelease];
}

@end
