//
//  AuthenticationController.m
//  iPhoneSample
//
//  Created by Logan Allred on 10/4/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "AuthenticationController.h"

@implementation AuthenticationController

@synthesize challenge;

- (IBAction)cancel:(id)sender 
{
	NSLog(@"%s %@", _cmd, self.parentViewController);

	[challenge.sender cancelAuthenticationChallenge:challenge];
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)authenticate:(id)sender 
{
	NSURLCredential *credential = [NSURLCredential credentialWithUser:usernameField.text password:passwordField.text persistence:NSURLCredentialPersistenceForSession];
	[self.parentViewController dismissModalViewControllerAnimated:YES];	

	[self performSelector:@selector(sendCredential:) withObject:credential afterDelay:0.5];
}

- (void)sendCredential:(NSURLCredential *)credential
{
	[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
		self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	}
	return self;
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

// If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad {
	[usernameField becomeFirstResponder];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	if (theTextField == usernameField)
	{
		[passwordField becomeFirstResponder];
	}
	if(theTextField == passwordField)
	{
		[self authenticate:self];
	}
	return YES;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}

@end
