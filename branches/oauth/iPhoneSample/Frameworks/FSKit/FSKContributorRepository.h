//
//  FSKUserRepository.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRepository.h"
#import "FSKConnection.h"
#import "FSKContributor.h"
#import "FSKPersonService.h"

@interface FSKContributorRepository : NSObject {
	FSKRepository *repository;
	FSKConnection *connection;
	FSKPersonService *personService;
}

+ (FSKContributorRepository*)instanceWithConnection:(FSKConnection *)aConnection;

- (id)initWithConnection:(FSKConnection *)aConnection;

- (FSKContributor *)contributorForId:(NSString *)contributorId;

@end
