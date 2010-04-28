//
//  iPhoneSampleAppDelegate.h
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright RedBugz Software 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSKit/FSKit.h>
#import <FSKit/FSKAuthenticationController.h>

@interface iPhoneSampleAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet UITabBarController *tabBarController;

	FSKConnection *connection;
	FSKAuthenticationController* authenticationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;

//- (IBAction)showSignInView:(id)sender;

@end
