//
// This code was generated by Enunciate.
// http://enunciate.codehaus.org/
//
#import <libxml/xmlwriter.h>
#import <libxml/xmlreader.h>
#import <Foundation/Foundation.h>

#ifndef DEBUG_ENUNCIATE
//turn off enunciate debugging.
#define DEBUG_ENUNCIATE 0
#endif

/**
 * Enunciate-specific interfaces and protocols.
 */
#ifndef ENUNCIATE_OBJC_TYPES
#define ENUNCIATE_OBJC_TYPES

/**
 * Protocol defining an Enunciate XML I/O methods.
 */
@protocol EnunciateXML

/**
 * Read an instance from XML.
 *
 * @param xml The XML to read.
 */
+ (id<EnunciateXML>) readFromXML: (NSData *) xml;

/**
 * Write this instance as XML.
 *
 * @return The XML.
 */
- (NSData *) writeToXML;

@end /*protocol EnunciateXML*/


/**
 * A basic XML node. Can be an element or an attribute. Used
 * instead of NSXMLElement because it's not supported on all
 * platforms yet.
 */
@interface JAXBBasicXMLNode : NSObject
{
  @private
    NSString *_name;
    NSString *_ns;
    NSString *_prefix;
    NSString *_value;
    NSArray  *_childElements;
    NSArray  *_attributes;
}

/**
 * Accessor for the (local) name of the XML node.
 *
 * @return The (local) name of the XML node.
 */
- (NSString *) name;

/**
 * Accessor for the (local) name of the XML node.
 *
 * @param newName The (local) name of the XML node.
 */
- (void) setName: (NSString *) newName;

/**
 * Accessor for the namespace of the XML node.
 *
 * @return The namespace of the XML node.
 */
- (NSString *) ns;

/**
 * Accessor for the namespace of the XML node.
 *
 * @param newNs The namespace of the XML node.
 */
- (void) setNs: (NSString *) newNs;

/**
 * Accessor for the namespace prefix of the XML node.
 *
 * @return The namespace prefix of the XML node.
 */
- (NSString *) prefix;

/**
 * Accessor for the namespace prefix of the XML node.
 *
 * @param newPrefix The namespace prefix of the XML node.
 */
- (void) setPrefix: (NSString *) newPrefix;

/**
 * Accessor for the value of the XML node.
 *
 * @return The value of the XML node.
 */
- (NSString *) value;

/**
 * Accessor for the value of the XML node.
 *
 * @param newValue The value of the XML node.
 */
- (void) setValue: (NSString *) newValue;

/**
 * Accessor for the child elements of the XML node.
 *
 * @return The child elements of the XML node.
 */
- (NSArray *) childElements;

/**
 * Accessor for the child elements of the XML node.
 *
 * @param newValue The child elements of the XML node.
 */
- (void) setChildElements: (NSArray *) newChildElements;

/**
 * Accessor for the attributes of the XML node.
 *
 * @return The attributes of the XML node.
 */
- (NSArray *) attributes;

/**
 * Accessor for the attributes of the XML node.
 *
 * @param newAttributes The attributes of the XML node.
 */
- (void) setAttributes: (NSArray *) newAttributes;
@end /*interface JAXBBasicXMLNode*/

#endif /* ENUNCIATE_OBJC_TYPES */


/**
 * (no documentation provided)
 */
enum FSV1ErrorLevel
{

  /**
   * (no documentation provided)
   */
  TEMPLE_FSAPI_V1_ERRORLEVEL_INFO,

  /**
   * (no documentation provided)
   */
  TEMPLE_FSAPI_V1_ERRORLEVEL_WARN,

  /**
   * (no documentation provided)
   */
  TEMPLE_FSAPI_V1_ERRORLEVEL_ERROR
};

/**
 * Reads a ErrorLevel from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ErrorLevel, or NULL if unable to be read.
 */
static enum FSV1ErrorLevel *xmlTextReaderReadFSV1ErrorLevelType(xmlTextReaderPtr reader);

/**
 * Writes a ErrorLevel to XML.
 *
 * @param writer The XML writer.
 * @param _errorLevel The ErrorLevel to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSV1ErrorLevelType(xmlTextWriterPtr writer, enum FSV1ErrorLevel *_errorLevel);

@class FSTEMPLEV1Temples;
@class FSTEMPLEV1Temple;
@class FSV1BasicProperty;
@class FSV1BasicError;
@class FSV1BasicElement;
@class FSTEMPLEV1TempleRootElement;


/**
 *  A list of temples.

 @author Rob Lyon

 */
@interface FSTEMPLEV1Temples : NSObject
{
  @private
    int _count;
    NSArray *_templeItems;
}

/**
 * the number of temples.
 */
- (int) count;

/**
 * the number of temples.
 */
- (void) setCount: (int) newCount;

/**
 * a list of temples.
 */
- (NSArray *) templeItems;

/**
 * a list of temples.
 */
- (void) setTempleItems: (NSArray *) newTempleItems;
@end /* interface FSTEMPLEV1Temples */

/**
 *  A temple.

 @author Rob Lyon

 */
@interface FSTEMPLEV1Temple : NSObject
{
  @private
    NSString *_code;
    NSString *_name;
    long *_district;
    NSString *_location;
    NSString *_dedicationDate;
}

/**
 * the code of the temple.
 */
- (NSString *) code;

/**
 * the code of the temple.
 */
- (void) setCode: (NSString *) newCode;

/**
 * the name of the temple.
 */
- (NSString *) name;

/**
 * the name of the temple.
 */
- (void) setName: (NSString *) newName;

/**
 * the district of the temple.
 */
- (long *) district;

/**
 * the district of the temple.
 */
- (void) setDistrict: (long *) newDistrict;

/**
 * the location of the temple.
 */
- (NSString *) location;

/**
 * the location of the temple.
 */
- (void) setLocation: (NSString *) newLocation;

/**
 * the dedication date of the temple.
 */
- (NSString *) dedicationDate;

/**
 * the dedication date of the temple.
 */
- (void) setDedicationDate: (NSString *) newDedicationDate;
@end /* interface FSTEMPLEV1Temple */

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
    NSArray *_errors;
    NSArray *_properties;
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
- (NSArray *) errors;

/**
 * (no documentation provided)
 */
- (void) setErrors: (NSArray *) newErrors;

/**
 * (no documentation provided)
 */
- (NSArray *) properties;

/**
 * (no documentation provided)
 */
- (void) setProperties: (NSArray *) newProperties;
@end /* interface FSV1BasicElement */

/**
 *  @author Rob Lyon

 */
@interface FSTEMPLEV1TempleRootElement : FSV1BasicElement <EnunciateXML>
{
  @private
    FSTEMPLEV1Temples *_temples;
}

/**
 * The temples.
 */
- (FSTEMPLEV1Temples *) temples;

/**
 * The temples.
 */
- (void) setTemples: (FSTEMPLEV1Temples *) newTemples;
@end /* interface FSTEMPLEV1TempleRootElement */