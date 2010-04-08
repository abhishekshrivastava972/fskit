//
//  FSKIdentityRequest.h
//  FSKit
//
//  Created by Logan Allred on 1/23/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRequest.h"
#import "FSKIdentityResponse.h"
#import "identity.h"

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

- (FSKIdentityResponse *)responseWithData:(NSData *)data;

- (void)sendPropertiesRequest;
- (void)sendUserProfileRequest;
- (void)sendUserPermissionRequest;
- (void)sendSessionPingRequest;
- (void)sendLogoutRequest;

@end
