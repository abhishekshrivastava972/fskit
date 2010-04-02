//
//  fsv1.m
//  DuplicateSymbolTest
//
//  Created by Logan Allred on 2/6/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "fsv1.h"

/**
 * Reads a ErrorLevel from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ErrorLevel, or NULL if unable to be read.
 */
enum FSV1ErrorLevel *xmlTextReaderReadFSV1ErrorLevelType(xmlTextReaderPtr reader)
{
	xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
	enum FSV1ErrorLevel *value = calloc(1, sizeof(enum FSV1ErrorLevel));
	if (enumValue != NULL) {
		if (xmlStrcmp(enumValue, BAD_CAST "Info") == 0) {
			*value = FSAPI_V1_ERRORLEVEL_INFO;
			free(enumValue);
			return value;
		}
		if (xmlStrcmp(enumValue, BAD_CAST "Warn") == 0) {
			*value = FSAPI_V1_ERRORLEVEL_WARN;
			free(enumValue);
			return value;
		}
		if (xmlStrcmp(enumValue, BAD_CAST "Error") == 0) {
			*value = FSAPI_V1_ERRORLEVEL_ERROR;
			free(enumValue);
			return value;
		}
#if DEBUG_ENUNCIATE
		NSLog(@"Attempt to read enum value failed: %s doesn't match an enum value.", enumValue);
#endif
	}
#if DEBUG_ENUNCIATE
	else {
		NSLog(@"Attempt to read enum value failed: NULL value.");
	}
#endif
	
	return NULL;
}

/**
 * Writes a ErrorLevel to XML.
 *
 * @param writer The XML writer.
 * @param _errorLevel The ErrorLevel to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteFSV1ErrorLevelType(xmlTextWriterPtr writer, enum FSV1ErrorLevel *_errorLevel)
{
	switch (*_errorLevel) {
		case FSAPI_V1_ERRORLEVEL_INFO:
			return xmlTextWriterWriteString(writer, BAD_CAST "Info");
		case FSAPI_V1_ERRORLEVEL_WARN:
			return xmlTextWriterWriteString(writer, BAD_CAST "Warn");
		case FSAPI_V1_ERRORLEVEL_ERROR:
			return xmlTextWriterWriteString(writer, BAD_CAST "Error");
	}
	
#if DEBUG_ENUNCIATE
	NSLog(@"Unable to write enum value (no valid value found).");
#endif
	return -1;
}

#ifndef FSV1BasicPropertyImplementation
#define FSV1BasicPropertyImplementation

/**
 * (no documentation provided)
 */
@implementation FSV1BasicProperty

/**
 * (no documentation provided)
 */
- (NSString *) name
{
	return _name;
}

/**
 * (no documentation provided)
 */
- (void) setName: (NSString *) newName
{
	[newName retain];
	[_name release];
	_name = newName;
}

/**
 * (no documentation provided)
 */
- (NSString *) value
{
	return _value;
}

/**
 * (no documentation provided)
 */
- (void) setValue: (NSString *) newValue
{
	[newValue retain];
	[_value release];
	_value = newValue;
}

