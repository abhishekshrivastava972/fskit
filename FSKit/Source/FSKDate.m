//
//  FSKDate.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKDate.h"
#import "NSXMLElement+BExtensions.h"


@implementation FSKDate

+ (FSKDate *)createFromXML:(NSXMLElement *)dateElement
{
    id result = [[self alloc] initWithXML:dateElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)dateElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, dateElement);
	[self setValue:[[dateElement firstValueForName:@"original"] retain] forKey:@"original"];
	[self setValue:[[dateElement firstValueForName:@"normalized"] retain] forKey:@"normalized"];
	[self setValue:[[dateElement firstValueForXPath:@"*:astro/*:earliest" error:nil] retain] forKey:@"earliestAstro"];
	[self setValue:[[dateElement firstValueForXPath:@"*:astro/*:latest" error:nil] retain] forKey:@"latestAstro"];
}

- (id)initWithXML:(NSXMLElement *)dateElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:dateElement];
    }
    
    return self;
}

@end
