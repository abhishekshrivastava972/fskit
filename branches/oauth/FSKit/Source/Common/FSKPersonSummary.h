//
//  FSKPersonSummary.h
//  FSKit
//
//  Created by Logan Allred on 3/10/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "familytree.h"

@class FSKEventSummary, FSKCouple;

@interface FSKPersonSummary : NSObject {
	NSString *personId;
	NSString *name;
	NSString *gender;
	NSString *birthdate;
	
	NSString *minBirthYear;
	NSString *maxDeathYear;
	
	FSKEventSummary *birthEvent;
	FSKEventSummary *christeningEvent;
	FSKEventSummary *deathEvent;
	FSKEventSummary *burialEvent;
	
	FSKEventSummary *marriageEvent;
	
	FSKPersonSummary *spouse;
	BOOL hasAdditionalSpouses;
	
	FSKCouple *parents;
	BOOL hasAdditionalParents;
	
	NSArray *children;
	BOOL hasAdditionalChildren;
}

+ (FSKPersonSummary *)createFromXML:(FSFAMILYTREEV2Person *)personElement;
- (id)initWithXML:(FSFAMILYTREEV2Person *)personElement;

- (NSString *)lifespanString;

- (NSString *)name;
- (void)setName:(NSString *)value;

- (NSString *)gender;
- (void)setGender:(NSString *)value;

- (NSString *)birthdate;
- (void)setBirthdate:(NSString *)value;

- (FSKEventSummary *)birthEvent;
- (void)setBirthEvent:(FSKEventSummary *)value;

- (FSKEventSummary *)christeningEvent;
- (void)setChristeningEvent:(FSKEventSummary *)value;

- (FSKEventSummary *)deathEvent;
- (void)setDeathEvent:(FSKEventSummary *)value;

- (FSKEventSummary *)burialEvent;
- (void)setBurialEvent:(FSKEventSummary *)value;

- (FSKEventSummary *)marriageEvent;
- (void)setMarriageEvent:(FSKEventSummary *)value;

- (FSKPersonSummary *)spouse;
- (void)setSpouse:(FSKPersonSummary *)value;

- (BOOL)hasAdditionalSpouses;
- (void)setHasAdditionalSpouses:(BOOL)value;

- (FSKCouple *)parents;
- (void)setParents:(FSKCouple *)value;

- (BOOL)hasAdditionalParents;
- (void)setHasAdditionalParents:(BOOL)value;

- (NSArray *)children;
- (void)setChildren:(NSArray *)value;

- (BOOL)hasAdditionalChildren;
- (void)setHasAdditionalChildren:(BOOL)value;



@end
