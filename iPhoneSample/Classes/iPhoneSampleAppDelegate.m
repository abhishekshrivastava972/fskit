//
//  iPhoneSampleAppDelegate.m
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright RedBugz Software 2008. All rights reserved.
//

#import "iPhoneSampleAppDelegate.h"
#import "AuthenticationController.h"

#define kFSK_DEVELOPER_KEY @"NNNN-NNNN-NNNN-NNNN-NNNN-NNNN-NNNN-NNNN"
static const NSString *CURRENT_SESSION_ID_KEY = @"com.googlecode.fskit.current_session_id";

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
//	[connection setSessionId:[[NSUserDefaults standardUserDefaults] stringForKey:CURRENT_SESSION_ID_KEY]];
	[connection addObserver:self
				 forKeyPath:@"sessionId"
				    options:(NSKeyValueObservingOptionNew)
					context:NULL];
	
	FSKIdentityService *identityService = [FSKIdentityService identityServiceWithConnection:connection delegate:self];
	[identityService fetchProperties];
	
//	[self request:nil didReceiveAuthenticationURL:nil];
	
//	[identityService login];
	
// use this code to save the sessionId to disk	
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	NSString *documentsDirectory = [paths objectAtIndex:0];
//	NSString *path = [documentsDirectory stringByAppendingPathComponent:@"patientList.plist"];
//	[myPatients writeToFile:path atomically:YES];
//	NSLog(@"array read %@", [NSArray arrayWithContentsOfFile:@"testarray.xml"]);
//	NSString *archivePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"SearchResults.archive"];
//NSLog(@"archive read %@", [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath]);
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
- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqual:@"sessionId"]) {
		NSString *sessId = [change objectForKey:NSKeyValueChangeNewKey];
		if (sessId)
		{
			[[NSUserDefaults standardUserDefaults] setObject:sessId forKey:CURRENT_SESSION_ID_KEY];
    }
    }
    // be sure to call the super implementation
    // if the superclass implements it
//    [super observeValueForKeyPath:keyPath
//						 ofObject:object
//						   change:change
//						  context:context];
}

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
