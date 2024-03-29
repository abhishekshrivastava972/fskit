//
//  FSKDate.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKDate.h"
#import "enunciate_common.h"


@implementation FSKDate

+ (FSKDate *)createFromXML:(id <EnunciateXML>)dateElement
{
    id result = [[self alloc] initWithXML:dateElement];
    return [result autorelease];
}

- (void)parseXML:(id <EnunciateXML>)dateElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, dateElement);
	[self setValue:[[dateElement firstValueForName:@"original"] retain] forKey:@"original"];
	[self setValue:[[dateElement firstValueForName:@"normalized"] retain] forKey:@"normalized"];
	[self setValue:[[dateElement firstValueForXPath:@"*:astro/*:earliest" error:nil] retain] forKey:@"earliestAstro"];
	[self setValue:[[dateElement firstValueForXPath:@"*:astro/*:latest" error:nil] retain] forKey:@"latestAstro"];
}

- (id)initWithXML:(id <EnunciateXML>)dateElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:dateElement];
    }
    
    return self;
}

- (NSString *)displayString
{
	if ([[self normalized] length] > 0)
	{
		return [self normalized];
	}
	return [self original];
}

- (NSString *)original {
    return [[original retain] autorelease];
}

- (void)setOriginal:(NSString *)value {
    if (original != value) {
        [original release];
        original = [value copy];
    }
}

- (NSString *)normalized {
    return [[normalized retain] autorelease];
}

- (void)setNormalized:(NSString *)value {
    if (normalized != value) {
        [normalized release];
        normalized = [value copy];
    }
}

- (NSString *)earliestAstro {
    return [[earliestAstro retain] autorelease];
}

- (void)setEarliestAstro:(NSString *)value {
    if (earliestAstro != value) {
        [earliestAstro release];
        earliestAstro = [value copy];
    }
}

- (NSString *)latestAstro {
    return [[latestAstro retain] autorelease];
}

- (void)setLatestAstro:(NSString *)value {
    if (latestAstro != value) {
        [latestAstro release];
        latestAstro = [value copy];
    }
}


@end
