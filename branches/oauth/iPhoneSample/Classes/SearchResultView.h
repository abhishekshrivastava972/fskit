//
//  SearchResultView.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/9/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSKSearchResult;

@interface SearchResultView : UIView {
	FSKSearchResult *searchResult;
	NSDateFormatter *dateFormatter;
	NSString *abbreviation;
	BOOL highlighted;
	BOOL editing;
}

@property (nonatomic, retain) FSKSearchResult *searchResult;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSString *abbreviation;
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, getter=isEditing) BOOL editing;

@end
