//
//  FSKEventSummary.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>

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

+ (FSKEventSummary *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;

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
