//
//  FSKIdentityResponse.h
//  FSKit
//
//  Created by Logan Allred on 1/27/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKResponse.h"
#import "identity.h"

@interface FSKIdentityResponse : FSKResponse
{
	NSString *sessionId;
	
	@private
	FSIDENTITYV2AIdentity *xmlDocument;
}

- (id)initWithData:(NSData *)data;
- (FSIDENTITYV2AIdentity *)xmlDocument;


- (NSString *)sessionId;

@end
