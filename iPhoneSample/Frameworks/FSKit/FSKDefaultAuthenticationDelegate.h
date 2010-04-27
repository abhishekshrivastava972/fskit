//
//  FSKDefaultAuthenticationDelegate.h
//  FSKit
//
//  Created by Logan Allred on 3/29/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKDefaultAuthenticationDelegateBase.h"

@class FSKIdentityRequest, FSKIdentityResponse, FSKOAuthVerifierHandler;

@interface FSKDefaultAuthenticationDelegate : FSKDefaultAuthenticationDelegateBase {
}


- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request;

//- (void)request:(FSKIdentityRequest *)request didReturnResponse:(FSKIdentityResponse *)response;

@end
