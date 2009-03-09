//
//  FSKUser.h
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKContributor.h"

@interface FSKUser : FSKContributor {
	NSString *preferredName;
	NSString *accessNumber;
	NSArray *permissions; // of NSString?
	NSDictionary *preferences;
}

- (NSString *)userId;
- (void)setUserId:(NSString *)value;

- (void)addAlias:(NSString *)value;


+ (FSKUser *)createFromXML:(NSXMLElement *)userElement;
- (id)initWithXML:(NSXMLElement *)userElement;

@end
