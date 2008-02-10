//
//  FSKIdentityResponse.m
//  FSKit
//
//  Created by Logan Allred on 1/27/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKIdentityResponse.h"


@implementation FSKIdentityResponse

- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 

	}
	
	return self;	
}

- (void)dealloc
{
	[sessionId release];
	[super dealloc];
}

- (NSString *)sessionId
{
	if (!sessionId)
	{
		sessionId = [[[[xmlDocument nodesForXPath:@"//session/@id" error:nil] lastObject] stringValue] retain];
	}
	return [[sessionId retain] autorelease];
}

@end
