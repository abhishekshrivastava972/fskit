//
//  FSKResponse.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKResponse.h"


@implementation FSKResponse

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;
{
    if ((self = [super init]) != nil) 
	{
		xmlDocument = [theXmlDocument retain];
		statusCode = INT_MIN;
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

//- (void)setXmlDocument:(NSXMLDocument *)value {
//    if (xmlDocument != value) {
//        [xmlDocument release];
//        xmlDocument = [value copy];
//    }
//}

- (int)statusCode
{
	if (statusCode == INT_MIN)
	{
		statusCode = [[[[xmlDocument nodesForXPath:@"/node()/@statusCode" error:nil] lastObject] stringValue] intValue];
	}
    return statusCode;
}

- (NSString *)statusMessage
{
	if (!statusMessage)
	{
		statusMessage = [[[xmlDocument nodesForXPath:@"/node()/@statusMessage" error:nil] lastObject] stringValue];
	}
    return [[statusMessage retain] autorelease];
}

- (NSString *)version
{
	if (!version)
	{
		version = [[[xmlDocument nodesForXPath:@"/node()/@version" error:nil] lastObject] stringValue];
	}
    return [[version retain] autorelease];
}

- (BOOL)deprecated
{
	if (!deprecatedValue)
	{
		deprecatedValue = [[[xmlDocument nodesForXPath:@"/node()/@deprecated" error:nil] lastObject] stringValue];
		deprecated = (@"true" == deprecatedValue);
	}
    return deprecated;
}

- (NSArrayController *)results
{
    return [[results retain] autorelease];
}

//- (void)setResults:(NSArrayController *)value {
//    if (results != value) {
//        [results release];
//        results = [value copy];
//    }
//}

- (NSArrayController *)errors
{
    return [[errors retain] autorelease];
}

@end
