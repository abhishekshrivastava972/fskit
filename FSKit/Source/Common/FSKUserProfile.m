//
//  FSKUserProfile.m
//  FSKit
//
//  Created by Logan Allred on 2/8/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKUserProfile.h"


@implementation FSKUserProfile

- (NSString *)userId {
    return [[userId retain] autorelease];
}

- (void)setUserId:(NSString *)value {
	userId = value;
}

- (NSString *)displayName {
    return [[displayName retain] autorelease];
}

- (NSString *)email {
    return [[email retain] autorelease];
}


+ (FSKUserProfile *)createFromXML:(FSIDENTITYV2AUser *)userElement
{
    id result = [[self alloc] initWithXML:userElement];
    return [result autorelease];
}

- (id)initWithXML:(FSIDENTITYV2AUser *)userElement
{
    if ((self = [super init]) != nil) 
	{
		[self setValue:[userElement id] forKey:@"userId"];
		 
		[self setValue:[[userElement displayName] retain] forKey:@"displayName"];
		[self setValue:[[userElement email] retain] forKey:@"email"];
		 
//		 fsfamilytreev2 *addressElement = [userElement firstElementWithName:@"address"];
//		 if (addressElement)
//		 {
//			 [self setValue:[[addressElement firstValueForName:@"address1"] retain] forKey:@"address1"];
//			 [self setValue:[[addressElement firstValueForName:@"address2"] retain] forKey:@"address2"];
//			 [self setValue:[[addressElement firstValueForName:@"address3"] retain] forKey:@"address3"];
//			 [self setValue:[[addressElement firstValueForName:@"address4"] retain] forKey:@"address4"];
//			 [self setValue:[[addressElement firstValueForName:@"city"] retain] forKey:@"city"];
//			 [self setValue:[[addressElement firstValueForName:@"state"] retain] forKey:@"state"];
//			 [self setValue:[[addressElement firstValueForName:@"province"] retain] forKey:@"province"];
//			 [self setValue:[[addressElement firstValueForName:@"postalCode"] retain] forKey:@"postalCode"];
//			 [self setValue:[[addressElement firstValueForName:@"country"] retain] forKey:@"country"];
//			 [self setValue:[[addressElement firstValueForName:@"street1"] retain] forKey:@"street1"];
//			 [self setValue:[[addressElement firstValueForName:@"street2"] retain] forKey:@"street2"];
//			 [self setValue:[[addressElement firstValueForName:@"street3"] retain] forKey:@"street3"];
//		 }
		 		 
	 }
	return self;
}
	 
@end
