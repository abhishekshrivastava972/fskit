//
//  FSKUtils.h
//  FSKit
//
//  Created by Logan Allred on 1/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKUtils : NSObject {

}

+ (NSDateFormatter *)ISO8601DateFormatter;
+ (NSDate *)dateFromISO8601String:(NSString *)str;

@end
