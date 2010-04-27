//
//  FSKOAuthCustomURLHandler.h
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKOAuthHandler.h"

@interface FSKOAuthCustomURLHandler : NSObject <FSKOAuthVerifierHandler> {
	NSString *oauthVerifier;
	id delegate;
}

- (id) initWithDelegate:(id)theDelegate;

@end
