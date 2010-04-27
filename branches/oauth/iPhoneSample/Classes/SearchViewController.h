//
//  SearchViewController.h
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright RedBugz Software 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSKSearchResponse, SearchResultDetailController;

@interface SearchViewController : UIViewController {
	IBOutlet UISearchBar *searchBar;
	IBOutlet UITableView *resultsTable;
	IBOutlet SearchResultDetailController *detailController;
	
	FSKSearchResponse *response;
}

- (IBAction)cancel:(id)sender;
- (IBAction)search:(id)sender;

@end
