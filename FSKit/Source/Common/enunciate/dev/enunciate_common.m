//
//  enunciate_common.m
//  DuplicateSymbolTest
//
//  Created by Logan Allred on 2/6/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "enunciate_common.h"

/**
 * Enunciate-specific C functions.
 */

/*******************xml utilities************************************/

int xmlTextReaderAdvanceToNextStartOrEndElement(xmlTextReaderPtr reader) {
	int status = xmlTextReaderRead(reader);
	while (status && xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT && xmlTextReaderNodeType(reader) != XML_READER_TYPE_END_ELEMENT) {
		status = xmlTextReaderRead(reader);
	}
	return status;
}

int xmlTextReaderSkipElement(xmlTextReaderPtr reader) {
	int status = xmlTextReaderNext(reader);
	while (status && xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT && xmlTextReaderNodeType(reader) != XML_READER_TYPE_END_ELEMENT) {
		status = xmlTextReaderRead(reader);
	}
	return status;
}

xmlChar *xmlTextReaderReadEntireNodeValue(xmlTextReaderPtr reader) {
	xmlChar *buffer = calloc(1, sizeof(xmlChar));
	const xmlChar *snippet;
	int status;
	if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ATTRIBUTE) {
		return xmlTextReaderValue(reader);
	}
	else if (xmlTextReaderIsEmptyElement(reader) == 0) {
		status = xmlTextReaderRead(reader);
		while (status && (xmlTextReaderNodeType(reader) == XML_READER_TYPE_TEXT || xmlTextReaderNodeType(reader) == XML_READER_TYPE_CDATA || xmlTextReaderNodeType(reader) == XML_READER_TYPE_ENTITY_REFERENCE)) {
			snippet = xmlTextReaderConstValue(reader);
			buffer = realloc(buffer, (xmlStrlen(buffer) + xmlStrlen(snippet) + 1) * sizeof(xmlChar));
			xmlStrcat(buffer, snippet);
			status = xmlTextReaderRead(reader);
		}
	}
	return buffer;
}

/*******************base 64 utilities************************************/

