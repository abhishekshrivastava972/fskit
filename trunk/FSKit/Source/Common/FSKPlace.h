//
//  FSKPlace.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSKPlace : NSObject {
	NSString *original;
	NSString *normalizedPlaceName;
	NSString *normalizedPlaceId;
}

+ (FSKPlace *)createFromXML:(NSXMLElement *)dateElement;
- (id)initWithXML:(NSXMLElement *)dateElement;

- (NSString *)displayString;

- (NSString *)original;
- (void)setOriginal:(NSString *)value;

- (NSString *)normalizedPlaceName;
- (void)setNormalizedPlaceName:(NSString *)value;

- (NSString *)normalizedPlaceId;
- (void)setNormalizedPlaceId:(NSString *)value;


@end
