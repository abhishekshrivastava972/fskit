//
//  FSKUserProfile.h
//  FSKit
//
//  Created by Logan Allred on 2/8/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "identity.h"

@interface FSKUserProfile : NSObject {
	NSString *userId;
	NSString *displayName;
	NSString *email;
}

- (NSString *)userId;
- (void)setUserId:(NSString *)value;

- (NSString *)displayName;
- (NSString *)email;

//- (void)addAlias:(NSString *)value;


+ (FSKUserProfile *)createFromXML:(FSIDENTITYV2AUser *)userElement;
- (id)initWithXML:(FSIDENTITYV2AUser *)userElement;

@end