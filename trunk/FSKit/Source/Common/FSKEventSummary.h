//
//  FSKEventSummary.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "enunciate_common.h"

@class FSKDate, FSKPlace;

@interface FSKEventSummary : NSObject {
	FSKDate *date;
	FSKPlace *place;
	NSString *assertionId;
	NSString *contributor;
	NSString *modified;
	NSString *scope;
	NSString *type;
}

+ (FSKEventSummary *)createFromXML:(id <EnunciateXML>)personElement;
- (id)initWithXML:(id <EnunciateXML>)personElement;

- (FSKDate *)date;
- (void)setDate:(FSKDate *)value;

- (FSKPlace *)place;
- (void)setPlace:(FSKPlace *)value;

- (NSString *)assertionId;
- (void)setAssertionId:(NSString *)value;

- (NSString *)contributor;
- (void)setContributor:(NSString *)value;

- (NSString *)modified;
- (void)setModified:(NSString *)value;

- (NSString *)scope;
- (void)setScope:(NSString *)value;

- (NSString *)type;
- (void)setType:(NSString *)value;


@end
