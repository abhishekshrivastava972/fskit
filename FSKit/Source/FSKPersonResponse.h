//
//  FSKPersonResponse.h
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKResponse.h"

@interface FSKPersonResponse : FSKResponse {
	NSArray *persons; // of FSKPerson
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;

- (NSArray *)personList;

@end
