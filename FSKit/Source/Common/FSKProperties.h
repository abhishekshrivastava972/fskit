//
//  FSKProperties.h
//  FSKit
//
//  Created by Logan Allred on 3/1/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKConnection.h"

@interface FSKProperties : NSObject {
	@private
	FSKConnection *connection;
	id delegate;
	NSString *endpoint;
}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
						   delegate:(id)aDelegate 
						   endpoint:(NSString *)anEndpoint;

- (NSString *)stringForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key withDefault:(NSString *)defaultValue;
- (BOOL)boolForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (NSURL *)URLForKey:(NSString *)key;
- (NSDate *)lastModified;
- (BOOL)hasProperties;
- (NSDictionary *)properties;

@end

@interface NSDictionary(CocoaDevUsersAdditions)

-(NSDictionary *)dictionaryBySettingObject:(id)object forKey:(id<NSCopying>)key;
-(NSDictionary *)dictionaryBySettingObjects:(NSArray *)someObjects forKeys:(NSArray *)keys;
-(NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary *)otherDictionary;

-(BOOL) boolForKey: (id) aKey;
-(NSInteger) integerForKey: (id) aKey;
-(BOOL) hasKey: (id) aKey;

-(NSArray *)allObjectsSortedByKeySelector:(SEL)sortSelector;

// Requires NSArrayCategory
//- (NSDictionary *)resultsOfMakeObjectsPerformSelector:(SEL)selector;
//- (NSDictionary *)resultsOfMakeObjectsPerformSelector:(SEL)selector withObject:(id)object;
@end