- (void) dealloc
{
	[self setName: nil];
	[self setValue: nil];
	[super dealloc];
}
@end /* implementation FSV1BasicProperty */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSV1BasicProperty (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSV1BasicProperty (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSV1BasicProperty (JAXB)

/**
 * Read an instance of FSV1BasicProperty from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSV1BasicProperty defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	FSV1BasicProperty *_fSV1BasicProperty = [[FSV1BasicProperty alloc] init];
	NS_DURING
	{
		[_fSV1BasicProperty initWithReader: reader];
	}
	NS_HANDLER
	{
		[_fSV1BasicProperty dealloc];
		_fSV1BasicProperty = nil;
		[localException raise];
	}
	NS_ENDHANDLER
	
	[_fSV1BasicProperty autorelease];
	return _fSV1BasicProperty;
}

/**
 * Initialize this instance of FSV1BasicProperty according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSV1BasicProperty to the writer.
 * Note that since we're only writing the XML type,
 * No start/end element will be written.
 *
 * @param reader The reader.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	[super writeXMLType:writer];
}

//documentation inherited.
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader
{
	void *_child_accessor;
	
	if ([super readJAXBAttribute: reader]) {
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "name", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}name...");
#endif
		[self setName: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}name...");
#endif
		return YES;
	}
	
	return NO;
}

//documentation inherited.
- (BOOL) readJAXBValue: (xmlTextReaderPtr) reader
{
	
#if DEBUG_ENUNCIATE > 1
	NSLog(@"Attempting to read element value...");
#endif
	if (xmlTextReaderIsEmptyElement(reader) == 0) {
		[self setValue: (NSString *) [NSString readXMLType: reader]];
	}
	else {
		[self setValue: @""];
	}
#if DEBUG_ENUNCIATE > 1
	NSLog(@"successfully read element value...");
#endif
	
	return YES;
}

//documentation inherited.
- (BOOL) readJAXBChildElement: (xmlTextReaderPtr) reader
{
	return [super readJAXBChildElement: reader];
}

//documentation inherited.
- (int) readUnknownJAXBChildElement: (xmlTextReaderPtr) reader
{
	return [super readUnknownJAXBChildElement: reader];
}

//documentation inherited.
- (void) readUnknownJAXBAttribute: (xmlTextReaderPtr) reader
{
	[super readUnknownJAXBAttribute: reader];
}

//documentation inherited.
- (void) writeJAXBAttributes: (xmlTextWriterPtr) writer
{
	int status;
	
	[super writeJAXBAttributes: writer];
	
	if ([self name]) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "name", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}name."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}name...");
#endif
		[[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}name...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}name."];
		}
	}
}

//documentation inherited.
- (void) writeJAXBValue: (xmlTextWriterPtr) writer
{
#if DEBUG_ENUNCIATE > 1
	NSLog(@"writing element value...");
#endif
	[[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
	NSLog(@"successfully wrote element value...");
#endif
}

/**
 * Method for writing the child elements.
 *
 * @param writer The writer.
 */
- (void) writeJAXBChildElements: (xmlTextWriterPtr) writer
{
	[super writeJAXBChildElements: writer];
}
@end /* implementation FSV1BasicProperty (JAXB) */
#endif /* FSV1BasicPropertyImplementation */

#ifndef FSV1BasicErrorImplementation
#define FSV1BasicErrorImplementation

/**
 * (no documentation provided)
 */
@implementation FSV1BasicError

/**
 * (no documentation provided)
 */
- (enum FSV1ErrorLevel *) level
{
	return _level;
}

/**
 * (no documentation provided)
 */
- (void) setLevel: (enum FSV1ErrorLevel *) newLevel
{
	if (_level != NULL) {
		free(_level);
	}
	_level = newLevel;
}

/**
 * (no documentation provided)
 */
- (int *) subcode
{
	return _subcode;
}

/**
 * (no documentation provided)
 */
- (void) setSubcode: (int *) newSubcode
{
	if (_subcode != NULL) {
		free(_subcode);
	}
	_subcode = newSubcode;
}

/**
 * (no documentation provided)
 */
- (int) code
{
	return _code;
}

/**
 * (no documentation provided)
 */
- (void) setCode: (int) newCode
{
	_code = newCode;
}

/**
 * (no documentation provided)
 */
- (NSString *) message
{
	return _message;
}

/**
 * (no documentation provided)
 */
- (void) setMessage: (NSString *) newMessage
{
	[newMessage retain];
	[_message release];
	_message = newMessage;
}

/**
 * (no documentation provided)
 */
- (NSString *) details
{
	return _details;
}

/**
 * (no documentation provided)
 */
- (void) setDetails: (NSString *) newDetails
{
	[newDetails retain];
	[_details release];
	_details = newDetails;
}

- (void) dealloc
{
	[self setLevel: NULL];
	[self setSubcode: NULL];
	[self setMessage: nil];
	[self setDetails: nil];
	[super dealloc];
}
@end /* implementation FSV1BasicError */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSV1BasicError (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSV1BasicError (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSV1BasicError (JAXB)

/**
 * Read an instance of FSV1BasicError from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSV1BasicError defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	FSV1BasicError *_fSV1BasicError = [[FSV1BasicError alloc] init];
	NS_DURING
	{
		[_fSV1BasicError initWithReader: reader];
	}
	NS_HANDLER
	{
		[_fSV1BasicError dealloc];
		_fSV1BasicError = nil;
		[localException raise];
	}
	NS_ENDHANDLER
	
	[_fSV1BasicError autorelease];
	return _fSV1BasicError;
}

/**
 * Initialize this instance of FSV1BasicError according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSV1BasicError to the writer.
 * Note that since we're only writing the XML type,
 * No start/end element will be written.
 *
 * @param reader The reader.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	[super writeXMLType:writer];
}

//documentation inherited.
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader
{
	void *_child_accessor;
	
	if ([super readJAXBAttribute: reader]) {
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "level", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}level...");
#endif
		_child_accessor = xmlTextReaderReadFSV1ErrorLevelType(reader);
		if (_child_accessor == NULL) {
			//panic: unable to read the attribute value for some reason.
			[self dealloc];
			[NSException raise: @"XMLReadError"
						format: @"Error reading attribute {}level."];
		}
		[self setLevel: ((enum FSV1ErrorLevel*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}level...");
#endif
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "subcode", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}subcode...");
#endif
		_child_accessor = xmlTextReaderReadIntType(reader);
		if (_child_accessor == NULL) {
			//panic: unable to read the attribute value for some reason.
			[self dealloc];
			[NSException raise: @"XMLReadError"
						format: @"Error reading attribute {}subcode."];
		}
		[self setSubcode: ((int*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}subcode...");
#endif
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "code", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}code...");
#endif
		_child_accessor = xmlTextReaderReadIntType(reader);
		if (_child_accessor == NULL) {
			//panic: unable to read the attribute value for some reason.
			[self dealloc];
			[NSException raise: @"XMLReadError"
						format: @"Error reading attribute {}code."];
		}
		[self setCode: *((int*) _child_accessor)];
		free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}code...");
#endif
		return YES;
	}
	
	return NO;
}

//documentation inherited.
- (BOOL) readJAXBValue: (xmlTextReaderPtr) reader
{
	return [super readJAXBValue: reader];
}

//documentation inherited.
- (BOOL) readJAXBChildElement: (xmlTextReaderPtr) reader
{
	id __child;
	void *_child_accessor;
	int status, depth;
	
	if ([super readJAXBChildElement: reader]) {
		return YES;
	}
	if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
		&& xmlStrcmp(BAD_CAST "message", xmlTextReaderConstLocalName(reader)) == 0
		&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read choice {http://api.familysearch.org/v1}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
		__child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read choice {http://api.familysearch.org/v1}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
		
		[self setMessage: __child];
		return YES;
	} //end "if choice"
	
	if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
		&& xmlStrcmp(BAD_CAST "details", xmlTextReaderConstLocalName(reader)) == 0
		&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read choice {http://api.familysearch.org/v1}details of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
		__child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read choice {http://api.familysearch.org/v1}details of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
		
		[self setDetails: __child];
		return YES;
	} //end "if choice"
	
	
	return NO;
}

//documentation inherited.
- (int) readUnknownJAXBChildElement: (xmlTextReaderPtr) reader
{
	return [super readUnknownJAXBChildElement: reader];
}

//documentation inherited.
- (void) readUnknownJAXBAttribute: (xmlTextReaderPtr) reader
{
	[super readUnknownJAXBAttribute: reader];
}

//documentation inherited.
- (void) writeJAXBAttributes: (xmlTextWriterPtr) writer
{
	int status;
	
	[super writeJAXBAttributes: writer];
	
	if ([self level] != NULL) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "level", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}level."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}level...");
#endif
		status = xmlTextWriterWriteFSV1ErrorLevelType(writer, [self level]);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing attribute {}level."];
		}
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}level...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}level."];
		}
	}
	if ([self subcode] != NULL) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "subcode", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}subcode."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}subcode...");
#endif
		status = xmlTextWriterWriteIntType(writer, [self subcode]);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing attribute {}subcode."];
		}
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}subcode...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}subcode."];
		}
	}
	if (YES) { //always write the primitive attributes...
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "code", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}code."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}code...");
#endif
		status = xmlTextWriterWriteIntType(writer, &_code);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing attribute {}code."];
		}
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}code...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}code."];
		}
	}
}

//documentation inherited.
- (void) writeJAXBValue: (xmlTextWriterPtr) writer
{
	[super writeJAXBValue: writer];
}

/**
 * Method for writing the child elements.
 *
 * @param writer The writer.
 */
- (void) writeJAXBChildElements: (xmlTextWriterPtr) writer
{
	int status;
	id __item;
	NSEnumerator *__enumerator;
	
	[super writeJAXBChildElements: writer];
	
	if ([self message]) {
		status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "message", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start child element {http://api.familysearch.org/v1}message."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing element {http://api.familysearch.org/v1}message...");
#endif
		[[self message] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote element {http://api.familysearch.org/v1}message...");
#endif
		
		status = xmlTextWriterEndElement(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end child element {http://api.familysearch.org/v1}message."];
		}
	}
	if ([self details]) {
		status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "details", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start child element {http://api.familysearch.org/v1}details."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing element {http://api.familysearch.org/v1}details...");
#endif
		[[self details] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote element {http://api.familysearch.org/v1}details...");
#endif
		
		status = xmlTextWriterEndElement(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end child element {http://api.familysearch.org/v1}details."];
		}
	}
}
@end /* implementation FSV1BasicError (JAXB) */
#endif /* FSV1BasicErrorImplementation */

#ifndef FSV1BasicElementImplementation
#define FSV1BasicElementImplementation

/**
 * (no documentation provided)
 */
@implementation FSV1BasicElement

/**
 * (no documentation provided)
 */
- (int *) statusCode
{
	return _statusCode;
}

/**
 * (no documentation provided)
 */
- (void) setStatusCode: (int *) newStatusCode
{
	if (_statusCode != NULL) {
		free(_statusCode);
	}
	_statusCode = newStatusCode;
}

/**
 * (no documentation provided)
 */
- (BOOL *) deprecated
{
	return _deprecated;
}

/**
 * (no documentation provided)
 */
- (void) setDeprecated: (BOOL *) newDeprecated
{
	if (_deprecated != NULL) {
		free(_deprecated);
	}
	_deprecated = newDeprecated;
}

/**
 * (no documentation provided)
 */
- (NSString *) statusMessage
{
	return _statusMessage;
}

/**
 * (no documentation provided)
 */
- (void) setStatusMessage: (NSString *) newStatusMessage
{
	[newStatusMessage retain];
	[_statusMessage release];
	_statusMessage = newStatusMessage;
}

/**
 * (no documentation provided)
 */
- (NSString *) version
{
	return _version;
}

/**
 * (no documentation provided)
 */
- (void) setVersion: (NSString *) newVersion
{
	[newVersion retain];
	[_version release];
	_version = newVersion;
}

/**
 * (no documentation provided)
 */
- (NSArray *) properties
{
	return _properties;
}

/**
 * (no documentation provided)
 */
- (void) setProperties: (NSArray *) newProperties
{
	[newProperties retain];
	[_properties release];
	_properties = newProperties;
}

/**
 * (no documentation provided)
 */
- (NSArray *) errors
{
	return _errors;
}

/**
 * (no documentation provided)
 */
- (void) setErrors: (NSArray *) newErrors
{
	[newErrors retain];
	[_errors release];
	_errors = newErrors;
}

- (void) dealloc
{
	[self setStatusCode: NULL];
	[self setDeprecated: NULL];
	[self setStatusMessage: nil];
	[self setVersion: nil];
	[self setProperties: nil];
	[self setErrors: nil];
	[super dealloc];
}
@end /* implementation FSV1BasicElement */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSV1BasicElement (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSV1BasicElement (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSV1BasicElement (JAXB)

/**
 * Read an instance of FSV1BasicElement from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSV1BasicElement defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	FSV1BasicElement *_fSV1BasicElement = [[FSV1BasicElement alloc] init];
	NS_DURING
	{
		[_fSV1BasicElement initWithReader: reader];
	}
	NS_HANDLER
	{
		[_fSV1BasicElement dealloc];
		_fSV1BasicElement = nil;
		[localException raise];
	}
	NS_ENDHANDLER
	
	[_fSV1BasicElement autorelease];
	return _fSV1BasicElement;
}

/**
 * Initialize this instance of FSV1BasicElement according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSV1BasicElement to the writer.
 * Note that since we're only writing the XML type,
 * No start/end element will be written.
 *
 * @param reader The reader.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	[super writeXMLType:writer];
}

//documentation inherited.
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader
{
	void *_child_accessor;
	
	if ([super readJAXBAttribute: reader]) {
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "statusCode", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}statusCode...");
#endif
		_child_accessor = xmlTextReaderReadIntType(reader);
		if (_child_accessor == NULL) {
			//panic: unable to read the attribute value for some reason.
			[self dealloc];
			[NSException raise: @"XMLReadError"
						format: @"Error reading attribute {}statusCode."];
		}
		[self setStatusCode: ((int*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}statusCode...");
#endif
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "deprecated", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}deprecated...");
#endif
		_child_accessor = xmlTextReaderReadBooleanType(reader);
		if (_child_accessor == NULL) {
			//panic: unable to read the attribute value for some reason.
			[self dealloc];
			[NSException raise: @"XMLReadError"
						format: @"Error reading attribute {}deprecated."];
		}
		[self setDeprecated: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}deprecated...");
#endif
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "statusMessage", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}statusMessage...");
#endif
		[self setStatusMessage: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}statusMessage...");
#endif
		return YES;
	}
	
	if ((xmlStrcmp(BAD_CAST "version", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
		NSLog(@"Attempting to read attribute {}version...");
#endif
		[self setVersion: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully read attribute {}version...");
#endif
		return YES;
	}
	
	return NO;
}

//documentation inherited.
- (BOOL) readJAXBValue: (xmlTextReaderPtr) reader
{
	return [super readJAXBValue: reader];
}

//documentation inherited.
- (BOOL) readJAXBChildElement: (xmlTextReaderPtr) reader
{
	id __child;
	void *_child_accessor;
	int status, depth;
	
	if ([super readJAXBChildElement: reader]) {
		return YES;
	}
	if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
		&& xmlStrcmp(BAD_CAST "properties", xmlTextReaderConstLocalName(reader)) == 0
		&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
		
		if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
			NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/v1}properties...");
#endif
			//start wrapper element "{http://api.familysearch.org/v1}properties"
			depth = xmlTextReaderDepth(reader);
			status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
			while (xmlTextReaderDepth(reader) > depth) {
				if (status < 1) {
					//panic: XML read error.
					[self dealloc];
					[NSException raise: @"XMLReadError"
								format: @"Failure to advance to next wrapped child element."];
				}
				if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
					&& xmlStrcmp(BAD_CAST "property", xmlTextReaderConstLocalName(reader)) == 0
					&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
					
#if DEBUG_ENUNCIATE > 1
					NSLog(@"Attempting to read choice {http://api.familysearch.org/v1}property of type {http://api.familysearch.org/v1}FamilySearchProperty.");
#endif
					
					__child = [FSV1BasicProperty readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
					NSLog(@"successfully read choice {http://api.familysearch.org/v1}property of type {http://api.familysearch.org/v1}FamilySearchProperty.");
#endif
					
					if ([self properties]) {
						[self setProperties: [[self properties] arrayByAddingObject: __child]];
					}
					else {
						[self setProperties: [NSArray arrayWithObject: __child]];
					}
					continue; //continue "while in wrapper element" loop
				} //end "if choice"
				
				status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
				NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/v1}properties...");
#endif
			} // end "while in wrapper element" loop
			
			if (status < 1) {
				//panic: XML read error.
				[self dealloc];
				[NSException raise: @"XMLReadError"
							format: @"Failure to advance to end wrapper element."];
			}
			else {
				//end wrapper element "{http://api.familysearch.org/v1}properties"
				status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
			}
		} //end "if empty element" clause
		else {
			__child = [NSArray array];
			[self setProperties: (NSArray*) __child];
		}
		
		return YES;
	} // end "if wrapper element" clause
	if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
		&& xmlStrcmp(BAD_CAST "errors", xmlTextReaderConstLocalName(reader)) == 0
		&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
		
		if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
			NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/v1}errors...");
#endif
			//start wrapper element "{http://api.familysearch.org/v1}errors"
			depth = xmlTextReaderDepth(reader);
			status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
			while (xmlTextReaderDepth(reader) > depth) {
				if (status < 1) {
					//panic: XML read error.
					[self dealloc];
					[NSException raise: @"XMLReadError"
								format: @"Failure to advance to next wrapped child element."];
				}
				if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
					&& xmlStrcmp(BAD_CAST "error", xmlTextReaderConstLocalName(reader)) == 0
					&& xmlStrcmp(BAD_CAST "http://api.familysearch.org/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
					
#if DEBUG_ENUNCIATE > 1
					NSLog(@"Attempting to read choice {http://api.familysearch.org/v1}error of type {http://api.familysearch.org/v1}FamilySearchError.");
#endif
					
					__child = [FSV1BasicError readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
					NSLog(@"successfully read choice {http://api.familysearch.org/v1}error of type {http://api.familysearch.org/v1}FamilySearchError.");
#endif
					
					if ([self errors]) {
						[self setErrors: [[self errors] arrayByAddingObject: __child]];
					}
					else {
						[self setErrors: [NSArray arrayWithObject: __child]];
					}
					continue; //continue "while in wrapper element" loop
				} //end "if choice"
				
				status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
				NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/v1}errors...");
#endif
			} // end "while in wrapper element" loop
			
			if (status < 1) {
				//panic: XML read error.
				[self dealloc];
				[NSException raise: @"XMLReadError"
							format: @"Failure to advance to end wrapper element."];
			}
			else {
				//end wrapper element "{http://api.familysearch.org/v1}errors"
				status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
			}
		} //end "if empty element" clause
		else {
			__child = [NSArray array];
			[self setErrors: (NSArray*) __child];
		}
		
		return YES;
	} // end "if wrapper element" clause
	
	return NO;
}

//documentation inherited.
- (int) readUnknownJAXBChildElement: (xmlTextReaderPtr) reader
{
	return [super readUnknownJAXBChildElement: reader];
}

//documentation inherited.
- (void) readUnknownJAXBAttribute: (xmlTextReaderPtr) reader
{
	[super readUnknownJAXBAttribute: reader];
}

//documentation inherited.
- (void) writeJAXBAttributes: (xmlTextWriterPtr) writer
{
	int status;
	
	[super writeJAXBAttributes: writer];
	
	if ([self statusCode] != NULL) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "statusCode", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}statusCode."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}statusCode...");
#endif
		status = xmlTextWriterWriteIntType(writer, [self statusCode]);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing attribute {}statusCode."];
		}
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}statusCode...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}statusCode."];
		}
	}
	if ([self deprecated] != NULL) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "deprecated", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}deprecated."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}deprecated...");
#endif
		status = xmlTextWriterWriteBooleanType(writer, [self deprecated]);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing attribute {}deprecated."];
		}
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}deprecated...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}deprecated."];
		}
	}
	if ([self statusMessage]) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "statusMessage", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}statusMessage."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}statusMessage...");
#endif
		[[self statusMessage] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}statusMessage...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}statusMessage."];
		}
	}
	if ([self version]) {
		
		status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "version", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start attribute {}version."];
		}
		
#if DEBUG_ENUNCIATE > 1
		NSLog(@"writing attribute {}version...");
#endif
		[[self version] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
		NSLog(@"successfully wrote attribute {}version...");
#endif
		
		status = xmlTextWriterEndAttribute(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end attribute {}version."];
		}
	}
}

//documentation inherited.
- (void) writeJAXBValue: (xmlTextWriterPtr) writer
{
	[super writeJAXBValue: writer];
}

/**
 * Method for writing the child elements.
 *
 * @param writer The writer.
 */
- (void) writeJAXBChildElements: (xmlTextWriterPtr) writer
{
	int status;
	id __item;
	NSEnumerator *__enumerator;
	
	[super writeJAXBChildElements: writer];
	
	if ([self properties]) {
		status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "properties", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start wrapper element {http://api.familysearch.org/v1}properties."];
		}
		__enumerator = [[self properties] objectEnumerator];
		
		while ( (__item = [__enumerator nextObject]) ) {
			status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "property", NULL);
			if (status < 0) {
				[NSException raise: @"XMLWriteError"
							format: @"Error writing start child element {http://api.familysearch.org/v1}property."];
			}
			
#if DEBUG_ENUNCIATE > 1
			NSLog(@"writing element {http://api.familysearch.org/v1}property...");
#endif
			[__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
			NSLog(@"successfully wrote element {http://api.familysearch.org/v1}property...");
#endif
			
			status = xmlTextWriterEndElement(writer);
			if (status < 0) {
				[NSException raise: @"XMLWriteError"
							format: @"Error writing end child element {http://api.familysearch.org/v1}property."];
			}
		} //end item iterator.
		
		status = xmlTextWriterEndElement(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end wrapper element {http://api.familysearch.org/v1}properties."];
		}
	}
	if ([self errors]) {
		status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "errors", NULL);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing start wrapper element {http://api.familysearch.org/v1}errors."];
		}
		__enumerator = [[self errors] objectEnumerator];
		
		while ( (__item = [__enumerator nextObject]) ) {
			status = xmlTextWriterStartElementNS(writer, BAD_CAST "fsapi_v1", BAD_CAST "error", NULL);
			if (status < 0) {
				[NSException raise: @"XMLWriteError"
							format: @"Error writing start child element {http://api.familysearch.org/v1}error."];
			}
			
#if DEBUG_ENUNCIATE > 1
			NSLog(@"writing element {http://api.familysearch.org/v1}error...");
#endif
			[__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
			NSLog(@"successfully wrote element {http://api.familysearch.org/v1}error...");
#endif
			
			status = xmlTextWriterEndElement(writer);
			if (status < 0) {
				[NSException raise: @"XMLWriteError"
							format: @"Error writing end child element {http://api.familysearch.org/v1}error."];
			}
		} //end item iterator.
		
		status = xmlTextWriterEndElement(writer);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing end wrapper element {http://api.familysearch.org/v1}errors."];
		}
	}
}
@end /* implementation FSV1BasicElement (JAXB) */
#endif /* FSV1BasicElementImplementation */



