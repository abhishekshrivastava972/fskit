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
	NSArray *results; // of id (Request-specific)
	NSArray *errors; // of FSKError
	BOOL hasErrors;
	BOOL hasResults;
}

- (id)initWithXML:(NSXMLDocument *)xmlDocument;

- (NSXMLDocument *)xmlDocument;

- (int)statusCode;

- (NSString *)statusMessage;

- (NSString *)version;

- (BOOL)deprecated;

- (NSArray *)results;

- (NSArray *)errors;

@end
