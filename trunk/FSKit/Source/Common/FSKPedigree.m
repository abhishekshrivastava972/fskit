//
//  FSKPedigree.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "FSKPedigree.h"


@implementation FSKPedigree

- (FSKPerson *)rootPerson {
    return [[rootPerson retain] autorelease];
}

- (void)setRootPerson:(FSKPerson *)value {
    if (rootPerson != value) {
        [rootPerson release];
        rootPerson = [value copy];
    }
}

- (FSKFamily *)rootFamily {
    return [[rootFamily retain] autorelease];
}

- (void)setRootFamily:(FSKFamily *)value {
    if (rootFamily != value) {
        [rootFamily release];
        rootFamily = [value copy];
    }
}

- (int)descendantGenerations {
    return descendantGenerations;
}

- (void)setDescendantGenerations:(int)value {
    if (descendantGenerations != value) {
        descendantGenerations = value;
    }
}

- (int)ancestorGenerations {
    return ancestorGenerations;
}

- (void)setAncestorGenerations:(int)value {
    if (ancestorGenerations != value) {
        ancestorGenerations = value;
    }
}

- (int)span
{
	return ancestorGenerations + descendantGenerations;
}

@end
