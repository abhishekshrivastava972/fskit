//
//  FSKPedigreeRequest.m
//  FSKit
//
//  Created by Logan Allred on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FSKPedigreeRequest.h"
#import "FSKPedigreeResponse.h"

@implementation FSKPedigreeRequest

+ (void)fetchPedigreeForId:(NSString *)personId
				 ancestors:(int)ancestors
			   descendants:(int)descendants
				connection:aFamilySearchConnection 
				  delegate:(id)aDelegate 
				  selector:(SEL)aSelector
{
	FSKPedigreeRequest *request = [[FSKPedigreeRequest alloc] initWithFamilySearchConnection:aFamilySearchConnection delegate:aDelegate selector:aSelector];
	[request sendPedigreeRequestWithId:personId ancestors:ancestors descendants:descendants];
}

- (void)sendPedigreeRequestWithId:(NSString *)personId
						ancestors:(int)ancestors
					  descendants:(int)descendants
{
	[self fetchFamilySearchDataAtEndpoint:@"familytree/v2/pedigree" WithIds:[NSSet setWithObject:personId] 
							   parameters:[NSDictionary dictionaryWithObjectsAndKeys:[[NSNumber numberWithInt:ancestors] stringValue], @"ancestors", [[NSNumber numberWithInt:descendants] stringValue], @"descendants", nil]];
}

- (FSKPedigreeResponse *)responseWithData:(NSData *)data
{
	NSLog(@"%s", __PRETTY_FUNCTION__);	
	FSKPedigreeResponse *response = [[FSKPedigreeResponse alloc] initWithData:data];
	NSLog(@"response code: %d message: %@", [response statusCode], [response statusMessage]);	
	return [response autorelease];
}

@end
