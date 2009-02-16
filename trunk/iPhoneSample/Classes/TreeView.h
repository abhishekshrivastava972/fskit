//
//  TreeView.h
//  iPhoneSample
//
//  Created by Logan Allred on 2/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSKPerson;

@interface TreeView : UIView {
	FSKPerson *rootPerson;
}
@property (readwrite, retain) FSKPerson *rootPerson;

@end
