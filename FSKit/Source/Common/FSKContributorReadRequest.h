//
//  FSKContributorReadRequest.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRequest.h"
#import "FSKConnection.h"
#import "FSKContributorResponse.h"

@interface FSKContributorReadRequest : FSKRequest {

}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector;

+ (void)fetchContributorDataWithIds:(NSSet *)idList 
					parameters:(NSDictionary *)parameters 
					connection:aFamilySearchConnection 
					  delegate:(id)aDelegate 
					  selector:(SEL)aSelector;

- (void)sendContributorReadRequestWithIds:(NSSet *)idList parameters:(NSDictionary *)parameters;

- (FSKContributorResponse *)responseWithData:(NSData *)data;

@end
