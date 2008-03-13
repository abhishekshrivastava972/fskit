//
//  FSKPersonSummary.h
//  FSKit
//
//  Created by Demo Account on 3/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FSKPersonSummary : NSObject {
	NSString *personId;
	NSString *name;
	NSString *gender;
	NSString *birthdate;
}

+ (FSKPersonSummary *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;
@end
