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
	NSArray *parents;
	NSArray *spouses;
	NSArray *children;
}

@end
