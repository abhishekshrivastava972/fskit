//
//  FSKPlace.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPlace.h"


@implementation FSKPlace

+ (FSKPlace *)createFromXML:(NSXMLElement *)placeElement
{
    id result = [[self alloc] initWithXML:placeElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)placeElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, placeElement);
	original = [[placeElement firstValueForName:@"original"] retain];
	normalizedPlaceId = [[[[placeElement firstElementWithName:@"normalized"] attributeForName:@"ref"] stringValue] retain];
	normalizedPlaceName = [[placeElement firstValueForName:@"normalized"] retain];
}

- (id)initWithXML:(NSXMLElement *)placeElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:placeElement];
    }
    
    return self;
}

@end
