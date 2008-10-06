//
//  FSKUserRepository.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKConnection.h"
#import "FSKUser.h"

@interface FSKUserRepository : NSObject {
	FSKConnection *connection;
	NSMutableDictionary *cache;
}

+ (FSKUserRepository*)instanceWithConnection:(FSKConnection *)aConnection;

- (id)initWithConnection:(FSKConnection *)aConnection;

- (FSKUser *)userForId:(NSString *)userId;

@end