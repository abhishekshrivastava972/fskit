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
	connection  = [[FSKConnection sharedConnection] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	[connection setUserAgentString:@"FSKit iPhone Sample App/1.0" override:NO];
	[connection setDelegate:self];
	
// use this code to save the sessionId to disk	
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	NSString *documentsDirectory = [paths objectAtIndex:0];
//	NSString *path = [documentsDirectory stringByAppendingPathComponent:@"patientList.plist"];
//	[myPatients writeToFile:path atomically:YES];
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
	[authenticationController release];
	[tabBarController release];
	[window release];
	[super dealloc];
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if (!authenticationController || YES)
	{
		authenticationController = [[AuthenticationController alloc] initWithNibName:@"SignInView" bundle:nil];
	}
	
	NSLog(@"%s %@", _cmd, self.tabBarController);
	authenticationController.challenge = challenge;
	NSLog(@"%s %@", _cmd, self.tabBarController.modalViewController);
//	int i=0;
//	while(i < 1000 && self.tabBarController.modalViewController != nil) {
//		NSLog(@"%s %d %@", _cmd, i, self.tabBarController.modalViewController);
//		[self.tabBarController dismissModalViewControllerAnimated:NO];
//		i++;
//	}
	if (self.tabBarController.modalViewController == nil)
	{
    [tabBarController presentModalViewController:authenticationController animated:YES];
	}else
	{
		[tabBarController dismissModalViewControllerAnimated:YES];
	}
}

@end

