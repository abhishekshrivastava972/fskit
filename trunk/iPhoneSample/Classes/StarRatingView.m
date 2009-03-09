//
//  StarRatingView.m
//  iPhoneSample
//
//  Created by Logan Allred on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StarRatingView.h"


@implementation StarRatingView

@synthesize rating;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	for (int i = 1; i <= [rating intValue]; i++) {
		UIImage *starImage = [UIImage imageNamed:@"star"];
		//to draw this image in a UIView's drawRect method
		CGContextRef context = UIGraphicsGetCurrentContext();  // you need to find the context to draw into
		CGImageRef myCGImage = [starImage CGImage];
		CGContextDrawImage(context, rect, myCGImage);	
    }
}


- (void)dealloc {
    [super dealloc];
}


@end
