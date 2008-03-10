//
//  FSKSearchResult.h
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKSearchResult : NSObject {
	NSNumber *score;
//	FSKPersonSummary *person;
//	FSKPersonSummary *father;
//	FSKPersonSummary *mother;
	NSArray *spouses; // of FSKPersonSummary
	NSArray *children; // of FSKPersonSummary
}

@end
