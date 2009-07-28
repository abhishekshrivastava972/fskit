//
//  SearchResultDetailController.m
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SearchResultDetailController.h"
#import "FSKSearchResult.h"

@implementation SearchResultDetailController

- (void) setSearchResult:(FSKSearchResult *)searchResult
{
	[idText setText:[searchResult refId]];
	[nameText setText:[[searchResult person] name]];
	[birthText setText:[[searchResult person] birthdate]];
	[starsText setText:[[searchResult score] stringValue]]; 
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
