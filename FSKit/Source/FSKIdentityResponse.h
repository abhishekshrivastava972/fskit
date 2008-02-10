//
//  FSKIdentityResponse.h
//  FSKit
//
//  Created by Logan Allred on 1/27/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKResponse.h"

@interface FSKIdentityResponse : FSKResponse
{
	NSString *sessionId;
}

- (id)initWithXML:(NSXMLDocument *)xmlDocument;

- (NSString *)sessionId;

@end
