//
//  FSKDefaultMobileAuthenticationDelegate.h
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSKDefaultAuthenticationDelegateBase.h"
#import "FSKConnection.h"
#import "FSKOAuthHandler.h"

@interface FSKDefaultMobileAuthenticationDelegate : FSKDefaultAuthenticationDelegateBase {
}

- (id)initWithConnection:(FSKConnection *)aConnection;

- (void)request:(FSKRequest *)request didReceiveAuthenticationURL:(NSURL *)url; 

- (UIViewController *)controllerForAuthenticationView:(FSKRequest *)request;


@end
