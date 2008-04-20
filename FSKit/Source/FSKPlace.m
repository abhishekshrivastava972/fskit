//
//  FSKPlace.m
//  FSKit
//
//  Created by Logan Allred on 4/13/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import "FSKPlace.h"
#import "NSXMLElement+BExtensions.h"


@implementation FSKPlace

+ (FSKPlace *)createFromXML:(NSXMLElement *)placeElement
{
    id result = [[self alloc] initWithXML:placeElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)placeElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, placeElement);
	[self setValue:[[placeElement firstValueForName:@"original"] retain] forKey:@"original"];
	[self setValue:[[[[placeElement firstElementWithName:@"normalized"] attributeForName:@"ref"] stringValue] retain] forKey:@"normalizedPlaceId"];
	[self setValue:[[placeElement firstValueForName:@"normalized"] retain] forKey:@"normalizedPlaceName"];
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
