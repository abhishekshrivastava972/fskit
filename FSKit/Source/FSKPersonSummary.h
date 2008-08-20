//
//  FSKPersonSummary.h
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class FSKEventSummary, FSKCouple;

@interface FSKPersonSummary : NSObject {
	NSString *name;
	NSString *gender;
	NSString *birthdate;
	
	FSKEventSummary *birthEvent;
	FSKEventSummary *christeningEvent;
	FSKEventSummary *deathEvent;
	FSKEventSummary *burialEvent;
	
	FSKEventSummary *marriageEvent;
	
	FSKPersonSummary *spouse;
	bool hasAdditionalSpouses;
	
	FSKCouple *parents;
	bool hasAdditionalParents;
	
	NSArray *children;
	bool hasAdditionalChildren;
}

+ (FSKPersonSummary *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;
@end
