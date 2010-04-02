#import <temple.h>

/**
 * Enunciate-specific C functions.
 */
#ifndef ENUNCIATE_C_UTILITIES
#define ENUNCIATE_C_UTILITIES

/*******************xml utilities************************************/

static int xmlTextReaderAdvanceToNextStartOrEndElement(xmlTextReaderPtr reader) {
  int status = xmlTextReaderRead(reader);
  while (status && xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT && xmlTextReaderNodeType(reader) != XML_READER_TYPE_END_ELEMENT) {
    status = xmlTextReaderRead(reader);
  }
  return status;
}

static int xmlTextReaderSkipElement(xmlTextReaderPtr reader) {
  int status = xmlTextReaderNext(reader);
  while (status && xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT && xmlTextReaderNodeType(reader) != XML_READER_TYPE_END_ELEMENT) {
    status = xmlTextReaderRead(reader);
  }
  return status;
}

static xmlChar *xmlTextReaderReadEntireNodeValue(xmlTextReaderPtr reader) {
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
static void _encode_base64_block(unsigned char in[3], unsigned char out[4], int len) {
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
static void _decode_base64_block( unsigned char in[4], unsigned char out[3] )
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

#endif /* ENUNCIATE_C_UTILITIES */

#ifndef ENUNCIATE_OBJC_CLASSES
#define ENUNCIATE_OBJC_CLASSES

/**
 * Protocol defining a JAXB (see https://jaxb.dev.java.net/) type.
 */
@protocol JAXBType

/**
 * Read an XML type from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of the object defining the JAXB type.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader;

/**
 * Initialize the object with an XML reader.
 *
 * @param reader The XML reader from which to initialize the values of this type.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader;

/**
 * Write this instance of a JAXB type to a writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer;

@end /*protocol JAXBType*/


/**
 * Protocol defining a JAXB (see https://jaxb.dev.java.net/) element.
 */
@protocol JAXBElement

/**
 * Read the XML element from an XML reader. It is assumed
 * that the reader is pointing at the start element (be careful
 * that it's not still pointing to the XML document).
 *
 * @param reader The reader.
 * @return An instance of the object defining the JAXB element.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader;

/**
 * Write this instance of a JAXB element to a writer.
 *
 * @param writer The writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer;

/**
 * Write this instance of a JAXB element to a writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs;

@end /*protocol JAXBElement*/


/**
 * Protocol defining methods for events that occur
 * when reading/parsing XML. Intended for internal
 * use only.
 */
@protocol JAXBReading

/**
 * Method for reading an attribute.
 *
 * @param reader The reader pointing to the attribute.
 * @return Whether the attribute was read.
 */
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader;

/**
 * Method for reading the value of an element.
 *
 * @param reader The reader pointing to the element containing a value.
 * @return Whether the value was read.
 */
- (BOOL) readJAXBValue: (xmlTextReaderPtr) reader;

/**
 * Method for reading a child element. If (and only if) the child
 * element was handled, the element in the reader should be
 * "consumed" and the reader will be pointing to the end element.
 *
 * @param reader The reader pointing to the child element.
 * @return Whether the child element was read.
 */
- (BOOL) readJAXBChildElement: (xmlTextReaderPtr) reader;

/**
 * Method for reading an unknown attribute.
 *
 * @param reader The reader pointing to the unknown attribute.
 * @return Whether the attribute was read.
 */
- (void) readUnknownJAXBAttribute: (xmlTextReaderPtr) reader;

/**
 * Method for reading an unknown child element. Implementations
 * must be responsible for "consuming" the child element.
 *
 * @param reader The reader pointing to the unknown child element.
 * @return The status of the reader after having consumed the unknown child element.
 */
- (int) readUnknownJAXBChildElement: (xmlTextReaderPtr) reader;

@end /*protocol JAXBReading*/

/**
 * Protocol defining methods for events that occur
 * when writing XML. Intended for internal
 * use only.
 */
@protocol JAXBWriting

/**
 * Method for writing the attributes.
 *
 * @param writer The writer.
 */
- (void) writeJAXBAttributes: (xmlTextWriterPtr) writer;

/**
 * Method for writing the element value.
 *
 * @param writer The writer.
 */
- (void) writeJAXBValue: (xmlTextWriterPtr) writer;

/**
 * Method for writing the child elements.
 *
 * @param writer The writer.
 */
- (void) writeJAXBChildElements: (xmlTextWriterPtr) writer;

@end /*protocol JAXBWriting*/

/**
 * Declaration of the JAXB type, element, events for a base object.
 */
@interface NSObject (JAXB) <JAXBType, JAXBElement, JAXBReading, JAXBWriting>

@end

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
  return [NSCalendarDate readXMLType: reader];
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



/**
 * Declaration of the JAXB type for a big number.
 */
@interface NSCalendarDate (JAXBType) <JAXBType>
@end

/**
 * Implementation of the JAXB type for a big number.
 */
@implementation NSCalendarDate (JAXBType)

/**
 * Read the XML type from the reader.
 *
 * @param reader The reader.
 * @return The NSCalendarDate that was read from the reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  xmlChar *timevalue = xmlTextReaderReadEntireNodeValue(reader);
  NSInteger year = 0;
  NSUInteger month = 1, day = 1, hour = 0, minute = 0, second = 0;
  NSTimeZone *tz = nil;
  BOOL skip_time = NO;
  int index = 0, token_index = 0, len = xmlStrlen(timevalue), offset_seconds = 0;
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
  offset_seconds += atoi(token) * 60 * 60;
  index++;

  //go to end.
  token_index = 0;
  while (index < len) {
    token[token_index++] = timevalue[index++];
  }
  token[token_index] = '\0';
  offset_seconds += atoi(token) * 60;

  tz = [NSTimeZone timeZoneForSecondsFromGMT: offset_seconds];
  free(timevalue);
  return [NSCalendarDate dateWithYear: year month: month day: day hour: hour minute: minute second: second timeZone: tz];
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
  [super writeXMLType: writer];
}

@end /*NSCalendarDate (JAXBType)*/
#endif /* ENUNCIATE_OBJC_CLASSES */

#ifndef ENUNCIATE_XML_OBJC_PRIMITIVE_FUNCTIONS
#define ENUNCIATE_XML_OBJC_PRIMITIVE_FUNCTIONS

/*******************boolean************************************/

/**
 * Read a boolean value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return YES if "true" was read. NO otherwise.
 */
static BOOL *xmlTextReaderReadBooleanType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteBooleanType(xmlTextWriterPtr writer, BOOL *value) {
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
static unsigned char *xmlTextReaderReadByteType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteByteType(xmlTextWriterPtr writer, unsigned char *value) {
  return xmlTextWriterWriteFormatString(writer, "%i", *value);
}

/*******************double************************************/

/**
 * Read a double value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the double.
 */
static double *xmlTextReaderReadDoubleType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteDoubleType(xmlTextWriterPtr writer, double *value) {
  return xmlTextWriterWriteFormatString(writer, "%f", *value);
}

/*******************float************************************/

/**
 * Read a float value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the float.
 */
static float *xmlTextReaderReadFloatType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteFloatType(xmlTextWriterPtr writer, float *value) {
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
static int *xmlTextReaderReadIntType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteIntType(xmlTextWriterPtr writer, int *value) {
  return xmlTextWriterWriteFormatString(writer, "%i", *value);
}

/*******************long************************************/

/**
 * Read a long value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the long.
 */
static long *xmlTextReaderReadLongType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteLongType(xmlTextWriterPtr writer, long *value) {
  return xmlTextWriterWriteFormatString(writer, "%ld", *value);
}

/*******************short************************************/

/**
 * Read a short value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the short.
 */
static short *xmlTextReaderReadShortType(xmlTextReaderPtr reader) {
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
static int xmlTextWriterWriteShortType(xmlTextWriterPtr writer, short *value) {
  return xmlTextWriterWriteFormatString(writer, "%h", *value);
}

/*******************char************************************/

/**
 * Read a character value from the reader.
 *
 * @param reader The reader (pointing at a node with a value).
 * @return the character.
 */
static xmlChar *xmlTextReaderReadCharacterType(xmlTextReaderPtr reader) {
  return xmlTextReaderReadEntireNodeValue(reader);
}

/**
 * Write a character value to the writer.
 *
 * @param writer The writer.
 * @param value The value to be written.
 * @return the bytes written (may be 0 because of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteCharacterType(xmlTextWriterPtr writer, xmlChar *value) {
  return xmlTextWriterWriteString(writer, value);
}

#endif /* ENUNCIATE_XML_OBJC_PRIMITIVE_FUNCTIONS */


/**
 *  A list of temples.

 @author Rob Lyon

 */
@implementation FSTEMPLEV1Temples

/**
 * the number of temples.
 */
- (int) count
{
  return _count;
}

/**
 * the number of temples.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * a list of temples.
 */
- (NSArray *) templeItems
{
  return _templeItems;
}

/**
 * a list of temples.
 */
- (void) setTempleItems: (NSArray *) newTempleItems
{
  [newTempleItems retain];
  [_templeItems release];
  _templeItems = newTempleItems;
}

- (void) dealloc
{
  [self setTempleItems: nil];
  [super dealloc];
}
@end /* implementation FSTEMPLEV1Temples */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSTEMPLEV1Temples (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSTEMPLEV1Temples (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSTEMPLEV1Temples (JAXB)

/**
 * Read an instance of FSTEMPLEV1Temples from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSTEMPLEV1Temples defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSTEMPLEV1Temples *_fSTEMPLEV1Temples = [[FSTEMPLEV1Temples alloc] init];
  NS_DURING
  {
    [_fSTEMPLEV1Temples initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSTEMPLEV1Temples dealloc];
    _fSTEMPLEV1Temples = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSTEMPLEV1Temples autorelease];
  return _fSTEMPLEV1Temples;
}

/**
 * Initialize this instance of FSTEMPLEV1Temples according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSTEMPLEV1Temples to the writer.
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

  if ((xmlStrcmp(BAD_CAST "count", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}count...");
#endif
    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}count."];
    }
    [self setCount: *((int*) _child_accessor)];
    free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}count...");
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
    && xmlStrcmp(BAD_CAST "temple", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/temple/v1}temple of type {http://api.familysearch.org/temple/v1}temple.");
#endif

    __child = [FSTEMPLEV1Temple readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/temple/v1}temple of type {http://api.familysearch.org/temple/v1}temple.");
#endif

    if ([self templeItems]) {
      [self setTempleItems: [[self templeItems] arrayByAddingObject: __child]];
    }
    else {
      [self setTempleItems: [NSArray arrayWithObject: __child]];
    }
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

  if (YES) { //always write the primitive attributes...

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "count", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}count."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}count...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_count);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}count."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}count...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}count."];
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

  if ([self templeItems]) {
    __enumerator = [[self templeItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "temple", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/temple/v1}temple."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/temple/v1}temple...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}temple...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/temple/v1}temple."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSTEMPLEV1Temples (JAXB) */

/**
 *  A temple.

 @author Rob Lyon

 */
@implementation FSTEMPLEV1Temple

/**
 * the code of the temple.
 */
- (NSString *) code
{
  return _code;
}

/**
 * the code of the temple.
 */
- (void) setCode: (NSString *) newCode
{
  [newCode retain];
  [_code release];
  _code = newCode;
}

/**
 * the name of the temple.
 */
- (NSString *) name
{
  return _name;
}

/**
 * the name of the temple.
 */
- (void) setName: (NSString *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

/**
 * the district of the temple.
 */
- (long *) district
{
  return _district;
}

/**
 * the district of the temple.
 */
- (void) setDistrict: (long *) newDistrict
{
  if (_district != NULL) {
    free(_district);
  }
  _district = newDistrict;
}

/**
 * the location of the temple.
 */
- (NSString *) location
{
  return _location;
}

/**
 * the location of the temple.
 */
- (void) setLocation: (NSString *) newLocation
{
  [newLocation retain];
  [_location release];
  _location = newLocation;
}

/**
 * the dedication date of the temple.
 */
- (NSString *) dedicationDate
{
  return _dedicationDate;
}

/**
 * the dedication date of the temple.
 */
- (void) setDedicationDate: (NSString *) newDedicationDate
{
  [newDedicationDate retain];
  [_dedicationDate release];
  _dedicationDate = newDedicationDate;
}

- (void) dealloc
{
  [self setCode: nil];
  [self setName: nil];
  [self setDistrict: NULL];
  [self setLocation: nil];
  [self setDedicationDate: nil];
  [super dealloc];
}
@end /* implementation FSTEMPLEV1Temple */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSTEMPLEV1Temple (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSTEMPLEV1Temple (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSTEMPLEV1Temple (JAXB)

/**
 * Read an instance of FSTEMPLEV1Temple from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSTEMPLEV1Temple defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSTEMPLEV1Temple *_fSTEMPLEV1Temple = [[FSTEMPLEV1Temple alloc] init];
  NS_DURING
  {
    [_fSTEMPLEV1Temple initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSTEMPLEV1Temple dealloc];
    _fSTEMPLEV1Temple = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSTEMPLEV1Temple autorelease];
  return _fSTEMPLEV1Temple;
}

/**
 * Initialize this instance of FSTEMPLEV1Temple according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSTEMPLEV1Temple to the writer.
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

  if ((xmlStrcmp(BAD_CAST "code", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}code...");
#endif
    [self setCode: (NSString*) [NSString readXMLType: reader]];
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
    && xmlStrcmp(BAD_CAST "name", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/temple/v1}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/temple/v1}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setName: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "district", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadLongType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDistrict: ((long*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "location", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/temple/v1}location of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/temple/v1}location of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setLocation: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "dedicationDate", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/temple/v1}dedicationDate of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/temple/v1}dedicationDate of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setDedicationDate: __child];
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

  if ([self code]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "code", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}code."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}code...");
#endif
    [[self code] writeXMLType: writer];
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

  if ([self name]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/temple/v1}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/temple/v1}name...");
#endif
    [[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}name...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/temple/v1}name."];
    }
  }
  if ([self district] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "district", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/temple/v1}district."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/temple/v1}district...");
#endif
    status = xmlTextWriterWriteLongType(writer, [self district]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}district...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/temple/v1}district."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/temple/v1}district."];
    }
  }
  if ([self location]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "location", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/temple/v1}location."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/temple/v1}location...");
#endif
    [[self location] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}location...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/temple/v1}location."];
    }
  }
  if ([self dedicationDate]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "dedicationDate", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/temple/v1}dedicationDate."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/temple/v1}dedicationDate...");
#endif
    [[self dedicationDate] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}dedicationDate...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/temple/v1}dedicationDate."];
    }
  }
}
@end /* implementation FSTEMPLEV1Temple (JAXB) */

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

/**
 * Reads a ErrorLevel from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ErrorLevel, or NULL if unable to be read.
 */
static enum FSV1ErrorLevel *xmlTextReaderReadFSV1ErrorLevelType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSV1ErrorLevel *value = calloc(1, sizeof(enum FSV1ErrorLevel));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Info") == 0) {
      *value = TEMPLE_FSAPI_V1_ERRORLEVEL_INFO;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Warn") == 0) {
      *value = TEMPLE_FSAPI_V1_ERRORLEVEL_WARN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Error") == 0) {
      *value = TEMPLE_FSAPI_V1_ERRORLEVEL_ERROR;
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
static int xmlTextWriterWriteFSV1ErrorLevelType(xmlTextWriterPtr writer, enum FSV1ErrorLevel *_errorLevel)
{
  switch (*_errorLevel) {
    case TEMPLE_FSAPI_V1_ERRORLEVEL_INFO:
      return xmlTextWriterWriteString(writer, BAD_CAST "Info");
    case TEMPLE_FSAPI_V1_ERRORLEVEL_WARN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Warn");
    case TEMPLE_FSAPI_V1_ERRORLEVEL_ERROR:
      return xmlTextWriterWriteString(writer, BAD_CAST "Error");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

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

- (void) dealloc
{
  [self setStatusCode: NULL];
  [self setDeprecated: NULL];
  [self setStatusMessage: nil];
  [self setVersion: nil];
  [self setErrors: nil];
  [self setProperties: nil];
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
}
@end /* implementation FSV1BasicElement (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSTEMPLEV1TempleRootElement

/**
 * The temples.
 */
- (FSTEMPLEV1Temples *) temples
{
  return _temples;
}

/**
 * The temples.
 */
- (void) setTemples: (FSTEMPLEV1Temples *) newTemples
{
  [newTemples retain];
  [_temples release];
  _temples = newTemples;
}

- (void) dealloc
{
  [self setTemples: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSTEMPLEV1TempleRootElement *_fSTEMPLEV1TempleRootElement;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSTEMPLEV1TempleRootElement = (FSTEMPLEV1TempleRootElement *) [FSTEMPLEV1TempleRootElement readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSTEMPLEV1TempleRootElement;
}

//documentation inherited.
- (NSData *) writeToXML
{
  xmlBufferPtr buf;
  xmlTextWriterPtr writer;
  int rc;
  NSData *data;

  buf = xmlBufferCreate();
  if (buf == NULL) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error creating an XML buffer."];
    return nil;
  }

  writer = xmlNewTextWriterMemory(buf, 0);
  if (writer == NULL) {
    xmlBufferFree(buf);
    [NSException raise: @"XMLWriteError"
                 format: @"Error creating an XML writer."];
    return nil;
  }

  rc = xmlTextWriterStartDocument(writer, NULL, "utf-8", NULL);
  if (rc < 0) {
    xmlFreeTextWriter(writer);
    xmlBufferFree(buf);
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing XML start document."];
    return nil;
  }

  NS_DURING
  {
    [self writeXMLElement: writer];
  }
  NS_HANDLER
  {
    xmlFreeTextWriter(writer);
    xmlBufferFree(buf);
    [localException raise];
  }
  NS_ENDHANDLER

  rc = xmlTextWriterEndDocument(writer);
  if (rc < 0) {
    xmlFreeTextWriter(writer);
    xmlBufferFree(buf);
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing XML end document."];
    return nil;
  }

  xmlFreeTextWriter(writer);
  data = [NSData dataWithBytes: buf->content length: buf->use];
  xmlBufferFree(buf);
  return data;
}
@end /* implementation FSTEMPLEV1TempleRootElement */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSTEMPLEV1TempleRootElement (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSTEMPLEV1TempleRootElement (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSTEMPLEV1TempleRootElement (JAXB)

/**
 * Read an instance of FSTEMPLEV1TempleRootElement from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSTEMPLEV1TempleRootElement defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSTEMPLEV1TempleRootElement *_fSTEMPLEV1TempleRootElement = [[FSTEMPLEV1TempleRootElement alloc] init];
  NS_DURING
  {
    [_fSTEMPLEV1TempleRootElement initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSTEMPLEV1TempleRootElement dealloc];
    _fSTEMPLEV1TempleRootElement = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSTEMPLEV1TempleRootElement autorelease];
  return _fSTEMPLEV1TempleRootElement;
}

/**
 * Initialize this instance of FSTEMPLEV1TempleRootElement according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSTEMPLEV1TempleRootElement to the writer.
 * Note that since we're only writing the XML type,
 * No start/end element will be written.
 *
 * @param reader The reader.
 */
- (void) writeXMLType: (xmlTextWriterPtr) writer
{
  [super writeXMLType:writer];
}

/**
 * Reads a FSTEMPLEV1TempleRootElement from an XML reader. The element to be read is
 * "{http://api.familysearch.org/temple/v1}temple".
 *
 * @param reader The XML reader.
 * @return The FSTEMPLEV1TempleRootElement.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSTEMPLEV1TempleRootElement *_templeRootElement = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/temple/v1}temple."];
    }
  }

  if (xmlStrcmp(BAD_CAST "temple", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/temple/v1}temple.");
#endif
    _templeRootElement = (FSTEMPLEV1TempleRootElement *)[FSTEMPLEV1TempleRootElement readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/temple/v1}temple.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSTEMPLEV1TempleRootElement. Expected element {http://api.familysearch.org/temple/v1}temple. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSTEMPLEV1TempleRootElement. Expected element {http://api.familysearch.org/temple/v1}temple. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _templeRootElement;
}

/**
 * Writes this FSTEMPLEV1TempleRootElement to XML under element name "{http://api.familysearch.org/temple/v1}temple".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _templeRootElement The TempleRootElement to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSTEMPLEV1TempleRootElement to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "temple", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/temple/v1}temple. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/temple/v1}temple...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:fsapi_v1", BAD_CAST "http://api.familysearch.org/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:fsapi_v1' on '{http://api.familysearch.org/temple/v1}temple'. XML writer status: %i\n", rc];
    }

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:temple_v1", BAD_CAST "http://api.familysearch.org/temple/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:temple_v1' on '{http://api.familysearch.org/temple/v1}temple'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/temple/v1}temple...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/temple/v1}templeRootElement for root element {http://api.familysearch.org/temple/v1}temple...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/temple/v1}templeRootElement for root element {http://api.familysearch.org/temple/v1}temple...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/temple/v1}temple. XML writer status: %i\n", rc];
  }
}

//documentation inherited.
- (BOOL) readJAXBAttribute: (xmlTextReaderPtr) reader
{
  void *_child_accessor;

  if ([super readJAXBAttribute: reader]) {
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
    && xmlStrcmp(BAD_CAST "temples", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/temple/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/temple/v1}temples of type {http://api.familysearch.org/temple/v1}temples.");
#endif
    __child = [FSTEMPLEV1Temples readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/temple/v1}temples of type {http://api.familysearch.org/temple/v1}temples.");
#endif

    [self setTemples: __child];
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

  if ([self temples]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "temple_v1", BAD_CAST "temples", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/temple/v1}temples."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/temple/v1}temples...");
#endif
    [[self temples] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/temple/v1}temples...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/temple/v1}temples."];
    }
  }
}
@end /* implementation FSTEMPLEV1TempleRootElement (JAXB) */
