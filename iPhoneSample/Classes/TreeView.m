//
//  TreeView.m
//  iPhoneSample
//
//  Created by Logan Allred on 2/15/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "TreeView.h"
#import "RoundedRectView.h"
#import <FSKit/FSKPerson.h>

@implementation TreeView

@synthesize rootPerson;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGFloat nodeWidth = 150.0;
	CGFloat nodeHeight = 50.0;
    // Drawing code
	CGPoint center = CGPointMake(rect.origin.x+20, rect.size.height/2.0);
	RoundedRectView *root = [[RoundedRectView alloc] initWithFrame:CGRectMake(center.x, center.y-(nodeHeight/2.0), nodeWidth,nodeHeight)];
	[root setPerson:rootPerson];
	[self addSubview:root];
	RoundedRectView *p1 = [[RoundedRectView alloc] initWithFrame:CGRectMake(center.x+70, center.y-(nodeHeight/2.0)-(center.y/2.0), nodeWidth,nodeHeight)];
	[self addSubview:p1];
	RoundedRectView *p2 = [[RoundedRectView alloc] initWithFrame:CGRectMake(center.x+70, center.y-(nodeHeight/2.0)+(center.y/2.0), nodeWidth,nodeHeight)];
	[self addSubview:p2];
}


- (void)dealloc {
    [super dealloc];
}


@end
