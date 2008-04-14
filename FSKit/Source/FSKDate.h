//
//  FSKDate.h
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKDate : NSObject {
	NSString *original;
	NSString *normalized;
	NSString *earliestAstro;
	NSString *latestAstro;
}

+ (FSKDate *)createFromXML:(NSXMLElement *)dateElement;
- (id)initWithXML:(NSXMLElement *)dateElement;

@end
