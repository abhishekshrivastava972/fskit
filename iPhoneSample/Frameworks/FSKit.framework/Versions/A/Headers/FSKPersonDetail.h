//
//  FSKPersonDetail.h
//  FSKit
//
//  Created by Logan Allred on 8/4/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "enunciate_common.h"

@interface FSKPersonDetail : NSObject {
	NSArray *nameAssertions; // of FSKAssertion
	NSArray *genderAssertions; // of FSKAssertion
	NSArray *eventAssertions; // of FSKAssertion
	NSArray *characteristicAssertions; // of FSKAssertion
	NSArray *ordinanceAssertions; // of FSKAssertion
	NSArray *spouses; // of FSKPerson
	NSArray *children; // of FSKPerson
	NSArray *families; // of FSKFamily
}

+ (FSKPersonDetail *)createFromXML:(id <EnunciateXML>)personElement;
- (id)initWithXML:(id <EnunciateXML>)personElement;

@end
