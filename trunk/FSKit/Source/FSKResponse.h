//
//  FSKResponse.h
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKResponse : NSObject 
{
	NSXMLDocument *xmlDocument;
	int statusCode;
	NSString *statusMessage;
	NSString *version;
	NSString *deprecatedValue;
	BOOL deprecated;
	NSArrayController *results;
	NSArrayController *errors;
	BOOL hasErrors;
	BOOL hasResults;
}

- (id)initWithXML:(NSXMLDocument *)xmlDocument;

- (NSXMLDocument *)xmlDocument;
//- (void)setXmlDocument:(NSXMLDocument *)value;

- (int)statusCode;

- (NSString *)statusMessage;

- (NSString *)version;

- (BOOL)deprecated;

- (NSArrayController *)results;
//- (void)setResults:(NSArrayController *)value;

- (NSArrayController *)errors;

@end
