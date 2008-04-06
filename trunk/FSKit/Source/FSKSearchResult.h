//
//  FSKSearchResult.h
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKPersonSummary.h"

@interface FSKSearchResult : NSObject {
	NSNumber *score;
	int score2;
	NSString *refId;
	FSKPersonSummary *person;
	FSKPersonSummary *father;
	FSKPersonSummary *mother;
	NSArray *spouses; // of FSKPersonSummary
	NSArray *children; // of FSKPersonSummary
}

+ (id)searchResultFromXML:(NSXMLElement *)searchElement;
- (id)initWithXML:(NSXMLElement *)searchElement;


@end
