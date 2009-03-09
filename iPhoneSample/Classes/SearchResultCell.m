//
//  SearchResultCell.m
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SearchResultCell.h"
#import "FSKSearchResult.h"
#import "SearchResultView.h"

@implementation SearchResultCell

@synthesize searchResultView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
		// Create a time zone view and add it as a subview of self's contentView.
		CGRect tzvFrame = CGRectMake(0.0, 0.0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
		searchResultView = [[SearchResultView alloc] initWithFrame:tzvFrame];
		searchResultView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self.contentView addSubview:searchResultView];
	}
	return self;
}


- (void)setSearchResult:(FSKSearchResult *)newSearchResult {
	// Pass the time zone wrapper to the view
	searchResultView.searchResult = newSearchResult;
}


- (void)dealloc {
    [super dealloc];
}


@end
