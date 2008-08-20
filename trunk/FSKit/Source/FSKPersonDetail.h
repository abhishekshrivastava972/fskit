//
//  FSKPersonDetail.h
//  FSKit
//
//  Created by Logan Allred on 8/4/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKPersonDetail : NSObject {
	NSArray *assertions; // of FSKAssertion
	NSArray *spouses;
	NSArray *children;
	NSArray *families;
}

@end
