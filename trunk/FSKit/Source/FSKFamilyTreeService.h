//
//  FamilyTreeService.h
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKServiceBase.h"
#import "FSKConnection.h"


@interface FSKFamilyTreeService : FSKServiceBase {
}

+ (FSKFamilyTreeService *)familyTreeServiceWithConnection:(FSKConnection *)familySearchConnection delegate:theDelegate;

- (void)readPerson:(NSString *)personId;
- (void)readPersons:(NSSet *)personIds; // of NSString
- (void)searchByFullName:(NSString *)fullName;
- (void)searchByFamilyName:(NSString *)familyName givenNames:(NSString *)givenNames;
- (void)searchWithCriteria:(NSDictionary *)searchCriteria;


@end
