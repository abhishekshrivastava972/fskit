//
//  FSKSearchResult.h
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKPersonSummary.h"

@interface FSKSearchResult : NSObject {
	NSNumber *score;
	NSString *refId;
	FSKPersonSummary *person;
	FSKPersonSummary *father;
	FSKPersonSummary *mother;
	NSArray *spouses; // of FSKPersonSummary
	NSArray *children; // of FSKPersonSummary
}

+ (id)searchResultFromXML:(NSXMLElement *)searchElement;
- (id)initWithXML:(NSXMLElement *)searchElement;


- (NSNumber *)score;
- (void)setScore:(NSNumber *)value;

- (NSString *)refId;
- (void)setRefId:(NSString *)value;

- (FSKPersonSummary *)person;
- (void)setPerson:(FSKPersonSummary *)value;

- (FSKPersonSummary *)father;
- (void)setFather:(FSKPersonSummary *)value;

- (FSKPersonSummary *)mother;
- (void)setMother:(FSKPersonSummary *)value;

- (NSArray *)spouses;
- (void)setSpouses:(NSArray *)value;

- (NSArray *)children;
- (void)setChildren:(NSArray *)value;



@end
