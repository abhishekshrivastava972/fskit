//
//  FSKPerson.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKPersonSummary.h"
#import "FSKPersonDetail.h"


@interface FSKPerson : NSObject {
	NSString *version;
	NSString *personId;
	
	BOOL living;
	BOOL modifiable;
	NSDate *modified;
	BOOL multipleFamiliesAsChild;
	BOOL multipleFamiliesAsParent;
	
	FSKPersonSummary *summary;
	FSKPersonDetail *detail;
}

- (NSString *)fullName;
- (NSString *)gender;
- (FSKEventSummary *)birthEvent;
- (FSKEventSummary *)deathEvent;

- (FSKPersonSummary *)summary;
//- (void)setSummary:(FSKPersonSummary *)value;

- (FSKPersonDetail *)detail;
//- (void)setDetail:(FSKPersonDetail *)value;


- (NSString *)personId;
- (void)setPersonId:(NSString *)value;



+ (FSKPerson *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;

@end
