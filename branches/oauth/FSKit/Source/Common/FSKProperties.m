//
//  FSKProperties.m
//  FSKit
//
//  Created by Logan Allred on 3/1/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKProperties.h"
#import "FSKIdentityRequest.h"
#import "FSKIdentityResponse.h"

@implementation FSKProperties

NSString *kFSKPROPERTIES_PROPERTIES_KEY = @"properties";
NSString *kFSKPROPERTIES_LASTMODIFED_KEY = @"_FSKPropertiesLastModified";

- (id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
							delegate:(id)aDelegate 
							endpoint:(NSString *)anEndpoint
{
	if ((self = [super init]))
	{ 
		connection = [aFamilySearchConnection retain];
		delegate = aDelegate;
		endpoint = [anEndpoint copy];
	}
	return self;
}

- (void)dealloc
{
	[connection release];
	delegate = nil;
	[endpoint release];
	
	[super dealloc];
}

- (NSString *)defaultsNameForKey:(NSString *)key
{
	return [NSString stringWithFormat:@"FSKProperties_%@/%@_%@", [connection baseURLString], endpoint, key];
}

- (NSDictionary *)properties
{
	return [[NSUserDefaults standardUserDefaults] dictionaryForKey:[self defaultsNameForKey:kFSKPROPERTIES_PROPERTIES_KEY]];
}

- (NSString *)stringForKey:(NSString *)key
{
	return [[self properties] valueForKey:key];
}

- (NSString *)stringForKey:(NSString *)key withDefault:(NSString *)defaultValue
{
	NSString *value = [[self properties] valueForKey:key];
	if (!value)
	{
		value = defaultValue;
	}
	return value;
}

- (BOOL)boolForKey:(NSString *)key
{
	return [[self properties] boolForKey:key];
}

- (NSInteger)integerForKey:(NSString *)key
{
	return [[self properties] integerForKey:key];
}


- (NSURL *)URLForKey:(NSString *)key
{
	return [NSURL URLWithString:[[self properties] valueForKey:key]];
}

- (void)refreshProperties
{
	NSLog(@"refreshProperties: authorize.url:%@", [self stringForKey:@"authorize.url"]);
	NSLog(@"[self properties]:\n%@", [self properties]);	
	[FSKIdentityRequest fetchIdentityData:@"properties" WithIds:nil parameters:nil connection:connection delegate:self selector:@selector(handlePropertiesResponse:)];
}

- (NSDate *)lastModified
{
	return [[self properties] valueForKey:kFSKPROPERTIES_LASTMODIFED_KEY];
}

- (BOOL)hasProperties
{
	return ( [self properties] != nil );
}

- (void)handlePropertiesResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	
	NSMutableDictionary *propertyDict = [NSMutableDictionary dictionary];
	NSArray *props = [[response xmlDocument] properties];
//	NSArray *propertiesList = [response valueForKeyPath:@"xmlDocument.properties"];
	NSEnumerator *enumerator = [props objectEnumerator];
	FSIDENTITYV2AIdentityProperty *property;
	while ((property = [enumerator nextObject])) {
		[propertyDict setObject:[property value] forKey:[property name]];
		NSLog(@"prop name:%@ value:%@", [property name], [propertyDict valueForKey:[property name]]);
	}
	[propertyDict setObject:[NSDate date] forKey:kFSKPROPERTIES_LASTMODIFED_KEY];
	[[NSUserDefaults standardUserDefaults] setObject:propertyDict forKey:[self defaultsNameForKey:kFSKPROPERTIES_PROPERTIES_KEY]];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSLog(@"[self properties]:\n%@\nlastModified:%@", [self properties], [self lastModified]);	
}

@end


@implementation NSDictionary(CocoaDevUsersAdditions)

-(NSDictionary *)dictionaryBySettingObject:(id)object forKey:(id<NSCopying>)key
{
    return [self dictionaryByAddingEntriesFromDictionary:[NSDictionary dictionaryWithObject:object forKey:key]];    
}

-(NSDictionary *)dictionaryBySettingObjects:(NSArray *)someObjects forKeys:(NSArray *)keys
{
    return [self dictionaryByAddingEntriesFromDictionary:[NSDictionary dictionaryWithObjects:someObjects forKeys:keys]];
}

-(NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary *)otherDictionary
{
    NSMutableDictionary * returnDictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    [returnDictionary addEntriesFromDictionary:otherDictionary];
    return returnDictionary;
}

-(BOOL) boolForKey: (id) aKey
{
    BOOL result = NO; // lame default return value
    id <NSObject> obj = [self objectForKey:aKey];
    if (obj) {
        SEL bv = @selector(boolValue);
        if ([obj respondsToSelector:bv])
            result = ([obj performSelector:bv] ? YES : NO);
        else if ([obj isKindOfClass:[NSString class]]) {
            result = ([(NSString *)obj caseInsensitiveCompare: @"YES"] == NSOrderedSame);
            if (!result)
                result = ([(NSString *)obj caseInsensitiveCompare: @"TRUE"] == NSOrderedSame);
		}
	}
    return result;
}

-(NSInteger) integerForKey: (id) aKey
{
    NSInteger result = 0; // lame default return value
    id <NSObject> obj = [self objectForKey:aKey];
    if (obj) {
        SEL iv = @selector(intValue);
        if ([obj respondsToSelector:iv])
            result = (NSInteger)[obj performSelector:iv];
	}
    return result;
}

-(BOOL) hasKey: (id) testKey
{
    return ([self objectForKey:testKey] != nil);
}

-(NSArray *)allObjectsSortedByKeySelector:(SEL)sortSelector
{
    NSArray *sortedKeys = [[self allKeys] sortedArrayUsingSelector:sortSelector];
    NSArray *resultArray = [self objectsForKeys:sortedKeys notFoundMarker:[NSNull null]];
    return resultArray;
}

//- (NSDictionary *)resultsOfMakeObjectsPerformSelector:(SEL)selector
//{
//	NSArray *keys = [self allKeys];
//	NSArray *values = [self objectsForKeys:keys notFoundMarker:nil];
//	return [NSDictionary dictionaryWithObjects:[values resultsOfMakeObjectsPerformSelector:selector] forKeys:keys];
//}
//
//- (NSDictionary *)resultsOfMakeObjectsPerformSelector:(SEL)selector withObject:(id)object
//{
//	NSArray *keys = [self allKeys];
//	NSArray *values = [self objectsForKeys:keys notFoundMarker:nil];
//	return [NSDictionary dictionaryWithObjects:[values resultsOfMakeObjectsPerformSelector:selector withObject:object] forKeys:keys];
//}
//
@end
