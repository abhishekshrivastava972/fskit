//
//  TreeViewController.m
//  iPhoneSample
//
//  Created by Logan Allred on 3/2/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "TreeViewController.h"
#import <FSKit/FSKit.h>
#import "TreeView.h"

@implementation TreeViewController

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

- (IBAction)signin:(id)sender;
{
	[identityService login];
}

- (IBAction)signout:(id)sender;
{
	[[FSKConnection sharedConnection] signOut];
	[identityService logout];
}	

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
 // Make a request
	 identityService = [[FSKIdentityService identityServiceWithConnection:[FSKConnection sharedConnection] delegate:self] retain];
//	 [identityService login];
 
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
didReturnResponse:(FSKResponse *)response
{
	NSLog(@"%s", _cmd);
	if ([response isKindOfClass:[FSKPersonResponse class]])
	{
		FSKPersonResponse *resp = (FSKPersonResponse *)response;
		[self setPerson:[resp person]];
	}
}
- (void)request:(FSKRequest *)request 
didFailWithError:(FSKError *)error
{
	NSLog(@"%s", _cmd);
}

- (void)setPerson:(FSKPerson *)person
{
	if ([person personId]) {
	personIdLabel.text = [person personId];
	}
	nameLabel.text = [person fullName];
//	birthLabel.text = [[resp summary] birthdate];
	[treeView setRootPerson:person];
	[treeView setNeedsDisplay];
	
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


@end
