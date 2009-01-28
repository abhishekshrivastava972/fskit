//
//  AuthenticationController.h
//  iPhoneSample
//
//  Created by Logan Allred on 10/4/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AuthenticationController : UIViewController {
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
	
	NSURLAuthenticationChallenge *challenge;
}

@property (nonatomic, retain) NSURLAuthenticationChallenge *challenge;

- (IBAction)cancel:(id)sender;
- (IBAction)authenticate:(id)sender;

@end
