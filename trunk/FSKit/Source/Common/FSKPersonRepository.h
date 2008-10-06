//
//  FSKPersonRepository.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSKPerson;

@interface FSKPersonRepository : NSObject {
	NSMutableDictionary *cache;
}
- (id)init;

- (FSKPerson *)personForId:(NSString *)personId;

@end
