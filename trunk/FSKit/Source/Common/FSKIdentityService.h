//
//  FSKIdentityService.h
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKServiceBase.h"
#import "FSKConnection.h"
#import "FSKIdentityRequest.h"
#import "FSKProperties.h"
#import "FSKUserProfile.h"

/*!
    @brief    <#(brief description)#>
    @details  <#(comprehensive description)#>
*/

@interface FSKIdentityService : FSKServiceBase {
	FSKProperties *identityProperties;
}

+ (FSKIdentityService *)identityServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;
- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

/*!
    @brief   (brief description)
    @details (comprehensive description)
*/
- (void)login;
- (void)loginWithCredential:(NSURLCredential *)credential;
- (void)logout;
- (void)pingSession;
- (NSArray *)permissions;
- (FSKUserProfile *)profile;
- (FSKProperties *)identityProperties;

@end
