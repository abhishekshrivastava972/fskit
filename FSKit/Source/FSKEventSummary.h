//
//  FSKEventSummary.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

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
@end
