//
//  FSKRepositoryBase.h
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSKConnection;

@interface FSKRepository : NSObject {
	NSMutableDictionary *cache;
	NSString *repositoryIdentifier;
}

- (id)initWithIdentifier:(NSString *)identifier;

- (id)objectForId:(NSString *)key;
- (void)addObject:(id)object withId:(NSString *)objectId;

- (int)count;
- (NSArray *)allObjects;
- (NSArray *)allKeys;

@end
