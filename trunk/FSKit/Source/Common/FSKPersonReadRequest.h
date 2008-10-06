//
//  FSKPersonReadRequest.h
//  FSKit
//
//  Created by Logan Allred on 3/12/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
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
