//
//  FSKPersonRepository.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRepositoryBase.h"

@class FSKPerson;

@interface FSKPersonRepository : FSKRepositoryBase {
	NSMutableDictionary *cache;
}
- (id)init;

- (FSKPerson *)personForId:(NSString *)personId;

@end
