//
//  FSKError.h
//  FSKit
//
//  Created by Logan Allred on 1/26/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSKError : NSError {

}

- (id)initWithXML:(NSXMLElement *)errorElement;
- (id)initWithError:(NSError *)error;

@end
