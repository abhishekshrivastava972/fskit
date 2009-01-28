//
//  FirstViewController.m
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "FirstViewController.h"
#import "FSKit.h"
#import "TouchXML.h"

@implementation FirstViewController
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
	 [personService readPerson:@"me"];
	 
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
	personIdLabel.text = [[resp person] personId];
	nameLabel.text = [[resp person] fullName];
//	birthLabel.text = [[resp summary] birthdate];
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



@end
