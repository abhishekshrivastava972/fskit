//
//  FSKSearchResponse.h
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKResponse.h"

@interface FSKSearchResponse : FSKResponse {
	int totalCount;
	int partialMatchesCount;
	int closeMatchesCount;
	NSArray *searchResults; // of FSKSearchResult
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;

- (NSArray *)searchResults;
- (NSArray *)closeMatches;
- (NSArray *)partialMatches;

@end
