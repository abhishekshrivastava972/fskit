//
//  AuthoritiesService.h
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKServiceBase.h"

extern NSString * const PLACE_ENDPOINT;
extern NSString * const NAME_ENDPOINT;
extern NSString * const DATE_ENDPOINT;
extern NSString * const CULTURE_ENDPOINT;

@interface FSKAuthoritiesService : FSKServiceBase {
}
+(FSKAuthoritiesService *)authoritiesServiceWithConnection:(FSKConnection *)connection;
-(id)initWithConnection:(FSKConnection *)connection;

@end
