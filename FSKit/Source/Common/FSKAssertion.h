//
//  FSKAssertion.h
//  FSKit
//
//  Created by Logan Allred on 8/16/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSKAssertion : NSObject {
	NSString *assertionId;
	NSString *tempId;
	NSString *submitter;
	NSString *version;
	BOOL disputing;
	BOOL modifiable;
	NSDate *modifiedDate;
	NSArray *citations; // of FSKCitation;
	NSArray *notes; // of FSKNote
	NSArray *associatedAssertions; // of FSK???
}

@end
