//
//  FSKUtils.m
//  FSKit
//
//  Created by Logan Allred on 1/30/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKUtils.h"


@implementation FSKUtils

+ (NSDateFormatter *)ISO8601DateFormatter;
{
	static NSDateFormatter* sISO8601 = nil;
	if (!sISO8601) {
		sISO8601 = [[NSDateFormatter alloc] init];
		[sISO8601 setTimeStyle:NSDateFormatterFullStyle];
		[sISO8601 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
	}
	return sISO8601;
}

+ (NSDate *)dateFromISO8601String:(NSString *)str
{
	if ([str hasSuffix:@"Z"]) {
		str = [[str substringToIndex:(str.length-1)] stringByAppendingString:@"GMT"];
	}
	return [[FSKUtils ISO8601DateFormatter] dateFromString:str];
}


@end
