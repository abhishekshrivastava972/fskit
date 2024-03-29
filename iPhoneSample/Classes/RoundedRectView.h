//
//  RoundedRectView.h
//
//  Created by Jeff LaMarche on 11/13/08.

#import <UIKit/UIKit.h>

#define kDefaultStrokeColor         [UIColor blackColor]
#define kDefaultRectColor           [UIColor yellowColor]
#define kDefaultStrokeWidth         1.0
#define kDefaultCornerRadius        10.0

@class FSKPerson;

@interface RoundedRectView : UIView {
    UIColor     *strokeColor;
    UIColor     *rectColor;
    CGFloat     strokeWidth;
    CGFloat     cornerRadius;
	FSKPerson	*person;
}
@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, retain) UIColor *rectColor;
@property CGFloat strokeWidth;
@property CGFloat cornerRadius;
@property (readwrite, retain) FSKPerson *person;
@end

