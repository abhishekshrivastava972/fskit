//
//  fsv1.h
//  DuplicateSymbolTest
//
//  Created by Logan Allred on 2/6/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import <libxml/xmlwriter.h>
#import <libxml/xmlreader.h>
#import <Foundation/Foundation.h>
#import "enunciate_common.h"

#ifndef DEBUG_ENUNCIATE
//turn off enunciate debugging.
#define DEBUG_ENUNCIATE 0
#endif


#ifndef FSV1ErrorLevelInterface
#define FSV1ErrorLevelInterface
/**
 * (no documentation provided)
 */
enum FSV1ErrorLevel
{
	
	/**
	 * (no documentation provided)
	 */
	FSAPI_V1_ERRORLEVEL_INFO,
	
	/**
	 * (no documentation provided)
	 */
	FSAPI_V1_ERRORLEVEL_WARN,
	
	/**
	 * (no documentation provided)
	 */
	FSAPI_V1_ERRORLEVEL_ERROR
};
#endif /* FSV1ErrorLevelInterface */

#ifndef FSV1BasicPropertyInterface
#define FSV1BasicPropertyInterface
/**
 * (no documentation provided)
 */
@interface FSV1BasicProperty : NSObject
{
@private
    NSString *_name;
    NSString *_value;
}

/**
 * (no documentation provided)
 */
- (NSString *) name;

/**
 * (no documentation provided)
 */
- (void) setName: (NSString *) newName;

/**
 * (no documentation provided)
 */
- (NSString *) value;

/**
 * (no documentation provided)
 */
- (void) setValue: (NSString *) newValue;
@end /* interface FSV1BasicProperty */
#endif /* FSV1BasicPropertyInterface */

#ifndef FSV1BasicErrorInterface
#define FSV1BasicErrorInterface

/**
 * (no documentation provided)
 */
@interface FSV1BasicError : NSObject
{
@private
    enum FSV1ErrorLevel *_level;
    int *_subcode;
    int _code;
    NSString *_message;
    NSString *_details;
}

/**
 * (no documentation provided)
 */
- (enum FSV1ErrorLevel *) level;

/**
 * (no documentation provided)
 */
- (void) setLevel: (enum FSV1ErrorLevel *) newLevel;

/**
 * (no documentation provided)
 */
- (int *) subcode;

/**
 * (no documentation provided)
 */
- (void) setSubcode: (int *) newSubcode;

/**
 * (no documentation provided)
 */
- (int) code;

/**
 * (no documentation provided)
 */
- (void) setCode: (int) newCode;

/**
 * (no documentation provided)
 */
- (NSString *) message;

/**
 * (no documentation provided)
 */
- (void) setMessage: (NSString *) newMessage;

/**
 * (no documentation provided)
 */
- (NSString *) details;

/**
 * (no documentation provided)
 */
- (void) setDetails: (NSString *) newDetails;
@end /* interface FSV1BasicError */
#endif /* FSV1BasicErrorInterface */

#ifndef FSV1BasicElementInterface
#define FSV1BasicElementInterface
/**
 * (no documentation provided)
 */
@interface FSV1BasicElement : NSObject
{
@private
    int *_statusCode;
    BOOL *_deprecated;
    NSString *_statusMessage;
    NSString *_version;
    NSArray *_properties;
    NSArray *_errors;
}

/**
 * (no documentation provided)
 */
- (int *) statusCode;

/**
 * (no documentation provided)
 */
- (void) setStatusCode: (int *) newStatusCode;

/**
 * (no documentation provided)
 */
- (BOOL *) deprecated;

/**
 * (no documentation provided)
 */
- (void) setDeprecated: (BOOL *) newDeprecated;

/**
 * (no documentation provided)
 */
- (NSString *) statusMessage;

/**
 * (no documentation provided)
 */
- (void) setStatusMessage: (NSString *) newStatusMessage;

/**
 * (no documentation provided)
 */
- (NSString *) version;

/**
 * (no documentation provided)
 */
- (void) setVersion: (NSString *) newVersion;

/**
 * (no documentation provided)
 */
- (NSArray *) properties;

/**
 * (no documentation provided)
 */
- (void) setProperties: (NSArray *) newProperties;

/**
 * (no documentation provided)
 */
- (NSArray *) errors;

/**
 * (no documentation provided)
 */
- (void) setErrors: (NSArray *) newErrors;
@end /* interface FSV1BasicElement */
#endif /* FSV1BasicElementInterface */



