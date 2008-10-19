//
//  iPhoneSampleAppDelegate.h
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSKit.h"
#import "AuthenticationController.h"

@interface iPhoneSampleAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet UITabBarController *tabBarController;

	FSKConnection *connection;
	AuthenticationController* authenticationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;

- (IBAction)showSignInView:(id)sender;

@end
