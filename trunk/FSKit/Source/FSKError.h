//
//  FSKError.h
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FSKError : NSError {

}

- (id)initWithError:(NSError *)error;

@end