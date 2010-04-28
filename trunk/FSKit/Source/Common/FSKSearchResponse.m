//
//  FSKSearchResponse.m
//  FSKit
//
//  Created by Logan Allred on 3/9/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKSearchResponse.h"
#import "FSKSearchResult.h"

@implementation FSKSearchResponse

- (id)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]) != nil) 
	{ 
		_ft = [FSFAMILYTREEV2FamilyTree readXML:data];
		FSFAMILYTREEV2SearchResults *thesearchResults = [[_ft searches] objectAtIndex:0];
		totalCount = [thesearchResults count];
		closeMatchesCount = [thesearchResults close];
		partialMatchesCount = [thesearchResults partial];
		NSMutableArray *theResults = [[NSMutableArray array] retain];
		NSEnumerator *enumerator = [[thesearchResults results] objectEnumerator];
		FSFAMILYTREEV2SearchResult *searchElement;
		while (searchElement = [enumerator nextObject]) {
			[theResults addObject:[FSKSearchResult searchResultFromXML:searchElement]];
		}
		searchResults = [[NSArray arrayWithArray:theResults] retain];
		results = [searchResults mutableCopy];
	}
	
	return self;	
}

- (void)dealloc
{
	[searchResults release];
	[super dealloc];
}

- (NSArray *)searchResults
{
	return [[searchResults retain] autorelease];
}

- (NSArray *)closeMatches
{
	return [searchResults subarrayWithRange:NSMakeRange(0, MIN(closeMatchesCount, totalCount))];
}

- (NSArray *)partialMatches
{
	return [searchResults subarrayWithRange:NSMakeRange(closeMatchesCount, MIN(partialMatchesCount, totalCount)-closeMatchesCount)];;
}

- (int)totalPossibleMatches
{
    return partialMatchesCount;
}

- (int)totalCloseMatches
{
	return closeMatchesCount;
}

- (int)totalPartialMatches
{
	return partialMatchesCount - closeMatchesCount;
}

- (int)totalMatchesInRequest
{
	return totalCount;
}

- (int)partialMatchesInRequest {
    return MAX(totalCount - closeMatchesCount, 0);
}

- (int)closeMatchesInRequest {
    return MIN(closeMatchesCount, totalCount);
}

- (NSString *)contextId {
    return [[contextId retain] autorelease];
}

- (void)setContextId:(NSString *)value {
    if (contextId != value) {
        [contextId release];
        contextId = [value copy];
    }
}


@end
