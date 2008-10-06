//
//  FSKUserResponse.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKResponse.h"

@interface FSKUserResponse : FSKResponse {
	NSArray *requestedIds; // of NSString
	NSArray *users; // of FSKUser
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;

- (NSArray *)userList;

@end
