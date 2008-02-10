//
//  FSConnectionTest.h
//  FSKit
//
//  Created by Logan Allred on 10/14/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <FSKit/FSKConnection.h>


@interface FSKConnectionTest : SenTestCase {
	FSKConnection* testConnection;
}

- (void)testUnauthenticatedConnection;

@end
