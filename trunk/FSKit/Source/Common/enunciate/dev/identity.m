#import "identity.h"


/**
 * (no documentation provided)
 */
@implementation FSIDENTITYV2ASession

/**
 * session id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * session id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * session values.
 */
- (NSArray *) values
{
  return _values;
}

/**
 * session values.
 */
- (void) setValues: (NSArray *) newValues
{
  [newValues retain];
  [_values release];
  _values = newValues;
}

- (void) dealloc
{
  [self setId: nil];
  [self setValues: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV2ASession */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2ASession (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2ASession (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2ASession (JAXB)

/**
 * Read an instance of FSIDENTITYV2ASession from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2ASession defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2ASession *_fSIDENTITYV2ASession = [[FSIDENTITYV2ASession alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2ASession initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2ASession dealloc];
    _fSIDENTITYV2ASession = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2ASession autorelease];
  return _fSIDENTITYV2ASession;
}

/**
 * Initialize this instance of FSIDENTITYV2ASession according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2ASession to the writer.
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

  if ((xmlStrcmp(BAD_CAST "id", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}id...");
#endif
    [self setId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}id...");
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
    && xmlStrcmp(BAD_CAST "values", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/identity/v2}values...");
#endif
      //start wrapper element "{http://api.familysearch.org/identity/v2}values"
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}value of type {http://api.familysearch.org/identity/v2}sessionValue.");
#endif

    __child = [FSIDENTITYV2ASessionValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}value of type {http://api.familysearch.org/identity/v2}sessionValue.");
#endif

    if ([self values]) {
      [self setValues: [[self values] arrayByAddingObject: __child]];
    }
    else {
      [self setValues: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/identity/v2}values...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/identity/v2}values"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setValues: (NSArray*) __child];
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

  if ([self id]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "id", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}id."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}id...");
#endif
    [[self id] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}id...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}id."];
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

  if ([self values]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "values", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/identity/v2}values."];
    }
    __enumerator = [[self values] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "value", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/identity/v2}value."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/identity/v2}value...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}value...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/identity/v2}value."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/identity/v2}values."];
    }
  }
}
@end /* implementation FSIDENTITYV2ASession (JAXB) */

/**
 * (no documentation provided)
 */
@implementation FSIDENTITYV2AAuthentication

/**
 * authentication status.
 */
- (enum FSIDENTITYV2AAuthenticationStatus *) status
{
  return _status;
}

/**
 * authentication status.
 */
- (void) setStatus: (enum FSIDENTITYV2AAuthenticationStatus *) newStatus
{
  if (_status != NULL) {
    free(_status);
  }
  _status = newStatus;
}

/**
 * authentication resolution URI.
 */
- (NSString *) resolutionUri
{
  return _resolutionUri;
}

/**
 * authentication resolution URI.
 */
- (void) setResolutionUri: (NSString *) newResolutionUri
{
  [newResolutionUri retain];
  [_resolutionUri release];
  _resolutionUri = newResolutionUri;
}

- (void) dealloc
{
  [self setStatus: NULL];
  [self setResolutionUri: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV2AAuthentication */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AAuthentication (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2AAuthentication (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AAuthentication (JAXB)

/**
 * Read an instance of FSIDENTITYV2AAuthentication from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AAuthentication defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AAuthentication *_fSIDENTITYV2AAuthentication = [[FSIDENTITYV2AAuthentication alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AAuthentication initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AAuthentication dealloc];
    _fSIDENTITYV2AAuthentication = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AAuthentication autorelease];
  return _fSIDENTITYV2AAuthentication;
}

/**
 * Initialize this instance of FSIDENTITYV2AAuthentication according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AAuthentication to the writer.
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
    && xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSIDENTITYV2AAuthenticationStatusType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setStatus: ((enum FSIDENTITYV2AAuthenticationStatus*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "resolutionUri", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}resolutionUri of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}resolutionUri of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setResolutionUri: __child];
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

  if ([self status] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "status", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}status."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}status...");
#endif
    status = xmlTextWriterWriteFSIDENTITYV2AAuthenticationStatusType(writer, [self status]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}status...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/identity/v2}status."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}status."];
    }
  }
  if ([self resolutionUri]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "resolutionUri", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}resolutionUri."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}resolutionUri...");
#endif
    [[self resolutionUri] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}resolutionUri...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}resolutionUri."];
    }
  }
}
@end /* implementation FSIDENTITYV2AAuthentication (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSIDENTITYV2AUserPermission

/**
 * (no documentation provided)
 */
- (NSString *) id
{
  return _id;
}

/**
 * (no documentation provided)
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

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

- (void) dealloc
{
  [self setId: nil];
  [self setName: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV2AUserPermission */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AUserPermission (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2AUserPermission (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AUserPermission (JAXB)

/**
 * Read an instance of FSIDENTITYV2AUserPermission from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AUserPermission defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AUserPermission *_fSIDENTITYV2AUserPermission = [[FSIDENTITYV2AUserPermission alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AUserPermission initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AUserPermission dealloc];
    _fSIDENTITYV2AUserPermission = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AUserPermission autorelease];
  return _fSIDENTITYV2AUserPermission;
}

/**
 * Initialize this instance of FSIDENTITYV2AUserPermission according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AUserPermission to the writer.
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

  if ((xmlStrcmp(BAD_CAST "id", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}id...");
#endif
    [self setId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}id...");
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
    [self setName: (NSString *) [NSString readXMLType: reader]];
  }
  else {
    [self setName: @""];
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

  if ([self id]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "id", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}id."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}id...");
#endif
    [[self id] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}id...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}id."];
    }
  }
}

//documentation inherited.
- (void) writeJAXBValue: (xmlTextWriterPtr) writer
{
#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing element value...");
#endif
  [[self name] writeXMLType: writer];
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
@end /* implementation FSIDENTITYV2AUserPermission (JAXB) */

/**
 * (no documentation provided)
 */
@implementation FSIDENTITYV2AUser

/**
 * (no documentation provided)
 */
- (NSString *) id
{
  return _id;
}

/**
 * (no documentation provided)
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * (no documentation provided)
 */
- (NSString *) displayName
{
  return _displayName;
}

/**
 * (no documentation provided)
 */
- (void) setDisplayName: (NSString *) newDisplayName
{
  [newDisplayName retain];
  [_displayName release];
  _displayName = newDisplayName;
}

/**
 * (no documentation provided)
 */
- (NSString *) email
{
  return _email;
}

/**
 * (no documentation provided)
 */
- (void) setEmail: (NSString *) newEmail
{
  [newEmail retain];
  [_email release];
  _email = newEmail;
}

- (void) dealloc
{
  [self setId: nil];
  [self setDisplayName: nil];
  [self setEmail: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV2AUser */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AUser (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2AUser (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AUser (JAXB)

/**
 * Read an instance of FSIDENTITYV2AUser from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AUser defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AUser *_fSIDENTITYV2AUser = [[FSIDENTITYV2AUser alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AUser initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AUser dealloc];
    _fSIDENTITYV2AUser = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AUser autorelease];
  return _fSIDENTITYV2AUser;
}

/**
 * Initialize this instance of FSIDENTITYV2AUser according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AUser to the writer.
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

  if ((xmlStrcmp(BAD_CAST "id", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}id...");
#endif
    [self setId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}id...");
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
    && xmlStrcmp(BAD_CAST "displayName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}displayName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}displayName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setDisplayName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "email", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}email of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}email of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setEmail: __child];
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

  if ([self id]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "id", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}id."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}id...");
#endif
    [[self id] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}id...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}id."];
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

  if ([self displayName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "displayName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}displayName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}displayName...");
#endif
    [[self displayName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}displayName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}displayName."];
    }
  }
  if ([self email]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "email", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}email."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}email...");
#endif
    [[self email] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}email...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}email."];
    }
  }
}
@end /* implementation FSIDENTITYV2AUser (JAXB) */

/**
 * (no documentation provided)
 */
@implementation FSIDENTITYV2ASessionValue

/**
 * session value name.
 */
- (NSString *) name
{
  return _name;
}

/**
 * session value name.
 */
- (void) setName: (NSString *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

/**
 * session value value.
 */
- (NSString *) value
{
  return _value;
}

/**
 * session value value.
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
@end /* implementation FSIDENTITYV2ASessionValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2ASessionValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2ASessionValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2ASessionValue (JAXB)

/**
 * Read an instance of FSIDENTITYV2ASessionValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2ASessionValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2ASessionValue *_fSIDENTITYV2ASessionValue = [[FSIDENTITYV2ASessionValue alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2ASessionValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2ASessionValue dealloc];
    _fSIDENTITYV2ASessionValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2ASessionValue autorelease];
  return _fSIDENTITYV2ASessionValue;
}

/**
 * Initialize this instance of FSIDENTITYV2ASessionValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2ASessionValue to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setValue: __child];
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

  if ([self name]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}name...");
#endif
    [[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}name...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}name."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}value."];
    }
  }
}
@end /* implementation FSIDENTITYV2ASessionValue (JAXB) */

/**
 *  A identity session.

 @author Rob Lyon

 */
@implementation FSIDENTITYV1Session

/**
 * The id of the session.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the session.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

- (void) dealloc
{
  [self setId: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV1Session */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV1Session (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV1Session (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV1Session (JAXB)

/**
 * Read an instance of FSIDENTITYV1Session from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV1Session defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV1Session *_fSIDENTITYV1Session = [[FSIDENTITYV1Session alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV1Session initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV1Session dealloc];
    _fSIDENTITYV1Session = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV1Session autorelease];
  return _fSIDENTITYV1Session;
}

/**
 * Initialize this instance of FSIDENTITYV1Session according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV1Session to the writer.
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

  if ((xmlStrcmp(BAD_CAST "id", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}id...");
#endif
    [self setId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}id...");
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

  if ([self id]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "id", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}id."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}id...");
#endif
    [[self id] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}id...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}id."];
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

}
@end /* implementation FSIDENTITYV1Session (JAXB) */


/**
 * Reads a AuthenticationStatus from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The AuthenticationStatus, or NULL if unable to be read.
 */
static enum FSIDENTITYV2AAuthenticationStatus *xmlTextReaderReadFSIDENTITYV2AAuthenticationStatusType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSIDENTITYV2AAuthenticationStatus *value = calloc(1, sizeof(enum FSIDENTITYV2AAuthenticationStatus));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Success") == 0) {
      *value = IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_SUCCESS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Failure") == 0) {
      *value = IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_FAILURE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Resolution Required") == 0) {
      *value = IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_RESOLUTION_REQUIRED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Invalid Key") == 0) {
      *value = IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_INVALID_KEY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_OTHER;
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
 * Writes a AuthenticationStatus to XML.
 *
 * @param writer The XML writer.
 * @param _authenticationStatus The AuthenticationStatus to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSIDENTITYV2AAuthenticationStatusType(xmlTextWriterPtr writer, enum FSIDENTITYV2AAuthenticationStatus *_authenticationStatus)
{
  switch (*_authenticationStatus) {
    case IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_SUCCESS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Success");
    case IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_FAILURE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Failure");
    case IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_RESOLUTION_REQUIRED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Resolution Required");
    case IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_INVALID_KEY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Invalid Key");
    case IDENTITY_IDENTITY_V2_AUTHENTICATIONSTATUS_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  @author Ryan Heaton

 */
@implementation FSIDENTITYV2AIdentityStatus

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
  [self setSubcode: NULL];
  [self setMessage: nil];
  [self setDetails: nil];
  [super dealloc];
}
@end /* implementation FSIDENTITYV2AIdentityStatus */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AIdentityStatus (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2AIdentityStatus (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AIdentityStatus (JAXB)

/**
 * Read an instance of FSIDENTITYV2AIdentityStatus from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AIdentityStatus defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AIdentityStatus *_fSIDENTITYV2AIdentityStatus = [[FSIDENTITYV2AIdentityStatus alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AIdentityStatus initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AIdentityStatus dealloc];
    _fSIDENTITYV2AIdentityStatus = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AIdentityStatus autorelease];
  return _fSIDENTITYV2AIdentityStatus;
}

/**
 * Initialize this instance of FSIDENTITYV2AIdentityStatus according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AIdentityStatus to the writer.
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
    && xmlStrcmp(BAD_CAST "code", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setCode: *((int*) _child_accessor)];
    free(_child_accessor);
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "subcode", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setSubcode: ((int*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "message", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setMessage: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "details", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}details of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}details of type {http://www.w3.org/2001/XMLSchema}string.");
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

  if (YES) { //always write the primitive element...
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "code", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}code."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}code...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_code);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}code...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/identity/v2}code."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}code."];
    }
  }
  if ([self subcode] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "subcode", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}subcode."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}subcode...");
#endif
    status = xmlTextWriterWriteIntType(writer, [self subcode]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}subcode...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/identity/v2}subcode."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}subcode."];
    }
  }
  if ([self message]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "message", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}message."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}message...");
#endif
    [[self message] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}message...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}message."];
    }
  }
  if ([self details]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "details", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}details."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}details...");
#endif
    [[self details] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}details...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}details."];
    }
  }
}
@end /* implementation FSIDENTITYV2AIdentityStatus (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSIDENTITYV2AIdentityProperty

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
@end /* implementation FSIDENTITYV2AIdentityProperty */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AIdentityProperty (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSIDENTITYV2AIdentityProperty (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AIdentityProperty (JAXB)

/**
 * Read an instance of FSIDENTITYV2AIdentityProperty from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AIdentityProperty defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AIdentityProperty *_fSIDENTITYV2AIdentityProperty = [[FSIDENTITYV2AIdentityProperty alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AIdentityProperty initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AIdentityProperty dealloc];
    _fSIDENTITYV2AIdentityProperty = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AIdentityProperty autorelease];
  return _fSIDENTITYV2AIdentityProperty;
}

/**
 * Initialize this instance of FSIDENTITYV2AIdentityProperty according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AIdentityProperty to the writer.
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
@end /* implementation FSIDENTITYV2AIdentityProperty (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSIDENTITYV1Identity

/**
 * The session associated with the identity.
 */
- (FSIDENTITYV1Session *) session
{
  return _session;
}

/**
 * The session associated with the identity.
 */
- (void) setSession: (FSIDENTITYV1Session *) newSession
{
  [newSession retain];
  [_session release];
  _session = newSession;
}

- (void) dealloc
{
  [self setSession: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSIDENTITYV1Identity *_fSIDENTITYV1Identity;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSIDENTITYV1Identity = (FSIDENTITYV1Identity *) [FSIDENTITYV1Identity readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSIDENTITYV1Identity;
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
@end /* implementation FSIDENTITYV1Identity */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV1Identity (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSIDENTITYV1Identity (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV1Identity (JAXB)

/**
 * Read an instance of FSIDENTITYV1Identity from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV1Identity defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV1Identity *_fSIDENTITYV1Identity = [[FSIDENTITYV1Identity alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV1Identity initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV1Identity dealloc];
    _fSIDENTITYV1Identity = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV1Identity autorelease];
  return _fSIDENTITYV1Identity;
}

/**
 * Initialize this instance of FSIDENTITYV1Identity according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV1Identity to the writer.
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
 * Reads a FSIDENTITYV1Identity from an XML reader. The element to be read is
 * "{http://api.familysearch.org/identity/v1}identity".
 *
 * @param reader The XML reader.
 * @return The FSIDENTITYV1Identity.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSIDENTITYV1Identity *_identity = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/identity/v1}identity."];
    }
  }

  if (xmlStrcmp(BAD_CAST "identity", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/identity/v1}identity.");
#endif
    _identity = (FSIDENTITYV1Identity *)[FSIDENTITYV1Identity readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/identity/v1}identity.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSIDENTITYV1Identity. Expected element {http://api.familysearch.org/identity/v1}identity. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSIDENTITYV1Identity. Expected element {http://api.familysearch.org/identity/v1}identity. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _identity;
}

/**
 * Writes this FSIDENTITYV1Identity to XML under element name "{http://api.familysearch.org/identity/v1}identity".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _identity The Identity to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSIDENTITYV1Identity to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v1", BAD_CAST "identity", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/identity/v1}identity. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/identity/v1}identity...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:fsapi_v1", BAD_CAST "http://api.familysearch.org/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:fsapi_v1' on '{http://api.familysearch.org/identity/v1}identity'. XML writer status: %i\n", rc];
    }

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:identity_v1", BAD_CAST "http://api.familysearch.org/identity/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:identity_v1' on '{http://api.familysearch.org/identity/v1}identity'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/identity/v1}identity...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/identity/v1}identity for root element {http://api.familysearch.org/identity/v1}identity...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/identity/v1}identity for root element {http://api.familysearch.org/identity/v1}identity...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/identity/v1}identity. XML writer status: %i\n", rc];
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
    && xmlStrcmp(BAD_CAST "session", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v1}session of type {http://api.familysearch.org/identity/v1}session.");
#endif
    __child = [FSIDENTITYV1Session readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v1}session of type {http://api.familysearch.org/identity/v1}session.");
#endif

    [self setSession: __child];
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

  if ([self session]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v1", BAD_CAST "session", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v1}session."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v1}session...");
#endif
    [[self session] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v1}session...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v1}session."];
    }
  }
}
@end /* implementation FSIDENTITYV1Identity (JAXB) */

/**
 *  @author Brian Pugh

 */
@implementation FSIDENTITYV2AIdentity

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
 * authentication information.
 */
- (FSIDENTITYV2AAuthentication *) authentication
{
  return _authentication;
}

/**
 * authentication information.
 */
- (void) setAuthentication: (FSIDENTITYV2AAuthentication *) newAuthentication
{
  [newAuthentication retain];
  [_authentication release];
  _authentication = newAuthentication;
}

/**
 * session information.
 */
- (FSIDENTITYV2ASession *) session
{
  return _session;
}

/**
 * session information.
 */
- (void) setSession: (FSIDENTITYV2ASession *) newSession
{
  [newSession retain];
  [_session release];
  _session = newSession;
}

/**
 * The status list.
 */
- (NSArray *) status
{
  return _status;
}

/**
 * The status list.
 */
- (void) setStatus: (NSArray *) newStatus
{
  [newStatus retain];
  [_status release];
  _status = newStatus;
}

/**
 * users.
 */
- (NSArray *) users
{
  return _users;
}

/**
 * users.
 */
- (void) setUsers: (NSArray *) newUsers
{
  [newUsers retain];
  [_users release];
  _users = newUsers;
}

/**
 * The properties.
 */
- (NSArray *) properties
{
  return _properties;
}

/**
 * The properties.
 */
- (void) setProperties: (NSArray *) newProperties
{
  [newProperties retain];
  [_properties release];
  _properties = newProperties;
}

/**
 * permissions.
 */
- (NSArray *) permissions
{
  return _permissions;
}

/**
 * permissions.
 */
- (void) setPermissions: (NSArray *) newPermissions
{
  [newPermissions retain];
  [_permissions release];
  _permissions = newPermissions;
}

- (void) dealloc
{
  [self setStatusCode: NULL];
  [self setDeprecated: NULL];
  [self setStatusMessage: nil];
  [self setVersion: nil];
  [self setAuthentication: nil];
  [self setSession: nil];
  [self setStatus: nil];
  [self setUsers: nil];
  [self setProperties: nil];
  [self setPermissions: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSIDENTITYV2AIdentity *_fSIDENTITYV2AIdentity;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSIDENTITYV2AIdentity = (FSIDENTITYV2AIdentity *) [FSIDENTITYV2AIdentity readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSIDENTITYV2AIdentity;
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
@end /* implementation FSIDENTITYV2AIdentity */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSIDENTITYV2AIdentity (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSIDENTITYV2AIdentity (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSIDENTITYV2AIdentity (JAXB)

/**
 * Read an instance of FSIDENTITYV2AIdentity from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSIDENTITYV2AIdentity defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSIDENTITYV2AIdentity *_fSIDENTITYV2AIdentity = [[FSIDENTITYV2AIdentity alloc] init];
  NS_DURING
  {
    [_fSIDENTITYV2AIdentity initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSIDENTITYV2AIdentity dealloc];
    _fSIDENTITYV2AIdentity = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSIDENTITYV2AIdentity autorelease];
  return _fSIDENTITYV2AIdentity;
}

/**
 * Initialize this instance of FSIDENTITYV2AIdentity according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSIDENTITYV2AIdentity to the writer.
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
 * Reads a FSIDENTITYV2AIdentity from an XML reader. The element to be read is
 * "{http://api.familysearch.org/identity/v2}identity".
 *
 * @param reader The XML reader.
 * @return The FSIDENTITYV2AIdentity.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSIDENTITYV2AIdentity *_identity = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/identity/v2}identity."];
    }
  }

  if (xmlStrcmp(BAD_CAST "identity", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/identity/v2}identity.");
#endif
    _identity = (FSIDENTITYV2AIdentity *)[FSIDENTITYV2AIdentity readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/identity/v2}identity.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSIDENTITYV2AIdentity. Expected element {http://api.familysearch.org/identity/v2}identity. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSIDENTITYV2AIdentity. Expected element {http://api.familysearch.org/identity/v2}identity. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _identity;
}

/**
 * Writes this FSIDENTITYV2AIdentity to XML under element name "{http://api.familysearch.org/identity/v2}identity".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _identity The Identity to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSIDENTITYV2AIdentity to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "identity", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/identity/v2}identity. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/identity/v2}identity...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:identity_v2", BAD_CAST "http://api.familysearch.org/identity/v2");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:identity_v2' on '{http://api.familysearch.org/identity/v2}identity'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/identity/v2}identity...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/identity/v2}identity for root element {http://api.familysearch.org/identity/v2}identity...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/identity/v2}identity for root element {http://api.familysearch.org/identity/v2}identity...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/identity/v2}identity. XML writer status: %i\n", rc];
  }
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
    && xmlStrcmp(BAD_CAST "authentication", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}authentication of type {http://api.familysearch.org/identity/v2}authentication.");
#endif
    __child = [FSIDENTITYV2AAuthentication readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}authentication of type {http://api.familysearch.org/identity/v2}authentication.");
#endif

    [self setAuthentication: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "session", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}session of type {http://api.familysearch.org/identity/v2}session.");
#endif
    __child = [FSIDENTITYV2ASession readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}session of type {http://api.familysearch.org/identity/v2}session.");
#endif

    [self setSession: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}status of type {http://api.familysearch.org/identity/v2}identityStatus.");
#endif

    __child = [FSIDENTITYV2AIdentityStatus readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}status of type {http://api.familysearch.org/identity/v2}identityStatus.");
#endif

    if ([self status]) {
      [self setStatus: [[self status] arrayByAddingObject: __child]];
    }
    else {
      [self setStatus: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "users", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/identity/v2}users...");
#endif
      //start wrapper element "{http://api.familysearch.org/identity/v2}users"
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
    && xmlStrcmp(BAD_CAST "user", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}user of type {http://api.familysearch.org/identity/v2}user.");
#endif

    __child = [FSIDENTITYV2AUser readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}user of type {http://api.familysearch.org/identity/v2}user.");
#endif

    if ([self users]) {
      [self setUsers: [[self users] arrayByAddingObject: __child]];
    }
    else {
      [self setUsers: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/identity/v2}users...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/identity/v2}users"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setUsers: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "properties", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/identity/v2}properties...");
#endif
      //start wrapper element "{http://api.familysearch.org/identity/v2}properties"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}property of type {http://api.familysearch.org/identity/v2}identityProperty.");
#endif

    __child = [FSIDENTITYV2AIdentityProperty readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}property of type {http://api.familysearch.org/identity/v2}identityProperty.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/identity/v2}properties...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/identity/v2}properties"
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
    && xmlStrcmp(BAD_CAST "permissions", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/identity/v2}permissions...");
#endif
      //start wrapper element "{http://api.familysearch.org/identity/v2}permissions"
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
    && xmlStrcmp(BAD_CAST "permission", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/identity/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/identity/v2}permission of type {http://api.familysearch.org/identity/v2}userPermission.");
#endif

    __child = [FSIDENTITYV2AUserPermission readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/identity/v2}permission of type {http://api.familysearch.org/identity/v2}userPermission.");
#endif

    if ([self permissions]) {
      [self setPermissions: [[self permissions] arrayByAddingObject: __child]];
    }
    else {
      [self setPermissions: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/identity/v2}permissions...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/identity/v2}permissions"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPermissions: (NSArray*) __child];
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

  if ([self authentication]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "authentication", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}authentication."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}authentication...");
#endif
    [[self authentication] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}authentication...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}authentication."];
    }
  }
  if ([self session]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "session", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/identity/v2}session."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/identity/v2}session...");
#endif
    [[self session] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}session...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/identity/v2}session."];
    }
  }
  if ([self status]) {
    __enumerator = [[self status] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "status", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/identity/v2}status."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/identity/v2}status...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}status...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/identity/v2}status."];
      }
    } //end item iterator.
  }
  if ([self users]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "users", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/identity/v2}users."];
    }
    __enumerator = [[self users] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "user", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/identity/v2}user."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/identity/v2}user...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}user...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/identity/v2}user."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/identity/v2}users."];
    }
  }
  if ([self properties]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "properties", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/identity/v2}properties."];
    }
    __enumerator = [[self properties] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "property", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/identity/v2}property."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/identity/v2}property...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}property...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/identity/v2}property."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/identity/v2}properties."];
    }
  }
  if ([self permissions]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "permissions", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/identity/v2}permissions."];
    }
    __enumerator = [[self permissions] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "identity_v2", BAD_CAST "permission", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/identity/v2}permission."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/identity/v2}permission...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/identity/v2}permission...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/identity/v2}permission."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/identity/v2}permissions."];
    }
  }
}
@end /* implementation FSIDENTITYV2AIdentity (JAXB) */
