//
//  AuthenticationController.h
//  iPhoneSample
//
//  Created by Logan Allred on 10/4/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AuthenticationController : UIViewController {
	id delegate;
	IBOutlet UITextView *instructionsText;
}

- (IBAction)cancel:(id)sender;
- (IBAction)authenticate:(id)sender;
- (void)setDelegate:(id)theDelegate;

@end
