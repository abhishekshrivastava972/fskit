//
//  FSKError.h
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "enunciate_common.h"
#import "fsv1.h"

@interface FSKError : NSError {

}

- (id)initWithXML:(FSV1BasicError *)errorElement;
- (id)initWithError:(NSError *)error;

@end
