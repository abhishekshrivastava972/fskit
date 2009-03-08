//
//  FamilyTreeService.h
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKServiceBase.h"
#import "FSKConnection.h"


@interface FSKPersonService : FSKServiceBase {
}

+ (FSKPersonService *)personServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;

- (void)readPerson:(NSString *)personId;
- (void)readPersons:(NSSet *)personIds; // of NSString
- (void)readUser:(NSString *)userId;
- (void)readUsers:(NSSet *)userIds; // of NSString
- (void)searchByFullName:(NSString *)fullName;
- (void)searchByFamilyName:(NSString *)familyName givenNames:(NSString *)givenNames;
- (void)searchWithCriteria:(NSDictionary *)searchCriteria;
- (void)readPedigree:(NSString *)personId ancestorGenerations:(int)ancestors descendantGenerations:(int)descendants;


@end
