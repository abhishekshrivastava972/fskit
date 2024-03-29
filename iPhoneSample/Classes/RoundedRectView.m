//
//  RoundedRectView.m
//
//  Created by Jeff LaMarche on 11/13/08.

#import "RoundedRectView.h"
#import <FSKit/FSKPerson.h>

@implementation RoundedRectView
@synthesize strokeColor;
@synthesize rectColor;
@synthesize strokeWidth;
@synthesize cornerRadius;
@synthesize person;
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder])
    {
        self.strokeColor = kDefaultStrokeColor;
        super.backgroundColor = [UIColor clearColor];
        self.strokeWidth = kDefaultStrokeWidth;
        self.rectColor = kDefaultRectColor;
        self.cornerRadius = kDefaultCornerRadius;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:frame]) 
    {
        // Initialization code
        super.opaque = NO;
        self.strokeColor = kDefaultStrokeColor;
        self.backgroundColor = [UIColor clearColor];
        self.rectColor = kDefaultRectColor;
        self.strokeWidth = kDefaultStrokeWidth;
        self.cornerRadius = kDefaultCornerRadius;
    }
    return self;
}
- (void)setBackgroundColor:(UIColor *)newBGColor
{
    // Ignore any attempt to set background color - backgroundColor must stay set to clearColor
    // We could throw an exception here, but that would cause problems with IB, since backgroundColor
    // is a palletized property, IB will attempt to set backgroundColor for any view that is loaded
    // from a nib, so instead, we just quietly ignore this.
    //
    // Alternatively, we could put an NSLog statement here to tell the programmer to set rectColor...
}
- (void)setOpaque:(BOOL)newIsOpaque
{
    // Ignore attempt to set opaque to YES.
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, strokeWidth);
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
    CGContextSetFillColorWithColor(context, self.rectColor.CGColor);
    
    CGRect rrect = self.bounds;
    
    CGFloat radius = cornerRadius;
    CGFloat width = CGRectGetWidth(rrect);
    CGFloat height = CGRectGetHeight(rrect);
    
    // Make sure corner radius isn't larger than half the shorter side
    if (radius > width/2.0)
        radius = width/2.0;
    if (radius > height/2.0)
        radius = height/2.0;    
    
    CGFloat minx = CGRectGetMinX(rrect);
    CGFloat midx = CGRectGetMidX(rrect);
    CGFloat maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect);
    CGFloat midy = CGRectGetMidY(rrect);
    CGFloat maxy = CGRectGetMaxY(rrect);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
	
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(minx+5, miny+5, width-10, (height-10)/2.0)];
	nameLabel.text = person.fullName;
	nameLabel.backgroundColor = [UIColor clearColor];
	nameLabel.opaque = NO;
	[self addSubview:nameLabel];
	UILabel *birthLabel = [[UILabel alloc] initWithFrame:CGRectMake(minx+5, miny+5+nameLabel.bounds.size.height, width-10, (height-10)/2.0)];
	birthLabel.text = person.summary.birthdate;
	birthLabel.backgroundColor = [UIColor clearColor];
	birthLabel.opaque = NO;
	[self addSubview:birthLabel];
}

- (void)dealloc {
    [strokeColor release];
    [rectColor release];
    [super dealloc];
}

@end