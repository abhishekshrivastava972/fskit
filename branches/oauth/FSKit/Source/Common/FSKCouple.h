//
//  FSKCouple.h
//  FSKit
//
//  Created by Logan Allred on 2/24/08.
//  Copyright 2008 RedBugz Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKPerson.h"

@interface FSKCouple : NSObject {
	FSKPerson *person;
	FSKPerson *spouse;
}

@end