/*
 * Base64 Translation Table as described in RFC1113.
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 */
static const char cb64[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

/*
 * Base64 Translation Table to decode (created by author)
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 */
static const char cd64[]="|$$$}rstuvwxyz{$$$$$$$>?@ABCDEFGHIJKLMNOPQRSTUVW$$$$$$XYZ[\\]^_`abcdefghijklmnopq";

/*
 * encode 3 8-bit binary bytes as 4 '6-bit' characters
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 *
 * @param in the block to encode
 * @param out the block to encode to
 * @param len the length of the 'in' block.
 */
void _encode_base64_block(unsigned char in[3], unsigned char out[4], int len) {
	out[0] = cb64[ in[0] >> 2 ];
	out[1] = cb64[ ((in[0] & 0x03) << 4) | ((in[1] & 0xf0) >> 4) ];
	out[2] = (unsigned char) (len > 1 ? cb64[ ((in[1] & 0x0f) << 2) | ((in[2] & 0xc0) >> 6) ] : '=');
	out[3] = (unsigned char) (len > 2 ? cb64[ in[2] & 0x3f ] : '=');
}

/*
 * decode 4 '6-bit' characters into 3 8-bit binary bytes
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 */
void _decode_base64_block( unsigned char in[4], unsigned char out[3] )
{
    out[ 0 ] = (unsigned char ) (in[0] << 2 | in[1] >> 4);
    out[ 1 ] = (unsigned char ) (in[1] << 4 | in[2] >> 2);
    out[ 2 ] = (unsigned char ) (((in[2] << 6) & 0xc0) | in[3]);
}

/*
 * base64 encode a stream adding padding and line breaks as per spec.
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 *
 * @param instream The stream to encode.
 * @param insize The size of the stream to encode.
 * @return The encoded string.
 */
xmlChar *_encode_base64(unsigned char *instream, int insize) {
	unsigned char in[3];
	unsigned char out[4];
	xmlChar *encoded;
	int i, in_index = 0, out_index = 0, blocklen;
	
	if (insize == 0) {
		return BAD_CAST "\0";
	}
	
	encoded = calloc(((insize / 3) * 4) + 10, sizeof(xmlChar));
	while (in_index <= insize) {
		blocklen = 0;
		for (i = 0; i < 3; i++) {
			in[i] = instream[in_index++];
			if (in_index <= insize) {
				blocklen++;
			}
			else {
				in[i] = 0;
			}
		}
		if (blocklen) {
			_encode_base64_block(in, out, blocklen);
			for( i = 0; i < 4; i++ ) {
				encoded[out_index++] = out[i];
			}
		}
	}
	
	return encoded;
}

/*
 * Decode a base64 encoded stream discarding padding, line breaks and noise
 *
 * This code was graciously ripped from http://base64.sourceforge.net
 *
 * @param invalue The string to decode.
 * @param outsize Holder for the length of the returned data.
 * @return The decoded data.
 */
unsigned char *_decode_base64( const xmlChar *invalue, int *outsize ) {
	xmlChar in[4];
	unsigned char out[3], v;
	int i, in_index = 0, out_index = 0, blocklen;
	unsigned char *outstream;
	
	if (invalue == NULL) {
		return NULL;
	}
	
	outstream = calloc(((xmlStrlen(invalue) / 4) * 3) + 1, sizeof(unsigned char));
	while (invalue[in_index] != '\0') {
		for (blocklen = 0, i = 0; i < 4 && invalue[in_index]; i++) {
			v = 0;
			while (invalue[in_index] != '\0' && v == 0) {
				v = (unsigned char) invalue[in_index++];
				v = (unsigned char) ((v < 43 || v > 122) ? 0 : cd64[ v - 43 ]);
				if (v) {
					v = (unsigned char) ((v == '$') ? 0 : v - 61);
				}
			}
			
			if (invalue[in_index] != '\0') {
				blocklen++;
				if (v) {
					in[i] = (unsigned char) (v - 1);
				}
			}
			else {
				in[i] = 0;
			}
		}
		
		if (blocklen) {
			_decode_base64_block( in, out );
			for( i = 0; i < blocklen - 1; i++ ) {
				outstream[out_index++] = out[i];
			}
		}
	}
	
	if (outsize != NULL) {
		*outsize = out_index;
	}
	
	return outstream;
}



/**
 * Implementation of the JAXB type, element, events for a base object.
 */
@implementation NSObject (JAXB)

/**
 * Read the XML type from the reader; an instance of NSXMLElement.
 *
 * @param reader The reader.
 * @return An instance of NSXMLElement
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	return [JAXBBasicXMLNode readXMLType: reader];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	int status, depth;
	if ((self = [self init])) {
		if (xmlTextReaderHasAttributes(reader)) {
			while (xmlTextReaderMoveToNextAttribute(reader)) {
				if ([self readJAXBAttribute: reader] == NO) {
					[self readUnknownJAXBAttribute: reader];
				}
			}
			
			status = xmlTextReaderMoveToElement(reader);
			if (!status) {
				//panic: unable to return to the element node.
				[NSException raise: @"XMLReadError"
							format: @"Error moving back to element position from attributes."];
			}
		}
		
		if ([self readJAXBValue: reader] == NO) {
			//no value handled; attempt to process child elements
			if (xmlTextReaderIsEmptyElement(reader) == 0) {
				depth = xmlTextReaderDepth(reader);//track the depth.
				status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
				while (xmlTextReaderDepth(reader) > depth) {
					if (status < 1) {
						//panic: XML read error.
						[NSException raise: @"XMLReadError"
									format: @"Error handling a child element."];
					}
					else if ([self readJAXBChildElement: reader]) {
						status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
					}
					else {
						status = [self readUnknownJAXBChildElement: reader];
					}
				}
			}
		}
	}
	return self;
}

/**
 * Write the XML type value of this object to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	[self writeJAXBAttributes: writer];
	[self writeJAXBValue: writer];
	[self writeJAXBChildElements: writer];
}

/**
 * Read the XML element from the reader; an instance of NSXMLElement.
 *
 * @param reader The reader.
 * @return An instance of NSXMLElement
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader
{
	return (id<JAXBElement>) [JAXBBasicXMLNode readXMLType: reader];
}

/**
 * No op; root objects don't have an element name/namespace. Subclasses must override.
 *
 * @param writer The writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
	//no-op
}

/**
 * No op; root objects don't have an element name/namespace. Subclasses must override.
 *
 * @param writer The writer.
 * @param writeNs Ignored.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
	//no-op
}

/**
 * No-op; base objects do not handle any attributes.
 *
 * @param reader The reader pointing to the attribute.
 * @return NO
 */
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader
{
	return NO;
}

/**
 * No-op; base objects do not handle any values.
 *
 * @param reader The reader pointing to the element containing a value.
 * @return NO
 */
- (BOOL) readJAXBValue: (xmlTextReaderPtr) reader
{
	return NO;
}

/**
 * No-op; base objects do not handle any child elements.
 *
 * @param reader The reader pointing to the child element.
 * @return NO
 */
- (BOOL) readJAXBChildElement: (xmlTextReaderPtr) reader
{
	return NO;
}

/**
 * No-op; base objects do not handle any attributes.
 *
 * @param reader The reader pointing to the unknown attribute.
 */
- (void) readUnknownJAXBAttribute: (xmlTextReaderPtr) reader
{
}

/**
 * Just skips the unknown element; base objects do not handle any child elements.
 *
 * @param reader The reader pointing to the unknown child element.
 * @return The status of the reader after skipping the unknown child element.
 */
- (int) readUnknownJAXBChildElement: (xmlTextReaderPtr) reader
{
	return xmlTextReaderSkipElement(reader);
}

/**
 * No-op; base objects have no attributes.
 *
 * @param writer The writer.
 */
- (void) writeJAXBAttributes: (xmlTextWriterPtr) writer
{
	//no-op.
}

/**
 * No-op; base objects have no element value.
 *
 * @param writer The writer.
 */
- (void) writeJAXBValue: (xmlTextWriterPtr) writer
{
	//no-op.
}

/**
 * No-op; base objects have no child elements.
 *
 * @param writer The writer.
 */
- (void) writeJAXBChildElements: (xmlTextWriterPtr) writer
{
	//no-op.
}

@end /*NSObject (JAXB)*/

/**
 * Implementation of the JAXB type, element for an xml element.
 */
@implementation JAXBBasicXMLNode

/**
 * Accessor for the (local) name of the XML node.
 *
 * @return The (local) name of the XML node.
 */
- (NSString *) name
{
	return _name;
}

/**
 * Accessor for the (local) name of the XML node.
 *
 * @param newName The (local) name of the XML node.
 */
- (void) setName: (NSString *) newName
{
	[newName retain];
	[_name release];
	_name = newName;
}

/**
 * Accessor for the namespace of the XML node.
 *
 * @return The namespace of the XML node.
 */
- (NSString *) ns
{
	return _ns;
}

/**
 * Accessor for the namespace of the XML node.
 *
 * @param newNs The namespace of the XML node.
 */
- (void) setNs: (NSString *) newNs
{
	[newNs retain];
	[_ns release];
	_ns = newNs;
}

/**
 * Accessor for the namespace prefix of the XML node.
 *
 * @return The namespace prefix of the XML node.
 */
- (NSString *) prefix
{
	return _prefix;
}

/**
 * Accessor for the namespace prefix of the XML node.
 *
 * @param newPrefix The namespace prefix of the XML node.
 */
- (void) setPrefix: (NSString *) newPrefix
{
	[newPrefix retain];
	[_prefix release];
	_prefix = newPrefix;
}

/**
 * Accessor for the value of the XML node.
 *
 * @return The value of the XML node.
 */
- (NSString *) value
{
	return _value;
}

/**
 * Accessor for the value of the XML node.
 *
 * @param newValue The value of the XML node.
 */
- (void) setValue: (NSString *) newValue
{
	[newValue retain];
	[_value release];
	_value = newValue;
}

/**
 * Accessor for the child elements of the XML node.
 *
 * @return The child elements of the XML node.
 */
- (NSArray *) childElements
{
	return _childElements;
}

/**
 * Accessor for the child elements of the XML node.
 *
 * @param newValue The child elements of the XML node.
 */
- (void) setChildElements: (NSArray *) newChildElements
{
	[newChildElements retain];
	[_childElements release];
	_childElements = newChildElements;
}

/**
 * Accessor for the attributes of the XML node.
 *
 * @return The attributes of the XML node.
 */
- (NSArray *) attributes
{
	return _attributes;
}

/**
 * Accessor for the attributes of the XML node.
 *
 * @param newAttributes The attributes of the XML node.
 */
- (void) setAttributes: (NSArray *) newAttributes
{
	[newAttributes retain];
	[_attributes release];
	_attributes = newAttributes;
}

- (void) dealloc {
	[self setName: nil];
	[self setNs: nil];
	[self setPrefix: nil];
	[self setValue: nil];
	[self setChildElements: nil];
	[self setAttributes: nil];
	[super dealloc];
}
@end /*implementation JAXBBasicXMLNode*/

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface JAXBBasicXMLNode (JAXB) <JAXBType, JAXBElement>

@end /*interface JAXBBasicXMLNode (JAXB)*/

@implementation JAXBBasicXMLNode (JAXB)

/**
 * Read the XML type from the reader; an instance of JAXBBasicXMLNode.
 *
 * @param reader The reader.
 * @return An instance of JAXBBasicXMLNode
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	JAXBBasicXMLNode *node = [[JAXBBasicXMLNode alloc] init];
	NS_DURING
	{
		[node initWithReader: reader];
	}
	NS_HANDLER
	{
		[node dealloc];
		node = nil;
		[localException raise];
	}
	NS_ENDHANDLER
	
	[node autorelease];
	return node;
}

/**
 * Read an XML type from an XML reader into an existing instance of JAXBBasicXMLNode.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	int status, depth;
	JAXBBasicXMLNode *child;
	xmlChar *value = NULL;
	const xmlChar *text;
	NSMutableArray *children;
	
	if ((self = [self init])) {
		depth = xmlTextReaderDepth(reader);
		[self setName: [NSString stringWithUTF8String: (const char *) xmlTextReaderLocalName(reader)]];
		[self setNs: [NSString stringWithUTF8String: (const char *) xmlTextReaderNamespaceUri(reader)]];
		[self setPrefix: [NSString stringWithUTF8String: (const char *)xmlTextReaderPrefix(reader)]];
		
		if (xmlTextReaderHasAttributes(reader)) {
			child = nil;
			children = [[NSMutableArray alloc] init];
			while (xmlTextReaderMoveToNextAttribute(reader)) {
				child = [[JAXBBasicXMLNode alloc] init];
				[child setName: [NSString stringWithUTF8String: (const char *) xmlTextReaderLocalName(reader)]];
				[child setNs: [NSString stringWithUTF8String: (const char *)xmlTextReaderNamespaceUri(reader)]];
				[child setPrefix: [NSString stringWithUTF8String: (const char *) xmlTextReaderPrefix(reader)]];
				[child setValue: [NSString stringWithUTF8String: (const char *) xmlTextReaderValue(reader)]];
				[children addObject: child];
			}
			[self setAttributes: children];
			
			status = xmlTextReaderMoveToElement(reader);
			if (status < 1) {
				//panic: unable to return to the element node.
				[NSException raise: @"XMLReadError"
							format: @"Error moving to element from attributes."];
			}
		}
		
		if (xmlTextReaderIsEmptyElement(reader) == 0) {
			children = [[NSMutableArray alloc] init];
			status = xmlTextReaderRead(reader);
			while (status == 1 && xmlTextReaderDepth(reader) > depth) {
				switch (xmlTextReaderNodeType(reader)) {
					case XML_READER_TYPE_ELEMENT:
						child = (JAXBBasicXMLNode *) [JAXBBasicXMLNode readXMLType: reader];
						[children addObject: child];
						break;
					case XML_READER_TYPE_TEXT:
					case XML_READER_TYPE_CDATA:
						text = xmlTextReaderConstValue(reader);
						value = xmlStrncat(value, text, xmlStrlen(text));
						break;
					default:
						//skip anything else.
						break;
				}
				
				status = xmlTextReaderRead(reader);
			}
			
			if (status < 1) {
				//panic: xml read error
				[NSException raise: @"XMLReadError"
							format: @"Error reading child elements."];
			}
			
			if ([children count] > 0) {
				[self setChildElements: children];
			}
			
			if (value != NULL) {
				[self setValue: [NSString stringWithUTF8String: (const char *) value]];
			}
			
		}
	}
	
	return self;
}

/**
 * Read the XML element from the reader; an instance of NSXMLElement.
 *
 * @param reader The reader.
 * @return An instance of NSXMLElement
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader
{
	return (id<JAXBElement>) [JAXBBasicXMLNode readXMLType: reader];
}

/**
 * Write the basic node to an xml writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	int status;
	NSEnumerator *enumerator;
	JAXBBasicXMLNode *child;
	xmlChar *childns, *childname, *childprefix, *childvalue;
	
	status = xmlTextWriterStartElementNS(writer, _prefix ? BAD_CAST [_prefix UTF8String] : NULL, _name ? BAD_CAST [_name UTF8String] : NULL, _ns ? BAD_CAST [_ns UTF8String] : NULL);
	if (status < 0) {
		childns = BAD_CAST "";
		if (_ns) {
			childns = BAD_CAST [_ns UTF8String];
		}
		
		childname = BAD_CAST "";
		if (_name) {
			childname = BAD_CAST [_name UTF8String];
		}
		
		[NSException raise: @"XMLWriteError"
					format: @"Error writing start element {%s}%s for JAXBBasicXMLNode.", childns, childname];
	}
	
	if (_attributes) {
		enumerator = [_attributes objectEnumerator];
		while ( (child = (JAXBBasicXMLNode *)[enumerator nextObject]) ) {
			childns = NULL;
			if ([child ns]) {
				childns = BAD_CAST [[child ns] UTF8String];
			}
			
			childprefix = NULL;
			if ([child prefix]) {
				childprefix = BAD_CAST [[child prefix] UTF8String];
			}
			
			childname = NULL;
			if ([child name]) {
				childname = BAD_CAST [[child name] UTF8String];
			}
			
			childvalue = NULL;
			if ([child value]) {
				childvalue = BAD_CAST [[child value] UTF8String];
			}
			
			status = xmlTextWriterWriteAttributeNS(writer, childprefix, childname, childns, childvalue);
			if (status < 0) {
				[NSException raise: @"XMLWriteError"
							format: @"Error writing attribute {%s}%s for JAXBBasicXMLNode.", childns, childname];
			}
		}
	}
	
	if (_value) {
		status = xmlTextWriterWriteString(writer, BAD_CAST [_value UTF8String]);
		if (status < 0) {
			[NSException raise: @"XMLWriteError"
						format: @"Error writing value of JAXBBasicXMLNode."];
		}
	}
	
	if (_childElements) {
		enumerator = [_childElements objectEnumerator];
		while ( (child = [enumerator nextObject]) ) {
			[child writeXMLType: writer];
		}
	}
	
	status = xmlTextWriterEndElement(writer);
	if (status < 0) {
		childns = BAD_CAST "";
		if (_ns) {
			childns = BAD_CAST [_ns UTF8String];
		}
		
		childname = BAD_CAST "";
		if (_name) {
			childname = BAD_CAST [_name UTF8String];
		}
		
		[NSException raise: @"XMLWriteError"
					format: @"Error writing end element {%s}%s for JAXBBasicXMLNode.", childns, childname];
	}
}

/**
 * Writes this node to a writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
	[self writeXMLType: writer];
}

/**
 * Writes this node to a writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
	[self writeXMLType: writer];
}

@end /* implementation JAXBBasicXMLNode (JAXB) */

/**
 * Declaration of the JAXB type for a string.
 */
@interface NSString (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a string.
 */
@implementation NSString (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSString that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	return [NSString stringWithUTF8String: (const char *) xmlTextReaderReadEntireNodeValue(reader)];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing string cannot be modified."];
	return nil;
}

/**
 * Write the NSString to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	xmlTextWriterWriteString(writer, BAD_CAST [self UTF8String]);
}

@end /*NSString (JAXBType)*/



/**
 * Declaration of the JAXB type for a big number.
 */
@interface NSNumber (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a big number.
 */
@implementation NSNumber (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSNumber that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	return [NSNumber numberWithLongLong: [[NSString stringWithUTF8String: (const char *) xmlTextReaderReadEntireNodeValue(reader)] longLongValue]];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing number cannot be modified."];
	return nil;
}

/**
 * Write the NSNumber to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	xmlTextWriterWriteString(writer, BAD_CAST [[self description] UTF8String]);
}

@end /*NSNumber (JAXBType)*/



/**
 * Declaration of the JAXB type for a big number.
 */
@interface NSDecimalNumber (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a big number.
 */
@implementation NSDecimalNumber (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSDecimalNumber that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	return [NSDecimalNumber decimalNumberWithString: [NSString stringWithUTF8String: (const char *) xmlTextReaderReadEntireNodeValue(reader)]];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing decimal number cannot be modified."];
	return nil;
}

/**
 * Write the NSDecimalNumber to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	xmlTextWriterWriteString(writer, BAD_CAST [[self description] UTF8String]);
}

@end /*NSDecimalNumber (JAXBType)*/



/**
 * Declaration of the JAXB type for a url.
 */
@interface NSURL (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a url.
 */
@implementation NSURL (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSURL that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	return [NSURL URLWithString: [NSString stringWithUTF8String: (const char *) xmlTextReaderReadEntireNodeValue(reader)]];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing url cannot be modified."];
	return nil;
}

/**
 * Write the NSURL to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	xmlTextWriterWriteString(writer, BAD_CAST [[self absoluteString] UTF8String]);
}

@end /*NSURL (JAXBType)*/



/**
 * Declaration of the JAXB type for binary data.
 */
@interface NSData (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a binary data.
 */
@implementation NSData (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSData that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	xmlChar *base64data = xmlTextReaderReadEntireNodeValue(reader);
	int len;
	unsigned char *data = _decode_base64(base64data, &len);
	NSData *wrappedData = [NSData dataWithBytesNoCopy: data length: len];
	free(base64data);
	return wrappedData;
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing NSData cannot be modified."];
	return nil;
}

/**
 * Write the NSData to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	xmlChar *out = _encode_base64((unsigned char *)[self bytes], [self length]);
	xmlTextWriterWriteString(writer, out);
	free(out);
}

@end /*NSData (JAXBType)*/



/**
 * Declaration of the JAXB type for a big number.
 */
@interface NSDate (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a big number.
 */
@implementation NSDate (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSDate that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
	xmlChar *timevalue = xmlTextReaderReadEntireNodeValue(reader);
	NSInteger year = 0;
	NSUInteger month = 1, day = 1, hour = 0, minute = 0, second = 0;
	BOOL skip_time = NO;
	int index = 0, token_index = 0, len = xmlStrlen(timevalue), offset_hour = 0, offset_minute = 0;
	char token[len];
	
	if (len > (index + 5) && timevalue[index + 4] == '-') {
		//assume we're at yyyy-MM-dd
		token_index = 0;
		while (index < len && timevalue[index] != '-') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index != 4) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid year: %s", timevalue, token];
		}
		year = atoi(token);
		index++;
		
		//go to next '-' character.
		token_index = 0;
		while (index < len && timevalue[index] != '-') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index != 2) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid month: %s", timevalue, token];
		}
		month = atoi(token);
		index++;
		
		//go to 'T', 'Z', '+', or '-' character.
		token_index = 0;
		while (index < len && timevalue[index] != 'T' && timevalue[index] != 'Z' && timevalue[index] != '-' && timevalue[index] != '+') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index != 2) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid day of month: %s", timevalue, token];
		}
		day = atoi(token);
		if (timevalue[index] != 'T') {
			skip_time = YES;
		}
		if (timevalue[index] != '-') {
			index++;
		}
	}
	
	if (skip_time == NO || (len > (index + 3) && timevalue[index + 2] == ':')) {
		//assume we're at HH:mm:ss
		
		//go to ':' character.
		token_index = 0;
		while (index < len && timevalue[index] != ':') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index != 2) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid hour: %s", timevalue, token];
		}
		hour = atoi(token);
		index++;
		
		//go to ':' character.
		token_index = 0;
		while (index < len && timevalue[index] != ':') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index != 2) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid minute: %s", timevalue, token];
		}
		minute = atoi(token);
		index++;
		
		//go to '+' or '-' or 'Z' character.
		token_index = 0;
		while (index < len && timevalue[index] != '+' && timevalue[index] != '-' && timevalue[index] != 'Z') {
			token[token_index++] = timevalue[index++];
		}
		token[token_index] = '\0';
		if (token_index == 0) {
			[NSException raise: @"XMLReadError"
						format: @"Unable to read dateTime %s; invalid seconds: %s", timevalue, token];
		}
		second = (NSUInteger) atof(token);
		if (timevalue[index] != '-') {
			index++;
		}
	}
	
	//go to ':' character.
	token_index = 0;
	while (index < len && timevalue[index] != ':') {
		token[token_index++] = timevalue[index++];
	}
	token[token_index] = '\0';
	offset_hour += atoi(token);
	index++;
	
	//go to end.
	token_index = 0;
	while (index < len) {
		token[token_index++] = timevalue[index++];
	}
	token[token_index] = '\0';
	offset_minute += atoi(token);
	
	//YYYY-MM-DD HH:MM:SS -HHHMM
	free(timevalue);
	return [NSDate dateWithString: [NSString stringWithFormat: @"%04i-%02i-%02i %02i:%02i:%02i %+03i%02i", year, month, day, hour, minute, second, offset_hour, offset_minute]];
}

