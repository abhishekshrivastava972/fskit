//
//  FamilySearchService.h
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKConnection.h"

@interface FSKServiceBase : NSObject {
	FSKConnection *connection;
	id _delegate;	
	
	NSString *moduleName;
	NSString *versionString;
	NSDictionary *properties;
}

- (id)initWithConnection:(FSKConnection *)familySearchConnection delegate:(id)theDelegate;

-(void) makeFamilySearchRequest:(NSString *)endpoint idList:(NSSet *)idList parameters:(NSDictionary *)parameterDict;
-(NSDictionary *)properties;

// delegate methods
-(void) requestFinished:(NSXMLElement *)response;
-(void) requestFailed:(NSError *)error;
@end
/* Is this the right way to go?
@interface NSObject (FSKServiceDelegate)
// delegate methods
- (void)service:(FSKServiceBase *)service didReturnResponse:(FSKResponse *)response;
- (void)service:(FSKServiceBase *)service didFailWithError:(FSKError *)error;
@end
*/