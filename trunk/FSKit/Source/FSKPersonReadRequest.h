//
//  FSKPersonReadRequest.h
//  FSKit
//
//  Created by Demo Account on 3/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKRequest.h"
#import "FSKConnection.h"
#import "FSKPersonResponse.h"

@interface FSKPersonReadRequest : FSKRequest {

}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector;

+ (void)fetchPersonDataWithIds:(NSSet *)idList 
			   parameters:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector;

- (void)sendPersonReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;

- (FSKPersonResponse *)responseWithXML:(NSXMLDocument *)xmlDoc;

@end