/**
 * Read an XML type from an XML reader into an existing instance.
 *
 * @param reader The reader.
 * @param existing The existing instance into which to read values.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
	[NSException raise: @"XMLReadError"
				format: @"An existing date cannot be modified."];
	return nil;
}

/**
 * Write the NSDate to the writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] initWithDateFormat: @"%Y-%m-%dT%H:%M:%S %z" allowNaturalLanguage: NO];
	xmlChar *timevalue = BAD_CAST [[formatter stringForObjectValue: self] UTF8String];
	timevalue[19] = timevalue[20];
	timevalue[20] = timevalue[21];
	timevalue[21] = timevalue[22];
	timevalue[22] = ':';
	xmlTextWriterWriteString(writer, timevalue);
	[formatter release];
}
@end /*NSDate (JAXBType)*/


/*******************boolean************************************/

/**
 * Read a boolean value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return YES if "true" was read. NO otherwise.
 */
BOOL *xmlTextReaderReadBooleanType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	BOOL *value = malloc(sizeof(BOOL));
	*value = (xmlStrcmp(BAD_CAST "true", nodeValue) == 0) ? YES : NO;
	free(nodeValue);
	return value;
}

/**
 * Write a boolean value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteBooleanType(xmlTextWriterPtr writer, BOOL *value) {
	if (*value) {
		return xmlTextWriterWriteString(writer, BAD_CAST "false");
	}
	else {
		return xmlTextWriterWriteString(writer, BAD_CAST "true");
	}
}

/*******************byte************************************/

