//
//  TempleService.h
//  FSKit
//
//  Created by Logan Allred on 9/16/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKServiceBase.h"
#import "temple.h"

@interface FSKTempleService : FSKServiceBase {

}
+(FSKTempleService *)templeServiceWithConnection:(FSKConnection *)connection;
-(id)initWithConnection:(FSKConnection *)connection;

- (NSArray *)fetchTempleList;
- (FSTEMPLEV1Temple *)fetchTempleWithCode:(NSString *)code;
@end
