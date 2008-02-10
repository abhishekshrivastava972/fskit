//
//  FSConnectionTest.m
//  FSKit
//
//  Created by Logan Allred on 10/14/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKConnectionTest.h"


@implementation FSKConnectionTest

- (void)testUnauthenticatedConnection
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [testConnection credential]);
    STAssertNil([testConnection credential], @"credential not nil");
	
}





- (void) setUp
{
    // Create data structures here.
	testConnection = [[FSKConnection alloc] init];
}

- (void) tearDown
{
    // Release data structures here.
	[testConnection release];
}

@end
