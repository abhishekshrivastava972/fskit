//
//  FSKContributorResponse.h
//  FSKit
//
//  Created by Logan Allred on 8/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKResponse.h"

@interface FSKContributorResponse : FSKResponse {
	NSArray *requestedIds; // of NSString
	NSArray *Contributors; // of FSKContributor
}

- (id)initWithXML:(NSXMLDocument *)theXmlDocument;

- (NSArray *)ContributorList;

@end
