//
//  FSKContributor.h
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "enunciate_common.h"

@interface FSKContributor : NSObject {
	NSString *contributorId;
	NSString *contactName;
	NSString *fullName;
	NSString *email;
	NSString *phone;

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

	NSMutableArray *aliases;
	
}

- (NSString *)contributorId;


+ (FSKContributor *)createFromXML:(id <EnunciateXML>)userElement;
- (id)initWithXML:(id <EnunciateXML>)userElement;

@end
