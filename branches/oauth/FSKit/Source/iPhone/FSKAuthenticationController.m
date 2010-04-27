//
//  AuthenticationController.m
//  iPhoneSample
//
//  Created by Logan Allred on 10/4/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKAuthenticationController.h"

@implementation FSKAuthenticationController

- (IBAction)cancel:(id)sender 
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, self.parentViewController);

	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)authenticate:(id)sender 
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	[delegate performSelector:@selector(authenticate) withObject:nil afterDelay:0.1];

	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
		//self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	}
	return self;
}

- (id)initWithDelegate:(id)theDelegate 
{
	if (self = [self initWithNibName:@"FSKAuthenticationView" bundle:nil]) {
		// Initialization code
		delegate = theDelegate;
	}
	return self;
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

// If you need to do additional setup after loading the view, override viewDidLoad.
/*
 - (void)viewDidLoad {
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return YES;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}

- (void)setDelegate:(id)theDelegate;
{
	NSLog(@"%s delegate:%@", __PRETTY_FUNCTION__, theDelegate);
	delegate = theDelegate;
}

@end
