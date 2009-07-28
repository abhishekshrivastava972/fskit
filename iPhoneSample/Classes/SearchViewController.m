//
//  FirstViewController.m
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "SearchViewController.h"
#import "FSKit.h"
#import "SearchResultCell.h"

#define kFSK_DEVELOPER_KEY @"WCQY-7J1Q-GKVV-7DNM-SQ5M-9Q5H-JX3H-CMJK"

@implementation SearchViewController
enum Sections {
    kHeaderSection = 0,
    kTitleSection,
    kAuthorSection,
    kBodySection,
    NUM_SECTIONS
};

enum HeaderSectionRows {
    kHeaderSectionCopyrightRow = 0,
    kHeaderSectionPublisherRow,
    NUM_HEADER_SECTION_ROWS
};

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)theSearchBar
{
	[searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
	[searchBar resignFirstResponder];
	[self search:searchBar];
}

- (IBAction)cancel:(id)sender
{
	
}

- (IBAction)search:(id)sender
{
	FSKConnection *connection  = [[FSKConnection sharedConnection] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	[connection setUserAgentString:@"iPhoneSample/1.0" override:NO];
	
	FSKPersonService *personService = [[FSKPersonService personServiceWithConnection:connection delegate:self] retain];
	[personService searchByFullName:[searchBar text]];
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
 - (void)loadView {
 }
 */

// If you need to do additional setup after loading the view, override viewDidLoad.      
 - (void)viewDidLoad {                                                                 
	 
	 // Make a request
//	 FSKIdentityService *identityService = [[FSKIdentityService identityServiceWithConnection:connection delegate:self] retain];
//	 [identityService loginWithCredential:[NSURLCredential credentialWithUser:@"api-user-1009" password:@"f8cc" persistence:NSURLCredentialPersistenceForSession]];
	  
	 FSKPersonService *personService = [[FSKPersonService
										 personServiceWithConnection:[FSKConnection sharedConnection] 
										 delegate:self] retain];
	 [personService readPerson:@""];
	 
//	 [FSKPersonSearchRequest 
//	  fetchSearchResultsWithCriteria:nil connection:connection 
//	  delegate:self 
//	  selector:@selector(request:didReturnResponse:)];
	 //Handle the response by overriding these 2 methods in your delegate
 }                                                                                     
- (void)request:(FSKRequest *)request 
didReturnResponse:(FSKResponse *)theResponse
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if ([theResponse isKindOfClass:[FSKSearchResponse class]])
	{
		response = (FSKSearchResponse *)[theResponse retain];
		[resultsTable reloadData];
	}
}
- (void)request:(FSKRequest *)request 
didFailWithError:(FSKError *)error
{
	NSLog(@"%s", _cmd);
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *title;
	switch (section) {
		case 0:
			title = [NSString stringWithFormat:@"Close Matches (%d)", [response totalCloseMatches]];
			break;
		 case 1:
			title = [NSString stringWithFormat:@"Partial Matches (%d)", [response totalPartialMatches]];
			break;
	}
	return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger rows = 0;
	switch (section) {
		case 0:
			rows = [response totalCloseMatches];
			break;
		case 1:
			rows = [response totalPartialMatches];
			break;
	}
	return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	#define ROW_HEIGHT 70

	static NSString *CellIdentifier = @"SearchResultCell";
	
	SearchResultCell *searchResultCell = (SearchResultCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (searchResultCell == nil) {
		CGRect startingRect = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
		searchResultCell = [[[SearchResultCell alloc] initWithFrame:startingRect reuseIdentifier:CellIdentifier] autorelease];
	}
		
	// Get the time zone wrapper for the row
	[searchResultCell setSearchResult:[[response searchResults] objectAtIndex:indexPath.row]];
	return searchResultCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[detailController setSearchResult:[[response searchResults] objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:detailController animated:YES];
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}
@end
