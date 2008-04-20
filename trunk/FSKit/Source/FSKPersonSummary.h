//
//  FSKPersonSummary.h
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class FSKEventSummary;

@interface FSKPersonSummary : NSObject {
	NSString *personId;
	NSString *name;
	NSString *gender;
	NSString *birthdate;
	
	FSKEventSummary *birthEvent;
	FSKEventSummary *christeningEvent;
	FSKEventSummary *deathEvent;
	FSKEventSummary *burialEvent;
}

+ (FSKPersonSummary *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;
@end
