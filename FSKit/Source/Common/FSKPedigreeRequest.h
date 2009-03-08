//
//  FSKPedigreeRequest.h
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRequest.h"

@interface FSKPedigreeRequest : FSKRequest {
	int ancestorGenerations;
	int descendantGenerations;
}

+ (void)fetchPedigreeForId:(NSString *)personId
				     ancestors:(int)ancestors
				   descendants:(int)descendants
					connection:aFamilySearchConnection 
					  delegate:(id)aDelegate 
					  selector:(SEL)aSelector;

- (void)sendPedigreeRequestWithId:(NSString *)personId
						ancestors:(int)ancestors
					  descendants:(int)descendants;

@end
