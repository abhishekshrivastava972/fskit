//
//  TreeViewController.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TreeView;

@interface TreeViewController : UIViewController {
    IBOutlet UILabel *birthLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *personIdLabel;
    IBOutlet TreeView *treeView;
}

@end
