//
//  FSKPedigree.h
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKPerson.h"
#import "FSKFamily.h"

@interface FSKPedigree : NSObject {
	FSKPerson *rootPerson;
	FSKFamily *rootFamily;
	int descendantGenerations;
	int ancestorGenerations;
}

- (FSKPerson *)rootPerson;
- (void)setRootPerson:(FSKPerson *)value;

- (FSKFamily *)rootFamily;
- (void)setRootFamily:(FSKFamily *)value;

- (int)descendantGenerations;
- (void)setDescendantGenerations:(int)value;

- (int)ancestorGenerations;
- (void)setAncestorGenerations:(int)value;


-(int)span;

@end
