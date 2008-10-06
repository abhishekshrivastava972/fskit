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
	NSString *name;
	NSString *fullName;
	NSString *email;
	NSString *phone;
	NSMutableArray *aliases;
	
	// postalAddress
	NSString *address1;
	NSString *address2;
	NSString *address3;
	NSString *address4;
	NSString *street1;
	NSString *street2;
	NSString *street3;
	NSString *city;
	NSString *province;
	NSString *country;
	NSString *postalCode;
}

- (NSString *)userId;
- (void)setUserId:(NSString *)value;

- (void)addAlias:(NSString *)value;


+ (FSKUser *)createFromXML:(NSXMLElement *)userElement;
- (id)initWithXML:(NSXMLElement *)userElement;

@end