/**
 * Read a byte value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the byte.
 */
unsigned char *xmlTextReaderReadByteType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	unsigned char *value = malloc(sizeof(unsigned char));
	*value = (unsigned char) atoi((char *) nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a byte value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteByteType(xmlTextWriterPtr writer, unsigned char *value) {
	return xmlTextWriterWriteFormatString(writer, "%i", *value);
}

/*******************double************************************/

/**
 * Read a double value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the double.
 */
double *xmlTextReaderReadDoubleType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	double *value = malloc(sizeof(double));
	*value = atof((char *) nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a double value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteDoubleType(xmlTextWriterPtr writer, double *value) {
	return xmlTextWriterWriteFormatString(writer, "%f", *value);
}

/*******************float************************************/

/**
 * Read a float value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the float.
 */
float *xmlTextReaderReadFloatType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	float *value = malloc(sizeof(float));
	*value = atof((char *)nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a float value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteFloatType(xmlTextWriterPtr writer, float *value) {
	return xmlTextWriterWriteFormatString(writer, "%f", *value);
}

/*******************int************************************/

/**
 * Read a int value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @param value The value to be written.
 * @return the int.
 */
int *xmlTextReaderReadIntType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	int *value = malloc(sizeof(int));
	*value = atoi((char *)nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a int value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteIntType(xmlTextWriterPtr writer, int *value) {
	return xmlTextWriterWriteFormatString(writer, "%i", *value);
}

/*******************long************************************/

/**
 * Read a long value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the long.
 */
long *xmlTextReaderReadLongType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	long *value = malloc(sizeof(long));
	*value = atol((char *)nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a long value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteLongType(xmlTextWriterPtr writer, long *value) {
	return xmlTextWriterWriteFormatString(writer, "%ld", *value);
}

/*******************short************************************/

/**
 * Read a short value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the short.
 */
short *xmlTextReaderReadShortType(xmlTextReaderPtr reader) {
	xmlChar *nodeValue = xmlTextReaderReadEntireNodeValue(reader);
	short *value = malloc(sizeof(short));
	*value = atoi((char *)nodeValue);
	free(nodeValue);
	return value;
}

/**
 * Write a short value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteShortType(xmlTextWriterPtr writer, short *value) {
	return xmlTextWriterWriteFormatString(writer, "%hi", *value);
}

/*******************char************************************/

/**
 * Read a character value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the character.
 */
xmlChar *xmlTextReaderReadCharacterType(xmlTextReaderPtr reader) {
	return xmlTextReaderReadEntireNodeValue(reader);
}

/**
 * Write a character value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
int xmlTextWriterWriteCharacterType(xmlTextWriterPtr writer, xmlChar *value) {
	return xmlTextWriterWriteString(writer, value);
}



