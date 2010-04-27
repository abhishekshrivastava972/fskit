//
//  FSKPersonRepository.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRepository.h"

@class FSKPerson, FSKRepository, FSKConnection, FSKPersonService;

@interface FSKPersonRepository : NSObject {
	FSKPersonRepository *sharedInstance;
	FSKRepository *repository;
	FSKConnection *connection;
	FSKPersonService *personService;
}

+ (FSKPersonRepository*)instanceWithConnection:(FSKConnection *)aConnection;

- (id)initWithConnection:(FSKConnection *)aConnection;

- (int)count;

- (NSArray *)allPersons;
- (NSArray *)allIds;

- (FSKPerson *)personForId:(NSString *)personId;

@end
