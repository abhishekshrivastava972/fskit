//
//  StarRatingView.h
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StarRatingView : UIView {
	NSNumber *rating;
}
@property (readwrite, retain) NSNumber *rating;

@end
