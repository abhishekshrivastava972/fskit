//
//  FSKUser.h
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKContributor.h"

@interface FSKUser : FSKContributor {
	NSString *name;
	NSString *fullName;
	NSString *email;
	NSString *phone;
	NSArray *aliases;
	
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

@end
