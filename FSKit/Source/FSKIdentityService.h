//
//  FSKIdentityService.h
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKServiceBase.h"
#import "FSKConnection.h"
#import "FSKIdentityRequest.h"


@interface FSKIdentityService : FSKServiceBase {
}

+ (FSKIdentityService *)identityServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;
- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

/*!
    @method     login
    @abstract   (brief description)
    @discussion (comprehensive description)
*/
- (void)login;
- (void)loginWithCredential:(NSURLCredential *)credential;
- (void)logout;

@end
