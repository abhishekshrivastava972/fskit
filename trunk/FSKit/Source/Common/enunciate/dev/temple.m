#import "temple.h"


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
 * the old code of the temple.
 */
- (NSString *) oldCode
{
  return _oldCode;
}

/**
 * the old code of the temple.
 */
- (void) setOldCode: (NSString *) newOldCode
{
  [newOldCode retain];
  [_oldCode release];
  _oldCode = newOldCode;
}

/**
 * the requested code of the temple.
 */
- (NSString *) requestedCode
{
  return _requestedCode;
}

/**
 * the requested code of the temple.
 */
- (void) setRequestedCode: (NSString *) newRequestedCode
{
  [newRequestedCode retain];
  [_requestedCode release];
  _requestedCode = newRequestedCode;
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
  [self setOldCode: nil];
  [self setRequestedCode: nil];
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

  if ((xmlStrcmp(BAD_CAST "oldCode", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}oldCode...");
#endif
    [self setOldCode: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}oldCode...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "requestedCode", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedCode...");
#endif
    [self setRequestedCode: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedCode...");
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
  if ([self oldCode]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "oldCode", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}oldCode."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}oldCode...");
#endif
    [[self oldCode] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}oldCode...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}oldCode."];
    }
  }
  if ([self requestedCode]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedCode", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedCode."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedCode...");
#endif
    [[self requestedCode] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedCode...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedCode."];
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
