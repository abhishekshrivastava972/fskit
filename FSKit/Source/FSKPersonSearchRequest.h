//
//  FSKPersonSearchRequest.h
//  FSKit
//
//  Created by Demo Account on 3/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
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

- (FSKSearchResponse *)responseWithXML:(NSXMLDocument *)xmlDoc;

@end
