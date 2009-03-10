//
//  FSKRepositoryBase.h
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSKConnection;

@interface FSKRepositoryBase : NSObject {
	FSKConnection *connection;
	NSMutableDictionary *cache;
}

- (id)initWithConnection:(FSKConnection *)aConnection;

- (id)objectForId:(NSString *)key;

- (int)count;

@end
