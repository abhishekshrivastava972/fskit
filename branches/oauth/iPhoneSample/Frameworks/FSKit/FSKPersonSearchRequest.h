//
//  FSKPersonSearchRequest.h
//  FSKit
//
//  Created by Logan Allred on 3/12/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKRequest.h"
#import "FSKSearchResponse.h"

@interface FSKPersonSearchRequest : FSKRequest {

}

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							selector:(SEL)aSelector;

+ (void)fetchSearchResultsWithCriteria:(NSDictionary *)parameters 
			   connection:aFamilySearchConnection 
				 delegate:(id)aDelegate 
				 selector:(SEL)aSelector;

- (void)sendSearchRequestWithCriteria:(NSDictionary *)parameters;

- (FSKSearchResponse *)responseWithData:(NSData *)data;

@end
