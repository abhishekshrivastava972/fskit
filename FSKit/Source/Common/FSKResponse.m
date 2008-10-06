//
//  FSKResponse.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKResponse.h"
#import "FSKError.h"
#import "NSXMLElement+BExtensions.h"

@implementation FSKResponse
- (void)parseXml
{
	@try {
		statusCode = [[[[xmlDocument nodesForXPath:@"/node()/@statusCode" error:nil] lastObject] stringValue] intValue];
		statusMessage = [[[xmlDocument nodesForXPath:@"/node()/@statusMessage" error:nil] lastObject] stringValue];
		version = [[[xmlDocument nodesForXPath:@"/node()/@version" error:nil] lastObject] stringValue];
		deprecatedValue = [[[xmlDocument nodesForXPath:@"/node()/@deprecated" error:nil] lastObject] stringValue];
		deprecated = (@"true" == deprecatedValue);
		errors = [[NSMutableArray array] retain];
		NSEnumerator *enumerator = [[xmlDocument nodesForXPath:@"//fsapi-v1:error" error:nil] objectEnumerator];
		NSXMLElement *errorElement1;
		while (errorElement1 = [enumerator nextObject]) {
			[errors addObject:[[FSKError alloc] initWithXML:errorElement1]];
		}		
		results = [[NSArray array] retain];
	}
	@catch (NSException * e) {
		NSLog(@"%s exception: %@", __PRETTY_FUNCTION__, e);
	}
	@finally {
		// TODO
	}
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;
{
    if ((self = [super init]) != nil) 
	{
		xmlDocument = [theXmlDocument retain];
		[self parseXml];
	}
	
	return self;
}

- (void)dealloc
{
	[xmlDocument release];
	[super dealloc];
}


- (NSXMLDocument *)xmlDocument
{
    return [[xmlDocument retain] autorelease];
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
