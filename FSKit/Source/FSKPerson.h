//
//  FSKPerson.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKPersonSummary.h"
#import "FSKPersonDetail.h"


@interface FSKPerson : NSObject {
	NSString *version;
	NSString *personId;
	
	FSKPersonSummary *summary;
	FSKPersonDetail *detail;
}

- (NSString *)fullName;

- (FSKPersonSummary *)summary;
//- (void)setSummary:(FSKPersonSummary *)value;

- (FSKPersonDetail *)detail;
//- (void)setDetail:(FSKPersonDetail *)value;


- (NSString *)personId;
- (void)setPersonId:(NSString *)value;



+ (FSKPerson *)createFromXML:(NSXMLElement *)personElement;
- (id)initWithXML:(NSXMLElement *)personElement;

@end
