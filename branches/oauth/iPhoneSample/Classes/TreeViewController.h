//
//  TreeViewController.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/2/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TreeView, FSKIdentityService;

@interface TreeViewController : UIViewController {
    IBOutlet UILabel *birthLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *personIdLabel;
    IBOutlet TreeView *treeView;
	FSKIdentityService *identityService;
}

- (IBAction)signin:(id)sender;
- (IBAction)signout:(id)sender;
@end
