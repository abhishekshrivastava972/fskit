//
//  FSKPersonResponse.m
//  FSKit
//
//  Created by Demo Account on 3/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonResponse.h"


@implementation FSKPersonResponse

- (id)initWithXML:(NSXMLDocument *)theXmlDocument
{
    if ((self = [super initWithXML:theXmlDocument]) != nil) 
	{ 
		NSMutableArray *personList = [NSMutableArray array];
		persons = [NSArray arrayWithArray:personList];
	}
	
	return self;	
}

- (void)dealloc
{
	[super dealloc];
}
@end
