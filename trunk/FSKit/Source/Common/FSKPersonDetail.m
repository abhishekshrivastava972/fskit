//
//  FSKPersonDetail.m
//  FSKit
//
//  Created by Logan Allred on 8/4/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSKPersonDetail.h"


@implementation FSKPersonDetail

+ (FSKPersonDetail *)createFromXML:(NSXMLElement *)personElement
{
    id result = [[self alloc] initWithXML:personElement];
    return [result autorelease];
}

- (void)parseXML:(NSXMLElement *)personElement
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, personElement);
	
	NSEnumerator *enumerator = [[personElement children] objectEnumerator];
	NSXMLNode *assertionNode;
	while(assertionNode = [enumerator nextObject])
	{
		NSLog(@"%@", assertionNode);
//		FSKAssertion *assertion = [FSKAssertion in
	}
}

- (id)initWithXML:(NSXMLElement *)personElement
{
    if ((self = [super init]) != nil) 
	{
        // Begin parsing
        [self parseXML:personElement];
    }
    
    return self;
}

@end
