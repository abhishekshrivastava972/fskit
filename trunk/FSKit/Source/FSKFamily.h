//
//  FSKFamily.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKCouple.h"

@interface FSKFamily : NSObject {
	FSKCouple *parents;
	NSMutableArray *children;
}

@end
