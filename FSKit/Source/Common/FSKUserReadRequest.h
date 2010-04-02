//
//  FSKUserReadRequest.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRequest.h"
#import "FSKConnection.h"
#import "FSKUserResponse.h"

@interface FSKUserReadRequest : FSKRequest {

}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector;

+ (void)fetchUserDataWithIds:(NSSet *)idList 
					parameters:(NSDictionary *)parameters 
					connection:aFamilySearchConnection 
					  delegate:(id)aDelegate 
					  selector:(SEL)aSelector;

- (void)sendUserReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;

- (FSKUserResponse *)responseWithData:(NSData *)data;

@end
