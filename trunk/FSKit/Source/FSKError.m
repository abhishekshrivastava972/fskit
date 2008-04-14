//
//  FSKError.m
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKError.h"


@implementation FSKError

- (id)initWithError:(NSError *)error
{
	if (self = [super initWithDomain:[error domain]	code:[error code] userInfo:[error userInfo]])
	{
		
	}
	
	return self;
}
@end
