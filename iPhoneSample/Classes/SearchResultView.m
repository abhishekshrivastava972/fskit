//
//  SearchResultView.m
//  iPhoneSample
//
//  Created by Logan Allred on 3/9/09.
//  Copyright 2009 RedBugz Software. All rights reserved.
//

#import "SearchResultView.h"
#import <FSKit/FSKSearchResult.h>

@implementation SearchResultView


@synthesize searchResult;
@synthesize dateFormatter;
@synthesize abbreviation;
@synthesize highlighted;
@synthesize editing;


- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		
		/*
		 Cache the formatter. Normally you would use one of the date formatter styles (such as NSDateFormatterShortStyle), but here we want a specific format that excludes seconds.
		 */
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"h:mm a"];
		self.opaque = YES;
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}


- (void)setSearchResult:(FSKSearchResult *)newSearchResult {
	
	// If the time zone wrapper changes, update the date formatter and abbreviation string.
	if (searchResult != newSearchResult) {
		[searchResult release];
		searchResult = [newSearchResult retain];
		
		self.abbreviation = [NSString stringWithFormat:@"%@ - %@", [[[[searchResult person] birthEvent] date] displayString], [[[[searchResult person] deathEvent] date] displayString]];
	}
	// May be the same wrapper, but the date may have changed, so mark for redisplay
	[self setNeedsDisplay];
}


- (void)setHighlighted:(BOOL)lit {
	// If highlighted state changes, need to redisplay.
	if (highlighted != lit) {
		highlighted = lit;	
		[self setNeedsDisplay];
	}
}


- (void)drawRect:(CGRect)rect {
	
#define LEFT_COLUMN_OFFSET 8
#define LEFT_COLUMN_WIDTH 150
	
#define MIDDLE_COLUMN_OFFSET 140
#define MIDDLE_COLUMN_WIDTH 110
	
#define RIGHT_COLUMN_OFFSET 270
	
#define UPPER_ROW_TOP 4
#define LOWER_ROW_TOP 24
	
#define MAIN_FONT_SIZE 18
#define MIN_MAIN_FONT_SIZE 16
#define SECONDARY_FONT_SIZE 12
#define MIN_SECONDARY_FONT_SIZE 10
	
	// Color and font for the main text items (time zone name, time)
	UIColor *mainTextColor = nil;
	UIFont *mainFont = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
	
	// Color and font for the secondary text items (GMT offset, day)
	UIColor *secondaryTextColor = nil;
	UIFont *secondaryFont = [UIFont systemFontOfSize:SECONDARY_FONT_SIZE];
	
	// Choose font color based on highlighted state.
	if (self.highlighted) {
		mainTextColor = [UIColor whiteColor];
		secondaryTextColor = [UIColor whiteColor];
	}
	else {
		mainTextColor = [UIColor blackColor];
		secondaryTextColor = [UIColor darkGrayColor];
		self.backgroundColor = [UIColor whiteColor];
	}
	
	CGRect contentRect = self.bounds;
	
	// In this example we will never be editing, but this illustrates the appropriate pattern.
    if (!self.editing) {
		
		CGFloat boundsX = contentRect.origin.x;
		CGPoint point;
		
		CGFloat actualFontSize;
		CGSize size;
		
		// Set the color for the main text items
		[mainTextColor set];
		
		/*
		 Draw the locale name top left; use the NSString UIKit method to scale the font size down if the text does not fit in the given area
		 */
		point = CGPointMake(boundsX + LEFT_COLUMN_OFFSET, UPPER_ROW_TOP);
		[[[searchResult person] name] drawAtPoint:point forWidth:LEFT_COLUMN_WIDTH withFont:mainFont minFontSize:MIN_MAIN_FONT_SIZE actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
		
		/*
		 Draw the current time, right-aligned in the middle column.
		 To ensure it is right-aligned, first find its width with the given font and minimum allowed font size. Then draw the string at the appropriate offset.
		 */
		NSString *timeString = [searchResult refId];
		size = [timeString sizeWithFont:secondaryFont minFontSize:MIN_MAIN_FONT_SIZE actualFontSize:&actualFontSize forWidth:MIDDLE_COLUMN_WIDTH lineBreakMode:UILineBreakModeTailTruncation];
		
		point = CGPointMake(boundsX + MIDDLE_COLUMN_OFFSET + MIDDLE_COLUMN_WIDTH - size.width, UPPER_ROW_TOP);
		[timeString drawAtPoint:point forWidth:MIDDLE_COLUMN_WIDTH withFont:secondaryFont minFontSize:actualFontSize actualFontSize:&actualFontSize lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
		
		
		// Set the color for the secondary text items
		[secondaryTextColor set];
		
		/*
		 Draw the abbreviation botton left; use the NSString UIKit method to scale the font size down if the text does not fit in the given area
		 */
		point = CGPointMake(boundsX + LEFT_COLUMN_OFFSET, LOWER_ROW_TOP);
		[abbreviation drawAtPoint:point forWidth:LEFT_COLUMN_WIDTH withFont:secondaryFont minFontSize:MIN_SECONDARY_FONT_SIZE actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
		
		/*
		 Draw the whichDay string, right-aligned in the middle column.
		 To ensure it is right-aligned, first find its width with the given font and minimum allowed font size. Then draw the string at the appropriate offset.
		 */
		NSString *childCountString = [NSString stringWithFormat:@"%d children", [[searchResult children] count]];
		size = [childCountString sizeWithFont:secondaryFont minFontSize:MIN_SECONDARY_FONT_SIZE actualFontSize:&actualFontSize forWidth:MIDDLE_COLUMN_WIDTH lineBreakMode:UILineBreakModeTailTruncation];
		
		point = CGPointMake(boundsX + MIDDLE_COLUMN_OFFSET + MIDDLE_COLUMN_WIDTH - size.width, LOWER_ROW_TOP);
		[childCountString drawAtPoint:point forWidth:LEFT_COLUMN_WIDTH withFont:secondaryFont minFontSize:actualFontSize actualFontSize:&actualFontSize lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
		
		
		// Draw the quarter image
		UIImage *image = [UIImage imageNamed:@"user_icon_male.png"];
		if ([[[searchResult person] gender] isEqualToString:@"Female"])
		{
			image = [UIImage imageNamed:@"user_icon_female.png"];
		}
		CGFloat imageY = (contentRect.size.height - 20) / 2;
		
		point = CGPointMake(boundsX + RIGHT_COLUMN_OFFSET, imageY);
		[image drawInRect:CGRectMake(boundsX + RIGHT_COLUMN_OFFSET, imageY, 20, 20)];
	}
}


- (void)dealloc {
	[searchResult release];
	[dateFormatter release];
	[abbreviation release];
    [super dealloc];
}

@end
