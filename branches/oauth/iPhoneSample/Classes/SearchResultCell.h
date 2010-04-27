//
//  SearchResultCell.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSKSearchResult, StarRatingView, SearchResultView;

@interface SearchResultCell : UITableViewCell {
	IBOutlet StarRatingView *starRatingView;
	IBOutlet UILabel *nameLabel;
	
	SearchResultView *searchResultView;
}

- (void)setSearchResult:(FSKSearchResult *)newSearchResult;
@property (nonatomic, retain) SearchResultView *searchResultView;

@end
