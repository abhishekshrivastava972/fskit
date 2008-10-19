//
//  iPhoneSampleAppDelegate.m
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "iPhoneSampleAppDelegate.h"
#import "AuthenticationController.h"

#define kFSK_DEVELOPER_KEY @"WCQY-7J1Q-GKVV-7DNM-SQ5M-9Q5H-JX3H-CMJK"

@implementation iPhoneSampleAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Add the tab bar controller's current view as a subview of the window
	[window addSubview:tabBarController.view];
	
	// Create a connection	
	connection  = [[FSKConnection sharedInstance] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	[connection setUserAgentString:@"FSKit iPhone Sample App/1.0" override:NO];
	[connection setDelegate:self];
	
}


/*
 Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
 Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
	[tabBarController release];
	[window release];
	[super dealloc];
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	[self showSignInView:self];
	
	NSString *username = @"api-user-1009";
	NSString *password = @"f8cc";
	[[challenge sender] useCredential:[NSURLCredential credentialWithUser:username password:password persistence:NSURLCredentialPersistenceForSession] forAuthenticationChallenge:challenge];
}

- (IBAction)showSignInView:(id)sender
{
	NSLog(@"%s", _cmd);
	if (!authenticationController)
	{
		authenticationController = [[[AuthenticationController alloc] initWithNibName:@"SignInView" bundle:nil] retain];
	}
	
	NSLog(@"%s %@", _cmd, self.tabBarController);
    [tabBarController presentModalViewController:authenticationController animated:YES];
}


@end

