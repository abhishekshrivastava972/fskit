//
//  SearchResultDetailController.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSKSearchResult;

@interface SearchResultDetailController : UIViewController {
	IBOutlet UILabel *idText;
	IBOutlet UILabel *birthText;
	IBOutlet UILabel *nameText;
	IBOutlet UILabel *starsText;
}

- (void) setSearchResult:(FSKSearchResult *)searchResult;

@end
