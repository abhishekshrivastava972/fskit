//
//  FirstViewController.h
//  iPhoneSample
//
//  Created by Logan Allred on 8/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TreeView;

@interface FirstViewController : UIViewController {
    IBOutlet UILabel *birthLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *personIdLabel;
    IBOutlet TreeView *treeView;
}
@end
