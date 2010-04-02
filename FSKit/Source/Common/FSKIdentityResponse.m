//
//  FSKIdentityResponse.m
//  FSKit
//
//  Created by Logan Allred on 1/27/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityResponse.h"


@implementation FSKIdentityResponse

- (id)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]) != nil) 
	{
		xmlDocument = [[FSIDENTITYV2AIdentity readFromXML:data] retain];
	}
	
	return self;	
}

- (FSIDENTITYV2AIdentity *)xmlDocument;
{
	return [[xmlDocument retain] autorelease];
}

- (void)dealloc
{
	[sessionId release];
	[xmlDocument release];
	[super dealloc];
}

- (NSString *)sessionId
{
	if (!sessionId)
	{
		sessionId = [[[[self xmlDocument] session] id] retain];
	}
	return [[sessionId retain] autorelease];
}

@end
