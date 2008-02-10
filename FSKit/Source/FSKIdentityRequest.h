//
//  FSKIdentityRequest.h
//  FSKit
//
//  Created by Logan Allred on 1/23/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKRequest.h"


@interface FSKIdentityRequest : FSKRequest {

}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector;

+ (void)fetchIdentityData:(NSString *)endpoint 
				  WithIds:(NSSet *)idList 
			   parameters:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector;

- (void)sendLoginRequest;

- (void)sendLogoutRequest;

@end
