//
//  FSKSearchResponse.h
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKResponse.h"
#import "familytree.h"

@interface FSKSearchResponse : FSKResponse {
	int totalCount;
	int partialMatchesCount;
	int closeMatchesCount;
	NSString *contextId;
	NSArray *searchResults; // of FSKSearchResult
	
	@private
	FSFAMILYTREEV2FamilyTree *_ft;
}

- (id)initWithData:(NSData *)data;

- (int)totalPossibleMatches;
- (int)totalCloseMatches;
- (int)totalPartialMatches;
- (int)totalMatchesInRequest;
- (int)partialMatchesInRequest;
- (int)closeMatchesInRequest;
- (NSString *)contextId;

- (NSArray *)searchResults;
- (NSArray *)closeMatches;
- (NSArray *)partialMatches;

@end
