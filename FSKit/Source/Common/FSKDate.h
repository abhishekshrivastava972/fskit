//
//  FSKDate.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSKDate : NSObject {
	NSString *original;
	NSString *normalized;
	NSString *earliestAstro;
	NSString *latestAstro;
}

+ (FSKDate *)createFromXML:(NSXMLElement *)dateElement;
- (id)initWithXML:(NSXMLElement *)dateElement;

- (NSString *)displayString;

- (NSString *)original;
- (void)setOriginal:(NSString *)value;

- (NSString *)normalized;
- (void)setNormalized:(NSString *)value;

- (NSString *)earliestAstro;
- (void)setEarliestAstro:(NSString *)value;

- (NSString *)latestAstro;
- (void)setLatestAstro:(NSString *)value;


@end
