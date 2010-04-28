#import "familytree.h"


/**
 *  An assertion value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2AssertionValue

/**
 * the id of the value.
 */
- (NSString *) id
{
  return _id;
}

/**
 * the id of the value.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The title of the type in the case of user-defined characteristics.
 */
- (NSString *) title
{
  return _title;
}

/**
 * The title of the type in the case of user-defined characteristics.
 */
- (void) setTitle: (NSString *) newTitle
{
  [newTitle retain];
  [_title release];
  _title = newTitle;
}

- (void) dealloc
{
  [self setId: nil];
  [self setTitle: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2AssertionValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2AssertionValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2AssertionValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2AssertionValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2AssertionValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2AssertionValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2AssertionValue *_fSFAMILYTREEV2AssertionValue = [[FSFAMILYTREEV2AssertionValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2AssertionValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2AssertionValue dealloc];
    _fSFAMILYTREEV2AssertionValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2AssertionValue autorelease];
  return _fSFAMILYTREEV2AssertionValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2AssertionValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2AssertionValue to the writer.
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
    && xmlStrcmp(BAD_CAST "title", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}title of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}title of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setTitle: __child];
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

  if ([self title]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "title", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}title."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}title...");
#endif
    [[self title] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}title...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}title."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2AssertionValue (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ChangeAction

/**
 * the change action type.
 */
- (enum FSFAMILYTREEV2ChangeActionType *) type
{
  return _type;
}

/**
 * the change action type.
 */
- (void) setType: (enum FSFAMILYTREEV2ChangeActionType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * the action value.
 */
- (NSString *) value
{
  return _value;
}

/**
 * the action value.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ChangeAction */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ChangeAction (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ChangeAction (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ChangeAction (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ChangeAction from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ChangeAction defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ChangeAction *_fSFAMILYTREEV2ChangeAction = [[FSFAMILYTREEV2ChangeAction alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ChangeAction initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ChangeAction dealloc];
    _fSFAMILYTREEV2ChangeAction = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ChangeAction autorelease];
  return _fSFAMILYTREEV2ChangeAction;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ChangeAction according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ChangeAction to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2ChangeActionTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2ChangeActionType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2ChangeActionTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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
@end /* implementation FSFAMILYTREEV2ChangeAction (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Changes

/**
 * The count of changes.
 */
- (int) count
{
  return _count;
}

/**
 * The count of changes.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * The changes.
 */
- (NSArray *) changeList
{
  return _changeList;
}

/**
 * The changes.
 */
- (void) setChangeList: (NSArray *) newChangeList
{
  [newChangeList retain];
  [_changeList release];
  _changeList = newChangeList;
}

- (void) dealloc
{
  [self setChangeList: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Changes */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Changes (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Changes (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Changes (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Changes from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Changes defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Changes *_fSFAMILYTREEV2Changes = [[FSFAMILYTREEV2Changes alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Changes initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Changes dealloc];
    _fSFAMILYTREEV2Changes = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Changes autorelease];
  return _fSFAMILYTREEV2Changes;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Changes according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Changes to the writer.
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
    && xmlStrcmp(BAD_CAST "change", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}change of type {http://api.familysearch.org/familytree/v2}change.");
#endif

    __child = [FSFAMILYTREEV2Change readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}change of type {http://api.familysearch.org/familytree/v2}change.");
#endif

    if ([self changeList]) {
      [self setChangeList: [[self changeList] arrayByAddingObject: __child]];
    }
    else {
      [self setChangeList: [NSArray arrayWithObject: __child]];
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

  if ([self changeList]) {
    __enumerator = [[self changeList] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "change", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}change."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}change...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}change...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}change."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2Changes (JAXB) */

/**
 *  Citation Field

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2CitationField

/**
 * (no documentation provided)
 */
- (enum FSFAMILYTREEV2CitationFieldType *) type
{
  return _type;
}

/**
 * (no documentation provided)
 */
- (void) setType: (enum FSFAMILYTREEV2CitationFieldType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
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
  [self setType: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2CitationField */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2CitationField (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2CitationField (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2CitationField (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2CitationField from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2CitationField defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2CitationField *_fSFAMILYTREEV2CitationField = [[FSFAMILYTREEV2CitationField alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2CitationField initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2CitationField dealloc];
    _fSFAMILYTREEV2CitationField = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2CitationField autorelease];
  return _fSFAMILYTREEV2CitationField;
}

/**
 * Initialize this instance of FSFAMILYTREEV2CitationField according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2CitationField to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2CitationFieldTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2CitationFieldType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2CitationFieldTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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
@end /* implementation FSFAMILYTREEV2CitationField (JAXB) */

/**
 *  A contributor of information to new FamilySearch.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2Contact

/**
 * The id of the contributor.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the contributor.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The requested id of the contributor.
 */
- (NSString *) requestedId
{
  return _requestedId;
}

/**
 * The requested id of the contributor.
 */
- (void) setRequestedId: (NSString *) newRequestedId
{
  [newRequestedId retain];
  [_requestedId release];
  _requestedId = newRequestedId;
}

/**
 * The contact name of the user.
 */
- (NSString *) contactName
{
  return _contactName;
}

/**
 * The contact name of the user.
 */
- (void) setContactName: (NSString *) newContactName
{
  [newContactName retain];
  [_contactName release];
  _contactName = newContactName;
}

/**
 * The full name of the user.
 */
- (NSString *) fullName
{
  return _fullName;
}

/**
 * The full name of the user.
 */
- (void) setFullName: (NSString *) newFullName
{
  [newFullName retain];
  [_fullName release];
  _fullName = newFullName;
}

/**
 * The email of the user.
 */
- (NSString *) email
{
  return _email;
}

/**
 * The email of the user.
 */
- (void) setEmail: (NSString *) newEmail
{
  [newEmail retain];
  [_email release];
  _email = newEmail;
}

/**
 * The address number of the user.
 */
- (FSFAMILYTREEV2PostalAddress *) address
{
  return _address;
}

/**
 * The address number of the user.
 */
- (void) setAddress: (FSFAMILYTREEV2PostalAddress *) newAddress
{
  [newAddress retain];
  [_address release];
  _address = newAddress;
}

/**
 * The phone number of the user.
 */
- (NSString *) phone
{
  return _phone;
}

/**
 * The phone number of the user.
 */
- (void) setPhone: (NSString *) newPhone
{
  [newPhone retain];
  [_phone release];
  _phone = newPhone;
}

- (void) dealloc
{
  [self setId: nil];
  [self setRequestedId: nil];
  [self setContactName: nil];
  [self setFullName: nil];
  [self setEmail: nil];
  [self setAddress: nil];
  [self setPhone: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Contact */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Contact (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Contact (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Contact (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Contact from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Contact defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Contact *_fSFAMILYTREEV2Contact = [[FSFAMILYTREEV2Contact alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Contact initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Contact dealloc];
    _fSFAMILYTREEV2Contact = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Contact autorelease];
  return _fSFAMILYTREEV2Contact;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Contact according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Contact to the writer.
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

  if ((xmlStrcmp(BAD_CAST "requestedId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedId...");
#endif
    [self setRequestedId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedId...");
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
    && xmlStrcmp(BAD_CAST "contactName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setContactName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "fullName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}fullName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}fullName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setFullName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "email", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}email of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}email of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setEmail: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "address", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address of type {http://api.familysearch.org/familytree/v2}postalAddress.");
#endif
    __child = [FSFAMILYTREEV2PostalAddress readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address of type {http://api.familysearch.org/familytree/v2}postalAddress.");
#endif

    [self setAddress: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "phone", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}phone of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}phone of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPhone: __child];
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
  if ([self requestedId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedId...");
#endif
    [[self requestedId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedId."];
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

  if ([self contactName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contactName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contactName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contactName...");
#endif
    [[self contactName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contactName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contactName."];
    }
  }
  if ([self fullName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "fullName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}fullName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}fullName...");
#endif
    [[self fullName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}fullName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}fullName."];
    }
  }
  if ([self email]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "email", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}email."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}email...");
#endif
    [[self email] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}email...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}email."];
    }
  }
  if ([self address]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address...");
#endif
    [[self address] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address."];
    }
  }
  if ([self phone]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "phone", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}phone."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}phone...");
#endif
    [[self phone] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}phone...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}phone."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Contact (JAXB) */

/**
 *  A Family Tree entity reference.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2EntityReference

/**
 * The ref id of the persona.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The ref id of the persona.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * Temp id for this entity reference.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * Temp id for this entity reference.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The version number for this person.
 */
- (NSString *) version
{
  return _version;
}

/**
 * The version number for this person.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

- (void) dealloc
{
  [self setId: nil];
  [self setTempId: nil];
  [self setVersion: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2EntityReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2EntityReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2EntityReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2EntityReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2EntityReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2EntityReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2EntityReference *_fSFAMILYTREEV2EntityReference = [[FSFAMILYTREEV2EntityReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2EntityReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2EntityReference dealloc];
    _fSFAMILYTREEV2EntityReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2EntityReference autorelease];
  return _fSFAMILYTREEV2EntityReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2EntityReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2EntityReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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

}
@end /* implementation FSFAMILYTREEV2EntityReference (JAXB) */

/**
 *  An astro date.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2DateAstro

/**
 * The earliest astro date.
 */
- (NSString *) earliest
{
  return _earliest;
}

/**
 * The earliest astro date.
 */
- (void) setEarliest: (NSString *) newEarliest
{
  [newEarliest retain];
  [_earliest release];
  _earliest = newEarliest;
}

/**
 * The lastest astro date.
 */
- (NSString *) latest
{
  return _latest;
}

/**
 * The lastest astro date.
 */
- (void) setLatest: (NSString *) newLatest
{
  [newLatest retain];
  [_latest release];
  _latest = newLatest;
}

- (void) dealloc
{
  [self setEarliest: nil];
  [self setLatest: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2DateAstro */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2DateAstro (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2DateAstro (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2DateAstro (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2DateAstro from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2DateAstro defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2DateAstro *_fSFAMILYTREEV2DateAstro = [[FSFAMILYTREEV2DateAstro alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2DateAstro initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2DateAstro dealloc];
    _fSFAMILYTREEV2DateAstro = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2DateAstro autorelease];
  return _fSFAMILYTREEV2DateAstro;
}

/**
 * Initialize this instance of FSFAMILYTREEV2DateAstro according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2DateAstro to the writer.
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
    && xmlStrcmp(BAD_CAST "earliest", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}earliest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}earliest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setEarliest: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "latest", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}latest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}latest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setLatest: __child];
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

  if ([self earliest]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "earliest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}earliest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}earliest...");
#endif
    [[self earliest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}earliest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}earliest."];
    }
  }
  if ([self latest]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "latest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}latest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}latest...");
#endif
    [[self latest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}latest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}latest."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2DateAstro (JAXB) */

/**
 *  A FamilyTree family.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2FamilyReference

/**
 * The action.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The action.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * A collection of parents for this family.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * A collection of parents for this family.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * the primary affirming marriage-like event for the couple, if exists.
 */
- (FSFAMILYTREEV2EventAssertion *) marriage
{
  return _marriage;
}

/**
 * the primary affirming marriage-like event for the couple, if exists.
 */
- (void) setMarriage: (FSFAMILYTREEV2EventAssertion *) newMarriage
{
  [newMarriage retain];
  [_marriage release];
  _marriage = newMarriage;
}

/**
 * A collection of children for this family.
 */
- (NSArray *) children
{
  return _children;
}

/**
 * A collection of children for this family.
 */
- (void) setChildren: (NSArray *) newChildren
{
  [newChildren retain];
  [_children release];
  _children = newChildren;
}

- (void) dealloc
{
  [self setAction: NULL];
  [self setParents: nil];
  [self setMarriage: nil];
  [self setChildren: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2FamilyReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2FamilyReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2FamilyReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2FamilyReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2FamilyReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2FamilyReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2FamilyReference *_fSFAMILYTREEV2FamilyReference = [[FSFAMILYTREEV2FamilyReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2FamilyReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2FamilyReference dealloc];
    _fSFAMILYTREEV2FamilyReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2FamilyReference autorelease];
  return _fSFAMILYTREEV2FamilyReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2FamilyReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2FamilyReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
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
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "marriage", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}marriage of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif
    __child = [FSFAMILYTREEV2EventAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}marriage of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif

    [self setMarriage: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self children]) {
      [self setChildren: [[self children] arrayByAddingObject: __child]];
    }
    else {
      [self setChildren: [NSArray arrayWithObject: __child]];
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

  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
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

  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
      }
    } //end item iterator.
  }
  if ([self marriage]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "marriage", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}marriage."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}marriage...");
#endif
    [[self marriage] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}marriage...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}marriage."];
    }
  }
  if ([self children]) {
    __enumerator = [[self children] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2FamilyReference (JAXB) */

/**
 *  A standardized date.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2GenDate

/**
 * The date value.
 */
- (NSString *) original
{
  return _original;
}

/**
 * The date value.
 */
- (void) setOriginal: (NSString *) newOriginal
{
  [newOriginal retain];
  [_original release];
  _original = newOriginal;
}

/**
 * The normalized value.
 */
- (NSString *) normalized
{
  return _normalized;
}

/**
 * The normalized value.
 */
- (void) setNormalized: (NSString *) newNormalized
{
  [newNormalized retain];
  [_normalized release];
  _normalized = newNormalized;
}

/**
 * The astro date.
 */
- (FSFAMILYTREEV2DateAstro *) astro
{
  return _astro;
}

/**
 * The astro date.
 */
- (void) setAstro: (FSFAMILYTREEV2DateAstro *) newAstro
{
  [newAstro retain];
  [_astro release];
  _astro = newAstro;
}

/**
 * true, if the normalization is user selected.
 */
- (BOOL *) selected
{
  return _selected;
}

/**
 * true, if the normalization is user selected.
 */
- (void) setSelected: (BOOL *) newSelected
{
  if (_selected != NULL) {
    free(_selected);
  }
  _selected = newSelected;
}

- (void) dealloc
{
  [self setOriginal: nil];
  [self setNormalized: nil];
  [self setAstro: nil];
  [self setSelected: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2GenDate */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2GenDate (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2GenDate (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2GenDate (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2GenDate from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2GenDate defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2GenDate *_fSFAMILYTREEV2GenDate = [[FSFAMILYTREEV2GenDate alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2GenDate initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2GenDate dealloc];
    _fSFAMILYTREEV2GenDate = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2GenDate autorelease];
  return _fSFAMILYTREEV2GenDate;
}

/**
 * Initialize this instance of FSFAMILYTREEV2GenDate according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2GenDate to the writer.
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
    && xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setOriginal: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setNormalized: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "astro", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}astro of type {http://api.familysearch.org/familytree/v2}dateAstro.");
#endif
    __child = [FSFAMILYTREEV2DateAstro readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}astro of type {http://api.familysearch.org/familytree/v2}dateAstro.");
#endif

    [self setAstro: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "selected", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setSelected: ((BOOL*) _child_accessor)];
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

  if ([self original]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}original...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}original."];
    }
  }
  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}normalized."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}normalized...");
#endif
    [[self normalized] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}normalized...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}normalized."];
    }
  }
  if ([self astro]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "astro", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}astro."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}astro...");
#endif
    [[self astro] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}astro...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}astro."];
    }
  }
  if ([self selected] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "selected", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}selected."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self selected]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}selected."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}selected."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2GenDate (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2ContributorAlias

/**
 * The alias id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The alias id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The alias contact name.
 */
- (NSString *) contactName
{
  return _contactName;
}

/**
 * The alias contact name.
 */
- (void) setContactName: (NSString *) newContactName
{
  [newContactName retain];
  [_contactName release];
  _contactName = newContactName;
}

- (void) dealloc
{
  [self setId: nil];
  [self setContactName: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ContributorAlias */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ContributorAlias (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ContributorAlias (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ContributorAlias (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ContributorAlias from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ContributorAlias defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ContributorAlias *_fSFAMILYTREEV2ContributorAlias = [[FSFAMILYTREEV2ContributorAlias alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ContributorAlias initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ContributorAlias dealloc];
    _fSFAMILYTREEV2ContributorAlias = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ContributorAlias autorelease];
  return _fSFAMILYTREEV2ContributorAlias;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ContributorAlias according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ContributorAlias to the writer.
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
    && xmlStrcmp(BAD_CAST "contactName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setContactName: __child];
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

  if ([self contactName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contactName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contactName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contactName...");
#endif
    [[self contactName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contactName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contactName."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2ContributorAlias (JAXB) */

/**
 *  A name form.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2NameForm

/**
 * The normalized full text of the name.
 */
- (NSString *) fullText
{
  return _fullText;
}

/**
 * The normalized full text of the name.
 */
- (void) setFullText: (NSString *) newFullText
{
  [newFullText retain];
  [_fullText release];
  _fullText = newFullText;
}

/**
 * The name pieces.
 */
- (NSArray *) pieces
{
  return _pieces;
}

/**
 * The name pieces.
 */
- (void) setPieces: (NSArray *) newPieces
{
  [newPieces retain];
  [_pieces release];
  _pieces = newPieces;
}

/**
 * The name form script.
 */
- (enum FSFAMILYTREEV2NameFormScript *) script
{
  return _script;
}

/**
 * The name form script.
 */
- (void) setScript: (enum FSFAMILYTREEV2NameFormScript *) newScript
{
  if (_script != NULL) {
    free(_script);
  }
  _script = newScript;
}

/**
 * true, if the segmentation is user selected.
 */
- (BOOL *) selected
{
  return _selected;
}

/**
 * true, if the segmentation is user selected.
 */
- (void) setSelected: (BOOL *) newSelected
{
  if (_selected != NULL) {
    free(_selected);
  }
  _selected = newSelected;
}

- (void) dealloc
{
  [self setFullText: nil];
  [self setPieces: nil];
  [self setScript: NULL];
  [self setSelected: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2NameForm */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2NameForm (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2NameForm (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2NameForm (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2NameForm from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2NameForm defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2NameForm *_fSFAMILYTREEV2NameForm = [[FSFAMILYTREEV2NameForm alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2NameForm initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2NameForm dealloc];
    _fSFAMILYTREEV2NameForm = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2NameForm autorelease];
  return _fSFAMILYTREEV2NameForm;
}

/**
 * Initialize this instance of FSFAMILYTREEV2NameForm according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2NameForm to the writer.
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
    && xmlStrcmp(BAD_CAST "fullText", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}fullText of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}fullText of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setFullText: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "pieces", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}pieces...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}pieces"
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
    && xmlStrcmp(BAD_CAST "piece", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}piece of type {http://api.familysearch.org/familytree/v2}namePiece.");
#endif

    __child = [FSFAMILYTREEV2NamePiece readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}piece of type {http://api.familysearch.org/familytree/v2}namePiece.");
#endif

    if ([self pieces]) {
      [self setPieces: [[self pieces] arrayByAddingObject: __child]];
    }
    else {
      [self setPieces: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}pieces...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}pieces"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPieces: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "script", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2NameFormScriptType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setScript: ((enum FSFAMILYTREEV2NameFormScript*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "selected", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setSelected: ((BOOL*) _child_accessor)];
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

  if ([self fullText]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "fullText", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}fullText."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}fullText...");
#endif
    [[self fullText] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}fullText...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}fullText."];
    }
  }
  if ([self pieces]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "pieces", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}pieces."];
    }
    __enumerator = [[self pieces] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "piece", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}piece."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}piece...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}piece...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}piece."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}pieces."];
    }
  }
  if ([self script] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "script", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}script."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}script...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2NameFormScriptType(writer, [self script]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}script...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}script."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}script."];
    }
  }
  if ([self selected] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "selected", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}selected."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self selected]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}selected."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}selected."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2NameForm (JAXB) */

/**
 *  A piece of a name.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2NamePiece

/**
 * The type of the name piece.
 */
- (enum FSFAMILYTREEV2NamePieceType *) type
{
  return _type;
}

/**
 * The type of the name piece.
 */
- (void) setType: (enum FSFAMILYTREEV2NamePieceType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The predelimiters.
 */
- (NSString *) predelimiters
{
  return _predelimiters;
}

/**
 * The predelimiters.
 */
- (void) setPredelimiters: (NSString *) newPredelimiters
{
  [newPredelimiters retain];
  [_predelimiters release];
  _predelimiters = newPredelimiters;
}

/**
 * The value of the name piece.
 */
- (NSString *) value
{
  return _value;
}

/**
 * The value of the name piece.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

/**
 * The postdelimiters.
 */
- (NSString *) postdelimiters
{
  return _postdelimiters;
}

/**
 * The postdelimiters.
 */
- (void) setPostdelimiters: (NSString *) newPostdelimiters
{
  [newPostdelimiters retain];
  [_postdelimiters release];
  _postdelimiters = newPostdelimiters;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setPredelimiters: nil];
  [self setValue: nil];
  [self setPostdelimiters: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2NamePiece */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2NamePiece (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2NamePiece (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2NamePiece (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2NamePiece from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2NamePiece defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2NamePiece *_fSFAMILYTREEV2NamePiece = [[FSFAMILYTREEV2NamePiece alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2NamePiece initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2NamePiece dealloc];
    _fSFAMILYTREEV2NamePiece = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2NamePiece autorelease];
  return _fSFAMILYTREEV2NamePiece;
}

/**
 * Initialize this instance of FSFAMILYTREEV2NamePiece according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2NamePiece to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2NamePieceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2NamePieceType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "predelimiters", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPredelimiters: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setValue: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "postdelimiters", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPostdelimiters: __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2NamePieceTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self predelimiters]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "predelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}predelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}predelimiters...");
#endif
    [[self predelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}predelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}predelimiters."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
  if ([self postdelimiters]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "postdelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}postdelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}postdelimiters...");
#endif
    [[self postdelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}postdelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}postdelimiters."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2NamePiece (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2Note

/**
 * The id of the note.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the note.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The action.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The action.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * A temporary id for this note (e.g. for a note not persisted yet).
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * A temporary id for this note (e.g. for a note not persisted yet).
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The persona id for this note
 */
- (FSFAMILYTREEV2EntityReference *) person
{
  return _person;
}

/**
 * The persona id for this note
 */
- (void) setPerson: (FSFAMILYTREEV2EntityReference *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

/**
 * The parent id(s) for this note
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * The parent id(s) for this note
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * The spouse id(s) for this note
 */
- (NSArray *) spouses
{
  return _spouses;
}

/**
 * The spouse id(s) for this note
 */
- (void) setSpouses: (NSArray *) newSpouses
{
  [newSpouses retain];
  [_spouses release];
  _spouses = newSpouses;
}

/**
 * The child id for this note
 */
- (FSFAMILYTREEV2EntityReference *) child
{
  return _child;
}

/**
 * The child id for this note
 */
- (void) setChild: (FSFAMILYTREEV2EntityReference *) newChild
{
  [newChild retain];
  [_child release];
  _child = newChild;
}

/**
 * assertionId
 */
- (FSFAMILYTREEV2EntityReference *) assertion
{
  return _assertion;
}

/**
 * assertionId
 */
- (void) setAssertion: (FSFAMILYTREEV2EntityReference *) newAssertion
{
  [newAssertion retain];
  [_assertion release];
  _assertion = newAssertion;
}

/**
 * a reference to the contributor of the change.
 */
- (FSFAMILYTREEV2EntityReference *) contributor
{
  return _contributor;
}

/**
 * a reference to the contributor of the change.
 */
- (void) setContributor: (FSFAMILYTREEV2EntityReference *) newContributor
{
  [newContributor retain];
  [_contributor release];
  _contributor = newContributor;
}

/**
 * a reference to the submitter.
 */
- (FSFAMILYTREEV2EntityReference *) submitter
{
  return _submitter;
}

/**
 * a reference to the submitter.
 */
- (void) setSubmitter: (FSFAMILYTREEV2EntityReference *) newSubmitter
{
  [newSubmitter retain];
  [_submitter release];
  _submitter = newSubmitter;
}

/**
 * the assertion assertion.
 */
- (enum FSFAMILYTREEV2AssertionDisposition *) disposition
{
  return _disposition;
}

/**
 * the assertion assertion.
 */
- (void) setDisposition: (enum FSFAMILYTREEV2AssertionDisposition *) newDisposition
{
  if (_disposition != NULL) {
    free(_disposition);
  }
  _disposition = newDisposition;
}

/**
 * The text of the note.
 */
- (NSString *) text
{
  return _text;
}

/**
 * The text of the note.
 */
- (void) setText: (NSString *) newText
{
  [newText retain];
  [_text release];
  _text = newText;
}

- (void) dealloc
{
  [self setId: nil];
  [self setAction: NULL];
  [self setTempId: nil];
  [self setPerson: nil];
  [self setParents: nil];
  [self setSpouses: nil];
  [self setChild: nil];
  [self setAssertion: nil];
  [self setContributor: nil];
  [self setSubmitter: nil];
  [self setDisposition: NULL];
  [self setText: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Note */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Note (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Note (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Note (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Note from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Note defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Note *_fSFAMILYTREEV2Note = [[FSFAMILYTREEV2Note alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Note initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Note dealloc];
    _fSFAMILYTREEV2Note = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Note autorelease];
  return _fSFAMILYTREEV2Note;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Note according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Note to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setPerson: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouses", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}spouses of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}spouses of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self spouses]) {
      [self setSpouses: [[self spouses] arrayByAddingObject: __child]];
    }
    else {
      [self setSpouses: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setChild: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assertion", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setAssertion: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setContributor: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "submitter", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setSubmitter: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "disposition", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDisposition: ((enum FSFAMILYTREEV2AssertionDisposition*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "text", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}text of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}text of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setText: __child];
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
  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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

  if ([self person]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parents", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parents."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parents...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parents...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parents."];
      }
    } //end item iterator.
  }
  if ([self spouses]) {
    __enumerator = [[self spouses] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "spouses", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}spouses."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}spouses...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}spouses...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}spouses."];
      }
    } //end item iterator.
  }
  if ([self child]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
    [[self child] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
    }
  }
  if ([self assertion]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "assertion", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}assertion."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}assertion...");
#endif
    [[self assertion] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}assertion...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}assertion."];
    }
  }
  if ([self contributor]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
    [[self contributor] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
    }
  }
  if ([self submitter]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "submitter", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}submitter."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}submitter...");
#endif
    [[self submitter] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}submitter...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}submitter."];
    }
  }
  if ([self disposition] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "disposition", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(writer, [self disposition]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}disposition."];
    }
  }
  if ([self text]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "text", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}text."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}text...");
#endif
    [[self text] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}text...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}text."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Note (JAXB) */

/**
 *  A Family Tree person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Pedigree

/**
 * The id of the person.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the person.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The id of the person.
 */
- (NSString *) requestedId
{
  return _requestedId;
}

/**
 * The id of the person.
 */
- (void) setRequestedId: (NSString *) newRequestedId
{
  [newRequestedId retain];
  [_requestedId release];
  _requestedId = newRequestedId;
}

/**
 * The persons.
 */
- (NSArray *) persons
{
  return _persons;
}

/**
 * The persons.
 */
- (void) setPersons: (NSArray *) newPersons
{
  [newPersons retain];
  [_persons release];
  _persons = newPersons;
}

- (void) dealloc
{
  [self setId: nil];
  [self setRequestedId: nil];
  [self setPersons: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Pedigree */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Pedigree (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Pedigree (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Pedigree (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Pedigree from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Pedigree defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Pedigree *_fSFAMILYTREEV2Pedigree = [[FSFAMILYTREEV2Pedigree alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Pedigree initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Pedigree dealloc];
    _fSFAMILYTREEV2Pedigree = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Pedigree autorelease];
  return _fSFAMILYTREEV2Pedigree;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Pedigree according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Pedigree to the writer.
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

  if ((xmlStrcmp(BAD_CAST "requestedId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedId...");
#endif
    [self setRequestedId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedId...");
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
    && xmlStrcmp(BAD_CAST "persons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}persons...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}persons"
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
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    __child = [FSFAMILYTREEV2Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    if ([self persons]) {
      [self setPersons: [[self persons] arrayByAddingObject: __child]];
    }
    else {
      [self setPersons: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}persons...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}persons"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPersons: (NSArray*) __child];
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
  if ([self requestedId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedId...");
#endif
    [[self requestedId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedId."];
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

  if ([self persons]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}persons."];
    }
    __enumerator = [[self persons] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}persons."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Pedigree (JAXB) */

/**
 *  A person id.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2PersonIdentifier

/**
 * The type.
 */
- (enum FSFAMILYTREEV2PersonIdType *) type
{
  return _type;
}

/**
 * The type.
 */
- (void) setType: (enum FSFAMILYTREEV2PersonIdType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The value of the id.
 */
- (NSString *) value
{
  return _value;
}

/**
 * The value of the id.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonIdentifier */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonIdentifier (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonIdentifier (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonIdentifier (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonIdentifier from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonIdentifier defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonIdentifier *_fSFAMILYTREEV2PersonIdentifier = [[FSFAMILYTREEV2PersonIdentifier alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonIdentifier initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonIdentifier dealloc];
    _fSFAMILYTREEV2PersonIdentifier = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonIdentifier autorelease];
  return _fSFAMILYTREEV2PersonIdentifier;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonIdentifier according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonIdentifier to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2PersonIdTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2PersonIdType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2PersonIdTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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
@end /* implementation FSFAMILYTREEV2PersonIdentifier (JAXB) */

/**
 *  A FamilyTree person properties section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonProperties

/**
 * The calculated living status for this person.
 */
- (BOOL *) living
{
  return _living;
}

/**
 * The calculated living status for this person.
 */
- (void) setLiving: (BOOL *) newLiving
{
  if (_living != NULL) {
    free(_living);
  }
  _living = newLiving;
}

/**
 * The modified timestamp for this person.
 */
- (NSDate *) modified
{
  return _modified;
}

/**
 * The modified timestamp for this person.
 */
- (void) setModified: (NSDate *) newModified
{
  [newModified retain];
  [_modified release];
  _modified = newModified;
}

/**
 * Is the person modifiable by the current user?
 */
- (BOOL *) modifiable
{
  return _modifiable;
}

/**
 * Is the person modifiable by the current user?
 */
- (void) setModifiable: (BOOL *) newModifiable
{
  if (_modifiable != NULL) {
    free(_modifiable);
  }
  _modifiable = newModifiable;
}

/**
 * Is the person part of more than one family as the parent?
 */
- (BOOL *) multipleFamiliesAsParent
{
  return _multipleFamiliesAsParent;
}

/**
 * Is the person part of more than one family as the parent?
 */
- (void) setMultipleFamiliesAsParent: (BOOL *) newMultipleFamiliesAsParent
{
  if (_multipleFamiliesAsParent != NULL) {
    free(_multipleFamiliesAsParent);
  }
  _multipleFamiliesAsParent = newMultipleFamiliesAsParent;
}

/**
 * Is the person part of more than one family as the child?
 */
- (BOOL *) multipleFamiliesAsChild
{
  return _multipleFamiliesAsChild;
}

/**
 * Is the person part of more than one family as the child?
 */
- (void) setMultipleFamiliesAsChild: (BOOL *) newMultipleFamiliesAsChild
{
  if (_multipleFamiliesAsChild != NULL) {
    free(_multipleFamiliesAsChild);
  }
  _multipleFamiliesAsChild = newMultipleFamiliesAsChild;
}

- (void) dealloc
{
  [self setLiving: NULL];
  [self setModified: nil];
  [self setModifiable: NULL];
  [self setMultipleFamiliesAsParent: NULL];
  [self setMultipleFamiliesAsChild: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonProperties */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonProperties (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonProperties (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonProperties (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonProperties from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonProperties defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonProperties *_fSFAMILYTREEV2PersonProperties = [[FSFAMILYTREEV2PersonProperties alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonProperties initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonProperties dealloc];
    _fSFAMILYTREEV2PersonProperties = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonProperties autorelease];
  return _fSFAMILYTREEV2PersonProperties;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonProperties according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonProperties to the writer.
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
    && xmlStrcmp(BAD_CAST "living", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setLiving: ((BOOL*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "modified", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif
    __child = [NSDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif

    [self setModified: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "modifiable", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setModifiable: ((BOOL*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "multipleFamiliesAsParent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setMultipleFamiliesAsParent: ((BOOL*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "multipleFamiliesAsChild", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setMultipleFamiliesAsChild: ((BOOL*) _child_accessor)];
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

  if ([self living] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "living", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}living."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}living...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self living]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}living...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}living."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}living."];
    }
  }
  if ([self modified]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "modified", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}modified."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}modified...");
#endif
    [[self modified] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}modified...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}modified."];
    }
  }
  if ([self modifiable] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "modifiable", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}modifiable...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self modifiable]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}modifiable...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }
  }
  if ([self multipleFamiliesAsParent] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "multipleFamiliesAsParent", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsParent."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsParent...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self multipleFamiliesAsParent]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsParent...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsParent."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsParent."];
    }
  }
  if ([self multipleFamiliesAsChild] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "multipleFamiliesAsChild", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsChild."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsChild...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self multipleFamiliesAsChild]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsChild...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsChild."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}multipleFamiliesAsChild."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2PersonProperties (JAXB) */

/**
 *  A standardized place.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2Place

/**
 * The place value.
 */
- (NSString *) original
{
  return _original;
}

/**
 * The place value.
 */
- (void) setOriginal: (NSString *) newOriginal
{
  [newOriginal retain];
  [_original release];
  _original = newOriginal;
}

/**
 * The normalized form of the place.
 */
- (FSFAMILYTREEV2NormalizedPlace *) normalized
{
  return _normalized;
}

/**
 * The normalized form of the place.
 */
- (void) setNormalized: (FSFAMILYTREEV2NormalizedPlace *) newNormalized
{
  [newNormalized retain];
  [_normalized release];
  _normalized = newNormalized;
}

/**
 * true, if the normalization is user selected.
 */
- (BOOL *) selected
{
  return _selected;
}

/**
 * true, if the normalization is user selected.
 */
- (void) setSelected: (BOOL *) newSelected
{
  if (_selected != NULL) {
    free(_selected);
  }
  _selected = newSelected;
}

- (void) dealloc
{
  [self setOriginal: nil];
  [self setNormalized: nil];
  [self setSelected: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Place */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Place (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Place (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Place (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Place from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Place defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Place *_fSFAMILYTREEV2Place = [[FSFAMILYTREEV2Place alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Place initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Place dealloc];
    _fSFAMILYTREEV2Place = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Place autorelease];
  return _fSFAMILYTREEV2Place;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Place according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Place to the writer.
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
    && xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setOriginal: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}normalized of type {http://api.familysearch.org/familytree/v2}normalizedPlace.");
#endif
    __child = [FSFAMILYTREEV2NormalizedPlace readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}normalized of type {http://api.familysearch.org/familytree/v2}normalizedPlace.");
#endif

    [self setNormalized: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "selected", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setSelected: ((BOOL*) _child_accessor)];
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

  if ([self original]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}original...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}original."];
    }
  }
  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}normalized."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}normalized...");
#endif
    [[self normalized] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}normalized...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}normalized."];
    }
  }
  if ([self selected] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "selected", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}selected."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self selected]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}selected."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}selected."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Place (JAXB) */

/**
 *  A Family Tree relationship.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Relationship

/**
 * The id of the person.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the person.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The id of the person.
 */
- (NSString *) requestedId
{
  return _requestedId;
}

/**
 * The id of the person.
 */
- (void) setRequestedId: (NSString *) newRequestedId
{
  [newRequestedId retain];
  [_requestedId release];
  _requestedId = newRequestedId;
}

/**
 * In the case of a persona, the id of the person of which this is a persona.
 */
- (NSString *) personId
{
  return _personId;
}

/**
 * In the case of a persona, the id of the person of which this is a persona.
 */
- (void) setPersonId: (NSString *) newPersonId
{
  [newPersonId retain];
  [_personId release];
  _personId = newPersonId;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * the relationship version.
 */
- (NSString *) version
{
  return _version;
}

/**
 * the relationship version.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * A collection of properties for this relationship.
 */
- (FSFAMILYTREEV2RelationshipProperties *) properties
{
  return _properties;
}

/**
 * A collection of properties for this relationship.
 */
- (void) setProperties: (FSFAMILYTREEV2RelationshipProperties *) newProperties
{
  [newProperties retain];
  [_properties release];
  _properties = newProperties;
}

/**
 * A collection of assertions for this person.
 */
- (FSFAMILYTREEV2RelationshipAssertions *) assertions
{
  return _assertions;
}

/**
 * A collection of assertions for this person.
 */
- (void) setAssertions: (FSFAMILYTREEV2RelationshipAssertions *) newAssertions
{
  [newAssertions retain];
  [_assertions release];
  _assertions = newAssertions;
}

/**
 * (no documentation provided)
 */
- (NSArray *) personas
{
  return _personas;
}

/**
 * (no documentation provided)
 */
- (void) setPersonas: (NSArray *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
}

- (void) dealloc
{
  [self setId: nil];
  [self setRequestedId: nil];
  [self setPersonId: nil];
  [self setTempId: nil];
  [self setVersion: nil];
  [self setProperties: nil];
  [self setAssertions: nil];
  [self setPersonas: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Relationship */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Relationship (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Relationship (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Relationship (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Relationship from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Relationship defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Relationship *_fSFAMILYTREEV2Relationship = [[FSFAMILYTREEV2Relationship alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Relationship initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Relationship dealloc];
    _fSFAMILYTREEV2Relationship = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Relationship autorelease];
  return _fSFAMILYTREEV2Relationship;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Relationship according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Relationship to the writer.
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

  if ((xmlStrcmp(BAD_CAST "requestedId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedId...");
#endif
    [self setRequestedId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedId...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "personId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}personId...");
#endif
    [self setPersonId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}personId...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}properties of type {http://api.familysearch.org/familytree/v2}relationshipProperties.");
#endif
    __child = [FSFAMILYTREEV2RelationshipProperties readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}properties of type {http://api.familysearch.org/familytree/v2}relationshipProperties.");
#endif

    [self setProperties: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assertions", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}assertions of type {http://api.familysearch.org/familytree/v2}relationshipAssertions.");
#endif
    __child = [FSFAMILYTREEV2RelationshipAssertions readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}assertions of type {http://api.familysearch.org/familytree/v2}relationshipAssertions.");
#endif

    [self setAssertions: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "personas", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}personas"
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
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personaReference.");
#endif

    __child = [FSFAMILYTREEV2PersonaReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personaReference.");
#endif

    if ([self personas]) {
      [self setPersonas: [[self personas] arrayByAddingObject: __child]];
    }
    else {
      [self setPersonas: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}personas"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPersonas: (NSArray*) __child];
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
  if ([self requestedId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedId...");
#endif
    [[self requestedId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedId."];
    }
  }
  if ([self personId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "personId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}personId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}personId...");
#endif
    [[self personId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}personId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}personId."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "properties", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}properties."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}properties...");
#endif
    [[self properties] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}properties...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}properties."];
    }
  }
  if ([self assertions]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "assertions", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}assertions."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}assertions...");
#endif
    [[self assertions] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}assertions...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}assertions."];
    }
  }
  if ([self personas]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "personas", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
    __enumerator = [[self personas] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persona", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}persona."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}persona...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}persona...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}persona."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Relationship (JAXB) */

/**
 *  Source Repository

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Repository

/**
 * The repository type.
 */
- (enum FSFAMILYTREEV2RepositoryType *) type
{
  return _type;
}

/**
 * The repository type.
 */
- (void) setType: (enum FSFAMILYTREEV2RepositoryType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * the repository name.
 */
- (NSString *) name
{
  return _name;
}

/**
 * the repository name.
 */
- (void) setName: (NSString *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

/**
 * The repository URL.
 */
- (NSString *) url
{
  return _url;
}

/**
 * The repository URL.
 */
- (void) setUrl: (NSString *) newUrl
{
  [newUrl retain];
  [_url release];
  _url = newUrl;
}

/**
 * The repository address.
 */
- (FSFAMILYTREEV2PostalAddress *) address
{
  return _address;
}

/**
 * The repository address.
 */
- (void) setAddress: (FSFAMILYTREEV2PostalAddress *) newAddress
{
  [newAddress retain];
  [_address release];
  _address = newAddress;
}

/**
 * The repository phone number.
 */
- (NSString *) phone
{
  return _phone;
}

/**
 * The repository phone number.
 */
- (void) setPhone: (NSString *) newPhone
{
  [newPhone retain];
  [_phone release];
  _phone = newPhone;
}

/**
 * The repository fax number.
 */
- (NSString *) fax
{
  return _fax;
}

/**
 * The repository fax number.
 */
- (void) setFax: (NSString *) newFax
{
  [newFax retain];
  [_fax release];
  _fax = newFax;
}

/**
 * The repository comment
 */
- (NSString *) comment
{
  return _comment;
}

/**
 * The repository comment
 */
- (void) setComment: (NSString *) newComment
{
  [newComment retain];
  [_comment release];
  _comment = newComment;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setName: nil];
  [self setUrl: nil];
  [self setAddress: nil];
  [self setPhone: nil];
  [self setFax: nil];
  [self setComment: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Repository */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Repository (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Repository (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Repository (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Repository from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Repository defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Repository *_fSFAMILYTREEV2Repository = [[FSFAMILYTREEV2Repository alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Repository initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Repository dealloc];
    _fSFAMILYTREEV2Repository = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Repository autorelease];
  return _fSFAMILYTREEV2Repository;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Repository according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Repository to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2RepositoryTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2RepositoryType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "url", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}url of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}url of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setUrl: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "address", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address of type {http://api.familysearch.org/familytree/v2}postalAddress.");
#endif
    __child = [FSFAMILYTREEV2PostalAddress readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address of type {http://api.familysearch.org/familytree/v2}postalAddress.");
#endif

    [self setAddress: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "phone", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}phone of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}phone of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPhone: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "fax", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}fax of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}fax of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setFax: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "comment", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}comment of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}comment of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setComment: __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2RepositoryTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}name...");
#endif
    [[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}name...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}name."];
    }
  }
  if ([self url]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "url", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}url."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}url...");
#endif
    [[self url] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}url...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}url."];
    }
  }
  if ([self address]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address...");
#endif
    [[self address] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address."];
    }
  }
  if ([self phone]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "phone", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}phone."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}phone...");
#endif
    [[self phone] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}phone...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}phone."];
    }
  }
  if ([self fax]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "fax", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}fax."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}fax...");
#endif
    [[self fax] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}fax...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}fax."];
    }
  }
  if ([self comment]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "comment", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}comment."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}comment...");
#endif
    [[self comment] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}comment...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}comment."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Repository (JAXB) */

/**
 *  User: mullinstw Date: Mar 31, 2009 Time: 12:32:26 PM

 */
@implementation FSFAMILYTREEV2SearchMatchParameters

/**
 * parameters
 */
- (NSArray *) parameters
{
  return _parameters;
}

/**
 * parameters
 */
- (void) setParameters: (NSArray *) newParameters
{
  [newParameters retain];
  [_parameters release];
  _parameters = newParameters;
}

- (void) dealloc
{
  [self setParameters: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SearchMatchParameters */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SearchMatchParameters (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SearchMatchParameters (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SearchMatchParameters (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SearchMatchParameters from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SearchMatchParameters defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SearchMatchParameters *_fSFAMILYTREEV2SearchMatchParameters = [[FSFAMILYTREEV2SearchMatchParameters alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SearchMatchParameters initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SearchMatchParameters dealloc];
    _fSFAMILYTREEV2SearchMatchParameters = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SearchMatchParameters autorelease];
  return _fSFAMILYTREEV2SearchMatchParameters;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SearchMatchParameters according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SearchMatchParameters to the writer.
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
    && xmlStrcmp(BAD_CAST "parameter", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parameter of type {http://api.familysearch.org/familytree/v2}searchMatchParameter.");
#endif

    __child = [FSFAMILYTREEV2SearchMatchParameter readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parameter of type {http://api.familysearch.org/familytree/v2}searchMatchParameter.");
#endif

    if ([self parameters]) {
      [self setParameters: [[self parameters] arrayByAddingObject: __child]];
    }
    else {
      [self setParameters: [NSArray arrayWithObject: __child]];
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

  if ([self parameters]) {
    __enumerator = [[self parameters] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parameter", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parameter."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parameter...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parameter...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parameter."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2SearchMatchParameters (JAXB) */

/**
 *  Citation Source

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Source

/**
 * source type
 */
- (enum FSFAMILYTREEV2SourceType *) type
{
  return _type;
}

/**
 * source type
 */
- (void) setType: (enum FSFAMILYTREEV2SourceType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * (no documentation provided)
 */
- (BOOL *) original
{
  return _original;
}

/**
 * (no documentation provided)
 */
- (void) setOriginal: (BOOL *) newOriginal
{
  if (_original != NULL) {
    free(_original);
  }
  _original = newOriginal;
}

/**
 * source detail
 */
- (enum FSFAMILYTREEV2SourceDetail *) detail
{
  return _detail;
}

/**
 * source detail
 */
- (void) setDetail: (enum FSFAMILYTREEV2SourceDetail *) newDetail
{
  if (_detail != NULL) {
    free(_detail);
  }
  _detail = newDetail;
}

/**
 * source media type
 */
- (enum FSFAMILYTREEV2MediaType *) media
{
  return _media;
}

/**
 * source media type
 */
- (void) setMedia: (enum FSFAMILYTREEV2MediaType *) newMedia
{
  if (_media != NULL) {
    free(_media);
  }
  _media = newMedia;
}

/**
 * The source repository.
 */
- (FSFAMILYTREEV2Repository *) repository
{
  return _repository;
}

/**
 * The source repository.
 */
- (void) setRepository: (FSFAMILYTREEV2Repository *) newRepository
{
  [newRepository retain];
  [_repository release];
  _repository = newRepository;
}

/**
 * source fields.
 */
- (NSArray *) fields
{
  return _fields;
}

/**
 * source fields.
 */
- (void) setFields: (NSArray *) newFields
{
  [newFields retain];
  [_fields release];
  _fields = newFields;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setOriginal: NULL];
  [self setDetail: NULL];
  [self setMedia: NULL];
  [self setRepository: nil];
  [self setFields: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Source */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Source (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Source (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Source (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Source from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Source defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Source *_fSFAMILYTREEV2Source = [[FSFAMILYTREEV2Source alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Source initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Source dealloc];
    _fSFAMILYTREEV2Source = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Source autorelease];
  return _fSFAMILYTREEV2Source;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Source according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Source to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2SourceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2SourceType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setOriginal: ((BOOL*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "detail", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2SourceDetailType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDetail: ((enum FSFAMILYTREEV2SourceDetail*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "media", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2MediaTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setMedia: ((enum FSFAMILYTREEV2MediaType*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "repository", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}repository of type {http://api.familysearch.org/familytree/v2}repository.");
#endif
    __child = [FSFAMILYTREEV2Repository readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}repository of type {http://api.familysearch.org/familytree/v2}repository.");
#endif

    [self setRepository: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "fields", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}fields...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}fields"
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
    && xmlStrcmp(BAD_CAST "field", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}field of type {http://api.familysearch.org/familytree/v2}sourceField.");
#endif

    __child = [FSFAMILYTREEV2SourceField readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}field of type {http://api.familysearch.org/familytree/v2}sourceField.");
#endif

    if ([self fields]) {
      [self setFields: [[self fields] arrayByAddingObject: __child]];
    }
    else {
      [self setFields: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}fields...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}fields"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setFields: (NSArray*) __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2SourceTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self original] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}original...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self original]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}original...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}original."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}original."];
    }
  }
  if ([self detail] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "detail", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}detail."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}detail...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2SourceDetailType(writer, [self detail]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}detail...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}detail."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}detail."];
    }
  }
  if ([self media] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "media", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}media."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}media...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2MediaTypeType(writer, [self media]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}media...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}media."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}media."];
    }
  }
  if ([self repository]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "repository", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}repository."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}repository...");
#endif
    [[self repository] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}repository...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}repository."];
    }
  }
  if ([self fields]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "fields", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}fields."];
    }
    __enumerator = [[self fields] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "field", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}field."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}field...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}field...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}field."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}fields."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Source (JAXB) */

/**
 *  Source Field

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2SourceField

/**
 * (no documentation provided)
 */
- (enum FSFAMILYTREEV2SourceFieldType *) type
{
  return _type;
}

/**
 * (no documentation provided)
 */
- (void) setType: (enum FSFAMILYTREEV2SourceFieldType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
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
  [self setType: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SourceField */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SourceField (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SourceField (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SourceField (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SourceField from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SourceField defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SourceField *_fSFAMILYTREEV2SourceField = [[FSFAMILYTREEV2SourceField alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SourceField initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SourceField dealloc];
    _fSFAMILYTREEV2SourceField = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SourceField autorelease];
  return _fSFAMILYTREEV2SourceField;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SourceField according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SourceField to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2SourceFieldTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2SourceFieldType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2SourceFieldTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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
@end /* implementation FSFAMILYTREEV2SourceField (JAXB) */

/**
 *  Created by IntelliJ IDEA. User: kuehneds Date: Oct 6, 2008 Time: 4:16:16 PM To change this template use File | Settings | File Templates.

 */
@implementation FSFAMILYTREEV2UserPreference

/**
 * (no documentation provided)
 */
- (enum FSFAMILYTREEV2UserPreferenceType *) name
{
  return _name;
}

/**
 * (no documentation provided)
 */
- (void) setName: (enum FSFAMILYTREEV2UserPreferenceType *) newName
{
  if (_name != NULL) {
    free(_name);
  }
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
  [self setName: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2UserPreference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2UserPreference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2UserPreference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2UserPreference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2UserPreference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2UserPreference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2UserPreference *_fSFAMILYTREEV2UserPreference = [[FSFAMILYTREEV2UserPreference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2UserPreference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2UserPreference dealloc];
    _fSFAMILYTREEV2UserPreference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2UserPreference autorelease];
  return _fSFAMILYTREEV2UserPreference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2UserPreference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2UserPreference to the writer.
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
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2UserPreferenceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}name."];
    }
    [self setName: ((enum FSFAMILYTREEV2UserPreferenceType*) _child_accessor)];
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

  if ([self name] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}name...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2UserPreferenceTypeType(writer, [self name]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}name."];
    }
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
@end /* implementation FSFAMILYTREEV2UserPreference (JAXB) */

/**
 *  Selected Information (Selectable Summary).

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ValueSelection

/**
 * The date of the selection.
 */
- (NSDate *) date
{
  return _date;
}

/**
 * The date of the selection.
 */
- (void) setDate: (NSDate *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * The contributor of the selection.
 */
- (FSFAMILYTREEV2EntityReference *) contributor
{
  return _contributor;
}

/**
 * The contributor of the selection.
 */
- (void) setContributor: (FSFAMILYTREEV2EntityReference *) newContributor
{
  [newContributor retain];
  [_contributor release];
  _contributor = newContributor;
}

- (void) dealloc
{
  [self setDate: nil];
  [self setContributor: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ValueSelection */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ValueSelection (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ValueSelection (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ValueSelection (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ValueSelection from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ValueSelection defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ValueSelection *_fSFAMILYTREEV2ValueSelection = [[FSFAMILYTREEV2ValueSelection alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ValueSelection initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ValueSelection dealloc];
    _fSFAMILYTREEV2ValueSelection = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ValueSelection autorelease];
  return _fSFAMILYTREEV2ValueSelection;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ValueSelection according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ValueSelection to the writer.
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
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}date of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif
    __child = [NSDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}date of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setContributor: __child];
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

  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}date."];
    }
  }
  if ([self contributor]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
    [[self contributor] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2ValueSelection (JAXB) */

/**
 *  The results of a search.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2SearchResults

/**
 * The number of returned hits.
 */
- (int) count
{
  return _count;
}

/**
 * The number of returned hits.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * The estimated number of partial hits.
 */
- (int) partial
{
  return _partial;
}

/**
 * The estimated number of partial hits.
 */
- (void) setPartial: (int) newPartial
{
  _partial = newPartial;
}

/**
 * The total number of close hits.
 */
- (int) close
{
  return _close;
}

/**
 * The total number of close hits.
 */
- (void) setClose: (int) newClose
{
  _close = newClose;
}

/**
 * The results in the search.
 */
- (NSArray *) results
{
  return _results;
}

/**
 * The results in the search.
 */
- (void) setResults: (NSArray *) newResults
{
  [newResults retain];
  [_results release];
  _results = newResults;
}

/**
 * The context id for repeating the search.
 */
- (NSString *) contextId
{
  return _contextId;
}

/**
 * The context id for repeating the search.
 */
- (void) setContextId: (NSString *) newContextId
{
  [newContextId retain];
  [_contextId release];
  _contextId = newContextId;
}

/**
 * query parameters
 */
- (FSFAMILYTREEV2SearchMatchParameters *) query
{
  return _query;
}

/**
 * query parameters
 */
- (void) setQuery: (FSFAMILYTREEV2SearchMatchParameters *) newQuery
{
  [newQuery retain];
  [_query release];
  _query = newQuery;
}

- (void) dealloc
{
  [self setResults: nil];
  [self setContextId: nil];
  [self setQuery: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SearchResults */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SearchResults (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SearchResults (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SearchResults (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SearchResults from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SearchResults defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SearchResults *_fSFAMILYTREEV2SearchResults = [[FSFAMILYTREEV2SearchResults alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SearchResults initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SearchResults dealloc];
    _fSFAMILYTREEV2SearchResults = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SearchResults autorelease];
  return _fSFAMILYTREEV2SearchResults;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SearchResults according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SearchResults to the writer.
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

  if ((xmlStrcmp(BAD_CAST "partial", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}partial...");
#endif
    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}partial."];
    }
    [self setPartial: *((int*) _child_accessor)];
    free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}partial...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "close", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}close...");
#endif
    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}close."];
    }
    [self setClose: *((int*) _child_accessor)];
    free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}close...");
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
    && xmlStrcmp(BAD_CAST "search", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}search of type {http://api.familysearch.org/familytree/v2}searchResult.");
#endif

    __child = [FSFAMILYTREEV2SearchResult readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}search of type {http://api.familysearch.org/familytree/v2}searchResult.");
#endif

    if ([self results]) {
      [self setResults: [[self results] arrayByAddingObject: __child]];
    }
    else {
      [self setResults: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contextId", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contextId of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contextId of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setContextId: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "query", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}query of type {http://api.familysearch.org/familytree/v2}searchMatchParameters.");
#endif
    __child = [FSFAMILYTREEV2SearchMatchParameters readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}query of type {http://api.familysearch.org/familytree/v2}searchMatchParameters.");
#endif

    [self setQuery: __child];
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
  if (YES) { //always write the primitive attributes...

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "partial", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}partial."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}partial...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_partial);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}partial."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}partial...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}partial."];
    }
  }
  if (YES) { //always write the primitive attributes...

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "close", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}close."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}close...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_close);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}close."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}close...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}close."];
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

  if ([self results]) {
    __enumerator = [[self results] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "search", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}search."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}search...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}search...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}search."];
      }
    } //end item iterator.
  }
  if ([self contextId]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contextId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contextId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contextId...");
#endif
    [[self contextId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contextId...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contextId."];
    }
  }
  if ([self query]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "query", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}query."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}query...");
#endif
    [[self query] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}query...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}query."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2SearchResults (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2SearchResult

/**
 * The id of the primary person.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the primary person.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The search score for this person.
 */
- (float) score
{
  return _score;
}

/**
 * The search score for this person.
 */
- (void) setScore: (float) newScore
{
  _score = newScore;
}

/**
 * The primary person in this search hit.
 */
- (FSFAMILYTREEV2SearchPerson *) person
{
  return _person;
}

/**
 * The primary person in this search hit.
 */
- (void) setPerson: (FSFAMILYTREEV2SearchPerson *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

/**
 * The parents of the primary person for this search hit.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * The parents of the primary person for this search hit.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * The spouses of the primary person for this search hit.
 */
- (NSArray *) spouses
{
  return _spouses;
}

/**
 * The spouses of the primary person for this search hit.
 */
- (void) setSpouses: (NSArray *) newSpouses
{
  [newSpouses retain];
  [_spouses release];
  _spouses = newSpouses;
}

/**
 * The children of the primary person for this search hit.
 */
- (NSArray *) children
{
  return _children;
}

/**
 * The children of the primary person for this search hit.
 */
- (void) setChildren: (NSArray *) newChildren
{
  [newChildren retain];
  [_children release];
  _children = newChildren;
}

- (void) dealloc
{
  [self setId: nil];
  [self setPerson: nil];
  [self setParents: nil];
  [self setSpouses: nil];
  [self setChildren: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SearchResult */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SearchResult (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SearchResult (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SearchResult (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SearchResult from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SearchResult defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SearchResult *_fSFAMILYTREEV2SearchResult = [[FSFAMILYTREEV2SearchResult alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SearchResult initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SearchResult dealloc];
    _fSFAMILYTREEV2SearchResult = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SearchResult autorelease];
  return _fSFAMILYTREEV2SearchResult;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SearchResult according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SearchResult to the writer.
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
    && xmlStrcmp(BAD_CAST "score", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFloatType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setScore: *((float*) _child_accessor)];
    free(_child_accessor);
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif
    __child = [FSFAMILYTREEV2SearchPerson readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    [self setPerson: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    __child = [FSFAMILYTREEV2SearchPerson readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    __child = [FSFAMILYTREEV2SearchPerson readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    if ([self spouses]) {
      [self setSpouses: [[self spouses] arrayByAddingObject: __child]];
    }
    else {
      [self setSpouses: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    __child = [FSFAMILYTREEV2SearchPerson readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}searchPerson.");
#endif

    if ([self children]) {
      [self setChildren: [[self children] arrayByAddingObject: __child]];
    }
    else {
      [self setChildren: [NSArray arrayWithObject: __child]];
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

  if (YES) { //always write the primitive element...
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "score", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}score."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}score...");
#endif
    status = xmlTextWriterWriteFloatType(writer, &_score);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}score...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}score."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}score."];
    }
  }
  if ([self person]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
      }
    } //end item iterator.
  }
  if ([self spouses]) {
    __enumerator = [[self spouses] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "spouse", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}spouse."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}spouse...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}spouse...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}spouse."];
      }
    } //end item iterator.
  }
  if ([self children]) {
    __enumerator = [[self children] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2SearchResult (JAXB) */

/**
 *  A search parameter.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2SearchMatchParameter

/**
 * The relationship to the primary person of the person to which this parameter applies.
 */
- (enum FSFAMILYTREEV2SearchMatchParameterRelationship *) relationship
{
  return _relationship;
}

/**
 * The relationship to the primary person of the person to which this parameter applies.
 */
- (void) setRelationship: (enum FSFAMILYTREEV2SearchMatchParameterRelationship *) newRelationship
{
  if (_relationship != NULL) {
    free(_relationship);
  }
  _relationship = newRelationship;
}

/**
 * The field to which to apply the value of this parameter.
 */
- (enum FSFAMILYTREEV2SearchMatchParameterField *) field
{
  return _field;
}

/**
 * The field to which to apply the value of this parameter.
 */
- (void) setField: (enum FSFAMILYTREEV2SearchMatchParameterField *) newField
{
  if (_field != NULL) {
    free(_field);
  }
  _field = newField;
}

/**
 * authority id
 */
- (FSFAMILYTREEV2EntityReference *) authority
{
  return _authority;
}

/**
 * authority id
 */
- (void) setAuthority: (FSFAMILYTREEV2EntityReference *) newAuthority
{
  [newAuthority retain];
  [_authority release];
  _authority = newAuthority;
}

/**
 * The value of the parameter.
 */
- (NSString *) value
{
  return _value;
}

/**
 * The value of the parameter.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setRelationship: NULL];
  [self setField: NULL];
  [self setAuthority: nil];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SearchMatchParameter */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SearchMatchParameter (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SearchMatchParameter (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SearchMatchParameter (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SearchMatchParameter from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SearchMatchParameter defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SearchMatchParameter *_fSFAMILYTREEV2SearchMatchParameter = [[FSFAMILYTREEV2SearchMatchParameter alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SearchMatchParameter initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SearchMatchParameter dealloc];
    _fSFAMILYTREEV2SearchMatchParameter = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SearchMatchParameter autorelease];
  return _fSFAMILYTREEV2SearchMatchParameter;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SearchMatchParameter according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SearchMatchParameter to the writer.
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
    && xmlStrcmp(BAD_CAST "relationship", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2SearchMatchParameterRelationshipType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setRelationship: ((enum FSFAMILYTREEV2SearchMatchParameterRelationship*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "field", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2SearchMatchParameterFieldType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setField: ((enum FSFAMILYTREEV2SearchMatchParameterField*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "authority", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}authority of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}authority of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setAuthority: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://www.w3.org/2001/XMLSchema}string.");
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

  if ([self relationship] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "relationship", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}relationship."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}relationship...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2SearchMatchParameterRelationshipType(writer, [self relationship]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}relationship...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}relationship."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}relationship."];
    }
  }
  if ([self field] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "field", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}field."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}field...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2SearchMatchParameterFieldType(writer, [self field]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}field...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}field."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}field."];
    }
  }
  if ([self authority]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "authority", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}authority."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}authority...");
#endif
    [[self authority] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}authority...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}authority."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2SearchMatchParameter (JAXB) */

/**
 *  A FamilyTree relationship properties section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2RelationshipProperties

/**
 * The modified timestamp for this person.
 */
- (NSDate *) modified
{
  return _modified;
}

/**
 * The modified timestamp for this person.
 */
- (void) setModified: (NSDate *) newModified
{
  [newModified retain];
  [_modified release];
  _modified = newModified;
}

- (void) dealloc
{
  [self setModified: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2RelationshipProperties */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2RelationshipProperties (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2RelationshipProperties (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2RelationshipProperties (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2RelationshipProperties from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2RelationshipProperties defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2RelationshipProperties *_fSFAMILYTREEV2RelationshipProperties = [[FSFAMILYTREEV2RelationshipProperties alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2RelationshipProperties initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2RelationshipProperties dealloc];
    _fSFAMILYTREEV2RelationshipProperties = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2RelationshipProperties autorelease];
  return _fSFAMILYTREEV2RelationshipProperties;
}

/**
 * Initialize this instance of FSFAMILYTREEV2RelationshipProperties according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2RelationshipProperties to the writer.
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
    && xmlStrcmp(BAD_CAST "modified", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif
    __child = [NSDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif

    [self setModified: __child];
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

  if ([self modified]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "modified", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}modified."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}modified...");
#endif
    [[self modified] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}modified...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}modified."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2RelationshipProperties (JAXB) */

/**
 *  A FamilyTree relationships asseritons section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2RelationshipAssertions

/**
 * A collection of exists assertions for this relationship.
 */
- (NSArray *) exists
{
  return _exists;
}

/**
 * A collection of exists assertions for this relationship.
 */
- (void) setExists: (NSArray *) newExists
{
  [newExists retain];
  [_exists release];
  _exists = newExists;
}

/**
 * A collection of events for this relationship.
 */
- (NSArray *) events
{
  return _events;
}

/**
 * A collection of events for this relationship.
 */
- (void) setEvents: (NSArray *) newEvents
{
  [newEvents retain];
  [_events release];
  _events = newEvents;
}

/**
 * A collection of characteristics for this relationship.
 */
- (NSArray *) characteristics
{
  return _characteristics;
}

/**
 * A collection of characteristics for this relationship.
 */
- (void) setCharacteristics: (NSArray *) newCharacteristics
{
  [newCharacteristics retain];
  [_characteristics release];
  _characteristics = newCharacteristics;
}

/**
 * A collection of ordinances for this relationship.
 */
- (NSArray *) ordinances
{
  return _ordinances;
}

/**
 * A collection of ordinances for this relationship.
 */
- (void) setOrdinances: (NSArray *) newOrdinances
{
  [newOrdinances retain];
  [_ordinances release];
  _ordinances = newOrdinances;
}

- (void) dealloc
{
  [self setExists: nil];
  [self setEvents: nil];
  [self setCharacteristics: nil];
  [self setOrdinances: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2RelationshipAssertions */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2RelationshipAssertions (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2RelationshipAssertions (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2RelationshipAssertions (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2RelationshipAssertions from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2RelationshipAssertions defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2RelationshipAssertions *_fSFAMILYTREEV2RelationshipAssertions = [[FSFAMILYTREEV2RelationshipAssertions alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2RelationshipAssertions initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2RelationshipAssertions dealloc];
    _fSFAMILYTREEV2RelationshipAssertions = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2RelationshipAssertions autorelease];
  return _fSFAMILYTREEV2RelationshipAssertions;
}

/**
 * Initialize this instance of FSFAMILYTREEV2RelationshipAssertions according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2RelationshipAssertions to the writer.
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
    && xmlStrcmp(BAD_CAST "exists", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}exists...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}exists"
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
    && xmlStrcmp(BAD_CAST "exist", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}exist of type {http://api.familysearch.org/familytree/v2}existsAssertion.");
#endif

    __child = [FSFAMILYTREEV2ExistsAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}exist of type {http://api.familysearch.org/familytree/v2}existsAssertion.");
#endif

    if ([self exists]) {
      [self setExists: [[self exists] arrayByAddingObject: __child]];
    }
    else {
      [self setExists: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}exists...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}exists"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setExists: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "events", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}events...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}events"
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
    && xmlStrcmp(BAD_CAST "event", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}event of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif

    __child = [FSFAMILYTREEV2EventAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}event of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif

    if ([self events]) {
      [self setEvents: [[self events] arrayByAddingObject: __child]];
    }
    else {
      [self setEvents: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}events...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}events"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setEvents: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "characteristics", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}characteristics...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}characteristics"
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
    && xmlStrcmp(BAD_CAST "characteristic", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}characteristic of type {http://api.familysearch.org/familytree/v2}characteristicAssertion.");
#endif

    __child = [FSFAMILYTREEV2CharacteristicAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}characteristic of type {http://api.familysearch.org/familytree/v2}characteristicAssertion.");
#endif

    if ([self characteristics]) {
      [self setCharacteristics: [[self characteristics] arrayByAddingObject: __child]];
    }
    else {
      [self setCharacteristics: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}characteristics...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}characteristics"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setCharacteristics: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "ordinances", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}ordinances...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}ordinances"
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
    && xmlStrcmp(BAD_CAST "ordinance", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}ordinance of type {http://api.familysearch.org/familytree/v2}ordinanceAssertion.");
#endif

    __child = [FSFAMILYTREEV2OrdinanceAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}ordinance of type {http://api.familysearch.org/familytree/v2}ordinanceAssertion.");
#endif

    if ([self ordinances]) {
      [self setOrdinances: [[self ordinances] arrayByAddingObject: __child]];
    }
    else {
      [self setOrdinances: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}ordinances...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}ordinances"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setOrdinances: (NSArray*) __child];
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

  if ([self exists]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "exists", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}exists."];
    }
    __enumerator = [[self exists] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "exist", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}exist."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}exist...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}exist...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}exist."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}exists."];
    }
  }
  if ([self events]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "events", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}events."];
    }
    __enumerator = [[self events] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "event", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}event."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}event...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}event...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}event."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}events."];
    }
  }
  if ([self characteristics]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "characteristics", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}characteristics."];
    }
    __enumerator = [[self characteristics] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "characteristic", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}characteristic."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}characteristic...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}characteristic...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}characteristic."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}characteristics."];
    }
  }
  if ([self ordinances]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "ordinances", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}ordinances."];
    }
    __enumerator = [[self ordinances] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "ordinance", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}ordinance."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}ordinance...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}ordinance...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}ordinance."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}ordinances."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2RelationshipAssertions (JAXB) */

/**
 *  Not used.

 */
@implementation FSFAMILYTREEV2ProxyRole

/**
 * Not used.
 */
- (NSString *) id
{
  return _id;
}

/**
 * Not used.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * Not used.
 */
- (NSString *) contactName
{
  return _contactName;
}

/**
 * Not used.
 */
- (void) setContactName: (NSString *) newContactName
{
  [newContactName retain];
  [_contactName release];
  _contactName = newContactName;
}

/**
 * Not used.
 */
- (NSString *) systemName
{
  return _systemName;
}

/**
 * Not used.
 */
- (void) setSystemName: (NSString *) newSystemName
{
  [newSystemName retain];
  [_systemName release];
  _systemName = newSystemName;
}

- (void) dealloc
{
  [self setId: nil];
  [self setContactName: nil];
  [self setSystemName: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ProxyRole */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ProxyRole (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ProxyRole (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ProxyRole (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ProxyRole from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ProxyRole defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ProxyRole *_fSFAMILYTREEV2ProxyRole = [[FSFAMILYTREEV2ProxyRole alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ProxyRole initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ProxyRole dealloc];
    _fSFAMILYTREEV2ProxyRole = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ProxyRole autorelease];
  return _fSFAMILYTREEV2ProxyRole;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ProxyRole according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ProxyRole to the writer.
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
    && xmlStrcmp(BAD_CAST "contactName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contactName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setContactName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "systemName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}systemName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}systemName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setSystemName: __child];
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

  if ([self contactName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contactName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contactName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contactName...");
#endif
    [[self contactName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contactName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contactName."];
    }
  }
  if ([self systemName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "systemName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}systemName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}systemName...");
#endif
    [[self systemName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}systemName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}systemName."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2ProxyRole (JAXB) */

/**
 *  A proxy for a user.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2Proxy

/**
 * Id of the user that is being proxied.
 */
- (NSString *) id
{
  return _id;
}

/**
 * Id of the user that is being proxied.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The update action to perform on the proxy.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The update action to perform on the proxy.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * Name of the user being proxied.
 */
- (NSString *) name
{
  return _name;
}

/**
 * Name of the user being proxied.
 */
- (void) setName: (NSString *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

/**
 * Access number of the user being proxied.
 */
- (NSString *) accessNumber
{
  return _accessNumber;
}

/**
 * Access number of the user being proxied.
 */
- (void) setAccessNumber: (NSString *) newAccessNumber
{
  [newAccessNumber retain];
  [_accessNumber release];
  _accessNumber = newAccessNumber;
}

/**
 * Birth date of the user to be proxied.
 */
- (NSString *) birth
{
  return _birth;
}

/**
 * Birth date of the user to be proxied.
 */
- (void) setBirth: (NSString *) newBirth
{
  [newBirth retain];
  [_birth release];
  _birth = newBirth;
}

- (void) dealloc
{
  [self setId: nil];
  [self setAction: NULL];
  [self setName: nil];
  [self setAccessNumber: nil];
  [self setBirth: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Proxy */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Proxy (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Proxy (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Proxy (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Proxy from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Proxy defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Proxy *_fSFAMILYTREEV2Proxy = [[FSFAMILYTREEV2Proxy alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Proxy initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Proxy dealloc];
    _fSFAMILYTREEV2Proxy = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Proxy autorelease];
  return _fSFAMILYTREEV2Proxy;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Proxy according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Proxy to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}name of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "accessNumber", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}accessNumber of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}accessNumber of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAccessNumber: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "birth", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}birth of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}birth of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setBirth: __child];
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
  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}name...");
#endif
    [[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}name...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}name."];
    }
  }
  if ([self accessNumber]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "accessNumber", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}accessNumber."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}accessNumber...");
#endif
    [[self accessNumber] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}accessNumber...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}accessNumber."];
    }
  }
  if ([self birth]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "birth", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}birth."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}birth...");
#endif
    [[self birth] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}birth...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}birth."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Proxy (JAXB) */

/**
 *  A postal address.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2PostalAddress

/**
 * The first address field for the postal address.
 */
- (NSString *) address1
{
  return _address1;
}

/**
 * The first address field for the postal address.
 */
- (void) setAddress1: (NSString *) newAddress1
{
  [newAddress1 retain];
  [_address1 release];
  _address1 = newAddress1;
}

/**
 * The second address field for the postal address.
 */
- (NSString *) address2
{
  return _address2;
}

/**
 * The second address field for the postal address.
 */
- (void) setAddress2: (NSString *) newAddress2
{
  [newAddress2 retain];
  [_address2 release];
  _address2 = newAddress2;
}

/**
 * The third address field for the postal address.
 */
- (NSString *) address3
{
  return _address3;
}

/**
 * The third address field for the postal address.
 */
- (void) setAddress3: (NSString *) newAddress3
{
  [newAddress3 retain];
  [_address3 release];
  _address3 = newAddress3;
}

/**
 * The fourth address field for the postal address.
 */
- (NSString *) address4
{
  return _address4;
}

/**
 * The fourth address field for the postal address.
 */
- (void) setAddress4: (NSString *) newAddress4
{
  [newAddress4 retain];
  [_address4 release];
  _address4 = newAddress4;
}

/**
 * The first street field for the postal street.
 */
- (NSString *) street1
{
  return _street1;
}

/**
 * The first street field for the postal street.
 */
- (void) setStreet1: (NSString *) newStreet1
{
  [newStreet1 retain];
  [_street1 release];
  _street1 = newStreet1;
}

/**
 * The second street field for the postal street.
 */
- (NSString *) street2
{
  return _street2;
}

/**
 * The second street field for the postal street.
 */
- (void) setStreet2: (NSString *) newStreet2
{
  [newStreet2 retain];
  [_street2 release];
  _street2 = newStreet2;
}

/**
 * The third street field for the postal street.
 */
- (NSString *) street3
{
  return _street3;
}

/**
 * The third street field for the postal street.
 */
- (void) setStreet3: (NSString *) newStreet3
{
  [newStreet3 retain];
  [_street3 release];
  _street3 = newStreet3;
}

/**
 * The city.
 */
- (NSString *) city
{
  return _city;
}

/**
 * The city.
 */
- (void) setCity: (NSString *) newCity
{
  [newCity retain];
  [_city release];
  _city = newCity;
}

/**
 * The province.
 */
- (NSString *) province
{
  return _province;
}

/**
 * The province.
 */
- (void) setProvince: (NSString *) newProvince
{
  [newProvince retain];
  [_province release];
  _province = newProvince;
}

/**
 * The country.
 */
- (NSString *) country
{
  return _country;
}

/**
 * The country.
 */
- (void) setCountry: (NSString *) newCountry
{
  [newCountry retain];
  [_country release];
  _country = newCountry;
}

/**
 * The postal code.
 */
- (NSString *) postalcode
{
  return _postalcode;
}

/**
 * The postal code.
 */
- (void) setPostalcode: (NSString *) newPostalcode
{
  [newPostalcode retain];
  [_postalcode release];
  _postalcode = newPostalcode;
}

- (void) dealloc
{
  [self setAddress1: nil];
  [self setAddress2: nil];
  [self setAddress3: nil];
  [self setAddress4: nil];
  [self setStreet1: nil];
  [self setStreet2: nil];
  [self setStreet3: nil];
  [self setCity: nil];
  [self setProvince: nil];
  [self setCountry: nil];
  [self setPostalcode: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PostalAddress */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PostalAddress (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PostalAddress (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PostalAddress (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PostalAddress from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PostalAddress defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PostalAddress *_fSFAMILYTREEV2PostalAddress = [[FSFAMILYTREEV2PostalAddress alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PostalAddress initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PostalAddress dealloc];
    _fSFAMILYTREEV2PostalAddress = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PostalAddress autorelease];
  return _fSFAMILYTREEV2PostalAddress;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PostalAddress according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PostalAddress to the writer.
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
    && xmlStrcmp(BAD_CAST "address1", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address1 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address1 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAddress1: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "address2", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address2 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address2 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAddress2: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "address3", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address3 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address3 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAddress3: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "address4", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}address4 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}address4 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAddress4: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "street1", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}street1 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}street1 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setStreet1: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "street2", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}street2 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}street2 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setStreet2: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "street3", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}street3 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}street3 of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setStreet3: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "city", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}city of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}city of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setCity: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "province", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}province of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}province of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setProvince: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "country", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}country of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}country of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setCountry: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "postalcode", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}postalcode of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}postalcode of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPostalcode: __child];
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

  if ([self address1]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address1", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address1."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address1...");
#endif
    [[self address1] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address1...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address1."];
    }
  }
  if ([self address2]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address2", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address2."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address2...");
#endif
    [[self address2] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address2...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address2."];
    }
  }
  if ([self address3]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address3", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address3."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address3...");
#endif
    [[self address3] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address3...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address3."];
    }
  }
  if ([self address4]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "address4", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}address4."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}address4...");
#endif
    [[self address4] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}address4...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}address4."];
    }
  }
  if ([self street1]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "street1", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}street1."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}street1...");
#endif
    [[self street1] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}street1...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}street1."];
    }
  }
  if ([self street2]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "street2", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}street2."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}street2...");
#endif
    [[self street2] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}street2...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}street2."];
    }
  }
  if ([self street3]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "street3", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}street3."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}street3...");
#endif
    [[self street3] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}street3...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}street3."];
    }
  }
  if ([self city]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "city", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}city."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}city...");
#endif
    [[self city] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}city...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}city."];
    }
  }
  if ([self province]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "province", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}province."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}province...");
#endif
    [[self province] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}province...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}province."];
    }
  }
  if ([self country]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "country", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}country."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}country...");
#endif
    [[self country] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}country...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}country."];
    }
  }
  if ([self postalcode]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "postalcode", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}postalcode."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}postalcode...");
#endif
    [[self postalcode] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}postalcode...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}postalcode."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2PostalAddress (JAXB) */

/**
 *  A FamilyTree person relationships section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonRelationships

/**
 * A collection of parent relationships for this person.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * A collection of parent relationships for this person.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * A collection of spouse relationships for this person.
 */
- (NSArray *) spouses
{
  return _spouses;
}

/**
 * A collection of spouse relationships for this person.
 */
- (void) setSpouses: (NSArray *) newSpouses
{
  [newSpouses retain];
  [_spouses release];
  _spouses = newSpouses;
}

/**
 * A collection of parent relationships for this person.
 */
- (NSArray *) children
{
  return _children;
}

/**
 * A collection of parent relationships for this person.
 */
- (void) setChildren: (NSArray *) newChildren
{
  [newChildren retain];
  [_children release];
  _children = newChildren;
}

- (void) dealloc
{
  [self setParents: nil];
  [self setSpouses: nil];
  [self setChildren: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonRelationships */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonRelationships (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonRelationships (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonRelationships (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonRelationships from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonRelationships defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonRelationships *_fSFAMILYTREEV2PersonRelationships = [[FSFAMILYTREEV2PersonRelationships alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonRelationships initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonRelationships dealloc];
    _fSFAMILYTREEV2PersonRelationships = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonRelationships autorelease];
  return _fSFAMILYTREEV2PersonRelationships;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonRelationships according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonRelationships to the writer.
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
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    __child = [FSFAMILYTREEV2Relationship readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    __child = [FSFAMILYTREEV2Relationship readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    if ([self spouses]) {
      [self setSpouses: [[self spouses] arrayByAddingObject: __child]];
    }
    else {
      [self setSpouses: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    __child = [FSFAMILYTREEV2Relationship readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}relationship.");
#endif

    if ([self children]) {
      [self setChildren: [[self children] arrayByAddingObject: __child]];
    }
    else {
      [self setChildren: [NSArray arrayWithObject: __child]];
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

  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
      }
    } //end item iterator.
  }
  if ([self spouses]) {
    __enumerator = [[self spouses] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "spouse", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}spouse."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}spouse...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}spouse...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}spouse."];
      }
    } //end item iterator.
  }
  if ([self children]) {
    __enumerator = [[self children] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2PersonRelationships (JAXB) */

/**
 *  A FamilyTree person asseritons section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonPersonas

/**
 * The action to take on the personas.
 */
- (enum FSFAMILYTREEV2CombineSeparateAction *) action
{
  return _action;
}

/**
 * The action to take on the personas.
 */
- (void) setAction: (enum FSFAMILYTREEV2CombineSeparateAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * Temp id for when you're moving records.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * Temp id for when you're moving records.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The target id to use when combining personas to a specific person.
 */
- (FSFAMILYTREEV2EntityReference *) target
{
  return _target;
}

/**
 * The target id to use when combining personas to a specific person.
 */
- (void) setTarget: (FSFAMILYTREEV2EntityReference *) newTarget
{
  [newTarget retain];
  [_target release];
  _target = newTarget;
}

/**
 * A collection of persona references for this person.
 */
- (NSArray *) personas
{
  return _personas;
}

/**
 * A collection of persona references for this person.
 */
- (void) setPersonas: (NSArray *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
}

- (void) dealloc
{
  [self setAction: NULL];
  [self setTempId: nil];
  [self setTarget: nil];
  [self setPersonas: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonPersonas */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonPersonas (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonPersonas (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonPersonas (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonPersonas from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonPersonas defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonPersonas *_fSFAMILYTREEV2PersonPersonas = [[FSFAMILYTREEV2PersonPersonas alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonPersonas initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonPersonas dealloc];
    _fSFAMILYTREEV2PersonPersonas = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonPersonas autorelease];
  return _fSFAMILYTREEV2PersonPersonas;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonPersonas according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonPersonas to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2CombineSeparateActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2CombineSeparateAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "target", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}target of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}target of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setTarget: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personPersona.");
#endif

    __child = [FSFAMILYTREEV2PersonPersona readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personPersona.");
#endif

    if ([self personas]) {
      [self setPersonas: [[self personas] arrayByAddingObject: __child]];
    }
    else {
      [self setPersonas: [NSArray arrayWithObject: __child]];
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

  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2CombineSeparateActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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

  if ([self target]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "target", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}target."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}target...");
#endif
    [[self target] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}target...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}target."];
    }
  }
  if ([self personas]) {
    __enumerator = [[self personas] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persona", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}persona."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}persona...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}persona...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}persona."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2PersonPersonas (JAXB) */

/**
 *  A FamilyTree person identifiers section.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonIdentifiers

/**
 * The list of person identifiers.
 */
- (NSArray *) identifiers
{
  return _identifiers;
}

/**
 * The list of person identifiers.
 */
- (void) setIdentifiers: (NSArray *) newIdentifiers
{
  [newIdentifiers retain];
  [_identifiers release];
  _identifiers = newIdentifiers;
}

- (void) dealloc
{
  [self setIdentifiers: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonIdentifiers */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonIdentifiers (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonIdentifiers (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonIdentifiers (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonIdentifiers from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonIdentifiers defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonIdentifiers *_fSFAMILYTREEV2PersonIdentifiers = [[FSFAMILYTREEV2PersonIdentifiers alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonIdentifiers initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonIdentifiers dealloc];
    _fSFAMILYTREEV2PersonIdentifiers = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonIdentifiers autorelease];
  return _fSFAMILYTREEV2PersonIdentifiers;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonIdentifiers according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonIdentifiers to the writer.
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
    && xmlStrcmp(BAD_CAST "identifier", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}identifier of type {http://api.familysearch.org/familytree/v2}personIdentifier.");
#endif

    __child = [FSFAMILYTREEV2PersonIdentifier readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}identifier of type {http://api.familysearch.org/familytree/v2}personIdentifier.");
#endif

    if ([self identifiers]) {
      [self setIdentifiers: [[self identifiers] arrayByAddingObject: __child]];
    }
    else {
      [self setIdentifiers: [NSArray arrayWithObject: __child]];
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

  if ([self identifiers]) {
    __enumerator = [[self identifiers] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "identifier", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}identifier."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}identifier...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}identifier...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}identifier."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2PersonIdentifiers (JAXB) */

/**
 *  A FamilyTree person asseritons section.

 @author Rob Lyon
 @author Duane Kuehne

 */
@implementation FSFAMILYTREEV2PersonAssertions

/**
 * A collection of exists assertions for this person.
 */
- (NSArray *) exists
{
  return _exists;
}

/**
 * A collection of exists assertions for this person.
 */
- (void) setExists: (NSArray *) newExists
{
  [newExists retain];
  [_exists release];
  _exists = newExists;
}

/**
 * A collection of names for this person.
 */
- (NSArray *) names
{
  return _names;
}

/**
 * A collection of names for this person.
 */
- (void) setNames: (NSArray *) newNames
{
  [newNames retain];
  [_names release];
  _names = newNames;
}

/**
 * A collection of genders for this person.
 */
- (NSArray *) genders
{
  return _genders;
}

/**
 * A collection of genders for this person.
 */
- (void) setGenders: (NSArray *) newGenders
{
  [newGenders retain];
  [_genders release];
  _genders = newGenders;
}

/**
 * A collection of events for this person.
 */
- (NSArray *) events
{
  return _events;
}

/**
 * A collection of events for this person.
 */
- (void) setEvents: (NSArray *) newEvents
{
  [newEvents retain];
  [_events release];
  _events = newEvents;
}

/**
 * A collection of characteristics for this person.
 */
- (NSArray *) characteristics
{
  return _characteristics;
}

/**
 * A collection of characteristics for this person.
 */
- (void) setCharacteristics: (NSArray *) newCharacteristics
{
  [newCharacteristics retain];
  [_characteristics release];
  _characteristics = newCharacteristics;
}

/**
 * A collection of ordinances for this person.
 */
- (NSArray *) ordinances
{
  return _ordinances;
}

/**
 * A collection of ordinances for this person.
 */
- (void) setOrdinances: (NSArray *) newOrdinances
{
  [newOrdinances retain];
  [_ordinances release];
  _ordinances = newOrdinances;
}

- (void) dealloc
{
  [self setExists: nil];
  [self setNames: nil];
  [self setGenders: nil];
  [self setEvents: nil];
  [self setCharacteristics: nil];
  [self setOrdinances: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonAssertions */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonAssertions (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonAssertions (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonAssertions (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonAssertions from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonAssertions defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonAssertions *_fSFAMILYTREEV2PersonAssertions = [[FSFAMILYTREEV2PersonAssertions alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonAssertions initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonAssertions dealloc];
    _fSFAMILYTREEV2PersonAssertions = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonAssertions autorelease];
  return _fSFAMILYTREEV2PersonAssertions;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonAssertions according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonAssertions to the writer.
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
    && xmlStrcmp(BAD_CAST "exists", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}exists...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}exists"
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
    && xmlStrcmp(BAD_CAST "exist", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}exist of type {http://api.familysearch.org/familytree/v2}existsAssertion.");
#endif

    __child = [FSFAMILYTREEV2ExistsAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}exist of type {http://api.familysearch.org/familytree/v2}existsAssertion.");
#endif

    if ([self exists]) {
      [self setExists: [[self exists] arrayByAddingObject: __child]];
    }
    else {
      [self setExists: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}exists...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}exists"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setExists: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "names", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}names...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}names"
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
    && xmlStrcmp(BAD_CAST "name", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}name of type {http://api.familysearch.org/familytree/v2}nameAssertion.");
#endif

    __child = [FSFAMILYTREEV2NameAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}name of type {http://api.familysearch.org/familytree/v2}nameAssertion.");
#endif

    if ([self names]) {
      [self setNames: [[self names] arrayByAddingObject: __child]];
    }
    else {
      [self setNames: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}names...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}names"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setNames: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "genders", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}genders...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}genders"
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
    && xmlStrcmp(BAD_CAST "gender", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}gender of type {http://api.familysearch.org/familytree/v2}genderAssertion.");
#endif

    __child = [FSFAMILYTREEV2GenderAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}gender of type {http://api.familysearch.org/familytree/v2}genderAssertion.");
#endif

    if ([self genders]) {
      [self setGenders: [[self genders] arrayByAddingObject: __child]];
    }
    else {
      [self setGenders: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}genders...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}genders"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setGenders: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "events", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}events...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}events"
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
    && xmlStrcmp(BAD_CAST "event", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}event of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif

    __child = [FSFAMILYTREEV2EventAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}event of type {http://api.familysearch.org/familytree/v2}eventAssertion.");
#endif

    if ([self events]) {
      [self setEvents: [[self events] arrayByAddingObject: __child]];
    }
    else {
      [self setEvents: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}events...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}events"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setEvents: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "characteristics", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}characteristics...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}characteristics"
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
    && xmlStrcmp(BAD_CAST "characteristic", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}characteristic of type {http://api.familysearch.org/familytree/v2}characteristicAssertion.");
#endif

    __child = [FSFAMILYTREEV2CharacteristicAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}characteristic of type {http://api.familysearch.org/familytree/v2}characteristicAssertion.");
#endif

    if ([self characteristics]) {
      [self setCharacteristics: [[self characteristics] arrayByAddingObject: __child]];
    }
    else {
      [self setCharacteristics: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}characteristics...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}characteristics"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setCharacteristics: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "ordinances", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}ordinances...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}ordinances"
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
    && xmlStrcmp(BAD_CAST "ordinance", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}ordinance of type {http://api.familysearch.org/familytree/v2}ordinanceAssertion.");
#endif

    __child = [FSFAMILYTREEV2OrdinanceAssertion readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}ordinance of type {http://api.familysearch.org/familytree/v2}ordinanceAssertion.");
#endif

    if ([self ordinances]) {
      [self setOrdinances: [[self ordinances] arrayByAddingObject: __child]];
    }
    else {
      [self setOrdinances: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}ordinances...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}ordinances"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setOrdinances: (NSArray*) __child];
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

  if ([self exists]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "exists", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}exists."];
    }
    __enumerator = [[self exists] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "exist", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}exist."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}exist...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}exist...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}exist."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}exists."];
    }
  }
  if ([self names]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "names", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}names."];
    }
    __enumerator = [[self names] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "name", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}name."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}name...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}name...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}name."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}names."];
    }
  }
  if ([self genders]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "genders", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}genders."];
    }
    __enumerator = [[self genders] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "gender", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}gender."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}gender...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}gender...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}gender."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}genders."];
    }
  }
  if ([self events]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "events", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}events."];
    }
    __enumerator = [[self events] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "event", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}event."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}event...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}event...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}event."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}events."];
    }
  }
  if ([self characteristics]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "characteristics", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}characteristics."];
    }
    __enumerator = [[self characteristics] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "characteristic", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}characteristic."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}characteristic...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}characteristic...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}characteristic."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}characteristics."];
    }
  }
  if ([self ordinances]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "ordinances", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}ordinances."];
    }
    __enumerator = [[self ordinances] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "ordinance", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}ordinance."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}ordinance...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}ordinance...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}ordinance."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}ordinances."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2PersonAssertions (JAXB) */

/**
 *  A Family Tree person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Person

/**
 * The id of the person.
 */
- (NSString *) requestedId
{
  return _requestedId;
}

/**
 * The id of the person.
 */
- (void) setRequestedId: (NSString *) newRequestedId
{
  [newRequestedId retain];
  [_requestedId release];
  _requestedId = newRequestedId;
}

/**
 * The version number for this person.
 */
- (NSString *) version
{
  return _version;
}

/**
 * The version number for this person.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * The id of the person.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the person.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
	_personId = newId;
}

/**
 * In the case of a persona, the id of the person of which this is a persona.
 */
- (NSString *) personId
{
  return _personId;
}

/**
 * In the case of a persona, the id of the person of which this is a persona.
 */
- (void) setPersonId: (NSString *) newPersonId
{
  [newPersonId retain];
  [_personId release];
  _personId = newPersonId;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * A collection of properties for this person.
 */
- (FSFAMILYTREEV2PersonProperties *) properties
{
  return _properties;
}

/**
 * A collection of properties for this person.
 */
- (void) setProperties: (FSFAMILYTREEV2PersonProperties *) newProperties
{
  [newProperties retain];
  [_properties release];
  _properties = newProperties;
}

/**
 * A collection of identifiers for this person.
 */
- (FSFAMILYTREEV2PersonIdentifiers *) identifiers
{
  return _identifiers;
}

/**
 * A collection of identifiers for this person.
 */
- (void) setIdentifiers: (FSFAMILYTREEV2PersonIdentifiers *) newIdentifiers
{
  [newIdentifiers retain];
  [_identifiers release];
  _identifiers = newIdentifiers;
}

/**
 * A collection of assertions for this person.
 */
- (FSFAMILYTREEV2PersonAssertions *) assertions
{
  return _assertions;
}

/**
 * A collection of assertions for this person.
 */
- (void) setAssertions: (FSFAMILYTREEV2PersonAssertions *) newAssertions
{
  [newAssertions retain];
  [_assertions release];
  _assertions = newAssertions;
}

/**
 * A collection of families for this person.
 */
- (NSArray *) families
{
  return _families;
}

/**
 * A collection of families for this person.
 */
- (void) setFamilies: (NSArray *) newFamilies
{
  [newFamilies retain];
  [_families release];
  _families = newFamilies;
}

/**
 * A collection of parents for this person.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * A collection of parents for this person.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * A collection of persona references for this person.
 */
- (FSFAMILYTREEV2PersonPersonas *) personas
{
  return _personas;
}

/**
 * A collection of persona references for this person.
 */
- (void) setPersonas: (FSFAMILYTREEV2PersonPersonas *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
}

/**
 * The relationships.
 */
- (FSFAMILYTREEV2PersonRelationships *) relationships
{
  return _relationships;
}

/**
 * The relationships.
 */
- (void) setRelationships: (FSFAMILYTREEV2PersonRelationships *) newRelationships
{
  [newRelationships retain];
  [_relationships release];
  _relationships = newRelationships;
}

/**
 * A list of changes to the person
 */
- (FSFAMILYTREEV2Changes *) changes
{
  return _changes;
}

/**
 * A list of changes to the person
 */
- (void) setChanges: (FSFAMILYTREEV2Changes *) newChanges
{
  [newChanges retain];
  [_changes release];
  _changes = newChanges;
}

- (void) dealloc
{
  [self setRequestedId: nil];
  [self setVersion: nil];
  [self setId: nil];
  [self setPersonId: nil];
  [self setTempId: nil];
  [self setProperties: nil];
  [self setIdentifiers: nil];
  [self setAssertions: nil];
  [self setFamilies: nil];
  [self setParents: nil];
  [self setPersonas: nil];
  [self setRelationships: nil];
  [self setChanges: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Person */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Person (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Person (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Person (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Person from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Person defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Person *_fSFAMILYTREEV2Person = [[FSFAMILYTREEV2Person alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Person initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Person dealloc];
    _fSFAMILYTREEV2Person = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Person autorelease];
  return _fSFAMILYTREEV2Person;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Person according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Person to the writer.
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

  if ((xmlStrcmp(BAD_CAST "requestedId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedId...");
#endif
    [self setRequestedId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedId...");
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

  if ((xmlStrcmp(BAD_CAST "personId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}personId...");
#endif
    [self setPersonId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}personId...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}properties of type {http://api.familysearch.org/familytree/v2}personProperties.");
#endif
    __child = [FSFAMILYTREEV2PersonProperties readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}properties of type {http://api.familysearch.org/familytree/v2}personProperties.");
#endif

    [self setProperties: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "identifiers", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}identifiers of type {http://api.familysearch.org/familytree/v2}personIdentifiers.");
#endif
    __child = [FSFAMILYTREEV2PersonIdentifiers readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}identifiers of type {http://api.familysearch.org/familytree/v2}personIdentifiers.");
#endif

    [self setIdentifiers: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assertions", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}assertions of type {http://api.familysearch.org/familytree/v2}personAssertions.");
#endif
    __child = [FSFAMILYTREEV2PersonAssertions readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}assertions of type {http://api.familysearch.org/familytree/v2}personAssertions.");
#endif

    [self setAssertions: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "families", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}families...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}families"
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
    && xmlStrcmp(BAD_CAST "family", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}family of type {http://api.familysearch.org/familytree/v2}familyReference.");
#endif

    __child = [FSFAMILYTREEV2FamilyReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}family of type {http://api.familysearch.org/familytree/v2}familyReference.");
#endif

    if ([self families]) {
      [self setFamilies: [[self families] arrayByAddingObject: __child]];
    }
    else {
      [self setFamilies: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}families...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}families"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setFamilies: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}parents...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}parents"
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
    && xmlStrcmp(BAD_CAST "couple", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}couple of type {http://api.familysearch.org/familytree/v2}parentsReference.");
#endif

    __child = [FSFAMILYTREEV2ParentsReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}couple of type {http://api.familysearch.org/familytree/v2}parentsReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}parents...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}parents"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setParents: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "personas", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}personas of type {http://api.familysearch.org/familytree/v2}personPersonas.");
#endif
    __child = [FSFAMILYTREEV2PersonPersonas readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}personas of type {http://api.familysearch.org/familytree/v2}personPersonas.");
#endif

    [self setPersonas: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "relationships", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}relationships of type {http://api.familysearch.org/familytree/v2}personRelationships.");
#endif
    __child = [FSFAMILYTREEV2PersonRelationships readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}relationships of type {http://api.familysearch.org/familytree/v2}personRelationships.");
#endif

    [self setRelationships: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "changes", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}changes of type {http://api.familysearch.org/familytree/v2}changes.");
#endif
    __child = [FSFAMILYTREEV2Changes readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}changes of type {http://api.familysearch.org/familytree/v2}changes.");
#endif

    [self setChanges: __child];
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

  if ([self requestedId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedId...");
#endif
    [[self requestedId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedId."];
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
  if ([self personId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "personId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}personId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}personId...");
#endif
    [[self personId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}personId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}personId."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "properties", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}properties."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}properties...");
#endif
    [[self properties] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}properties...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}properties."];
    }
  }
  if ([self identifiers]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "identifiers", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}identifiers."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}identifiers...");
#endif
    [[self identifiers] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}identifiers...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}identifiers."];
    }
  }
  if ([self assertions]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "assertions", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}assertions."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}assertions...");
#endif
    [[self assertions] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}assertions...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}assertions."];
    }
  }
  if ([self families]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "families", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}families."];
    }
    __enumerator = [[self families] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "family", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}family."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}family...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}family...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}family."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}families."];
    }
  }
  if ([self parents]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parents", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}parents."];
    }
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "couple", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}couple."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}couple...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}couple...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}couple."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}parents."];
    }
  }
  if ([self personas]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "personas", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}personas."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}personas...");
#endif
    [[self personas] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}personas...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}personas."];
    }
  }
  if ([self relationships]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "relationships", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}relationships."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}relationships...");
#endif
    [[self relationships] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}relationships...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}relationships."];
    }
  }
  if ([self changes]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "changes", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}changes."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}changes...");
#endif
    [[self changes] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}changes...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}changes."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Person (JAXB) */

/**
 *  A FamilyTree parents.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ParentsReference

/**
 * The action.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The action.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * A collection of parents for this family.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * A collection of parents for this family.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

- (void) dealloc
{
  [self setAction: NULL];
  [self setParents: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ParentsReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ParentsReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ParentsReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ParentsReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ParentsReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ParentsReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ParentsReference *_fSFAMILYTREEV2ParentsReference = [[FSFAMILYTREEV2ParentsReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ParentsReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ParentsReference dealloc];
    _fSFAMILYTREEV2ParentsReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ParentsReference autorelease];
  return _fSFAMILYTREEV2ParentsReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ParentsReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ParentsReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
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
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
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

  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
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

  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2ParentsReference (JAXB) */

/**
 *  Authority normalized place.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2NormalizedPlace

/**
 * The place authority id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The place authority id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The place authority version.
 */
- (NSString *) version
{
  return _version;
}

/**
 * The place authority version.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * The value.
 */
- (NSString *) value
{
  return _value;
}

/**
 * The value.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setId: nil];
  [self setVersion: nil];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2NormalizedPlace */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2NormalizedPlace (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2NormalizedPlace (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2NormalizedPlace (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2NormalizedPlace from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2NormalizedPlace defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2NormalizedPlace *_fSFAMILYTREEV2NormalizedPlace = [[FSFAMILYTREEV2NormalizedPlace alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2NormalizedPlace initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2NormalizedPlace dealloc];
    _fSFAMILYTREEV2NormalizedPlace = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2NormalizedPlace autorelease];
  return _fSFAMILYTREEV2NormalizedPlace;
}

/**
 * Initialize this instance of FSFAMILYTREEV2NormalizedPlace according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2NormalizedPlace to the writer.
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
@end /* implementation FSFAMILYTREEV2NormalizedPlace (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2MatchResults

/**
 * The id of the person to which the matches are applicable.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the person to which the matches are applicable.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The count of matches.
 */
- (int) count
{
  return _count;
}

/**
 * The count of matches.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * The matches.
 */
- (NSArray *) results
{
  return _results;
}

/**
 * The matches.
 */
- (void) setResults: (NSArray *) newResults
{
  [newResults retain];
  [_results release];
  _results = newResults;
}

/**
 * query parameters
 */
- (FSFAMILYTREEV2SearchMatchParameters *) query
{
  return _query;
}

/**
 * query parameters
 */
- (void) setQuery: (FSFAMILYTREEV2SearchMatchParameters *) newQuery
{
  [newQuery retain];
  [_query release];
  _query = newQuery;
}

- (void) dealloc
{
  [self setId: nil];
  [self setResults: nil];
  [self setQuery: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2MatchResults */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2MatchResults (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2MatchResults (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2MatchResults (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2MatchResults from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2MatchResults defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2MatchResults *_fSFAMILYTREEV2MatchResults = [[FSFAMILYTREEV2MatchResults alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2MatchResults initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2MatchResults dealloc];
    _fSFAMILYTREEV2MatchResults = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2MatchResults autorelease];
  return _fSFAMILYTREEV2MatchResults;
}

/**
 * Initialize this instance of FSFAMILYTREEV2MatchResults according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2MatchResults to the writer.
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
    && xmlStrcmp(BAD_CAST "match", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}match of type {http://api.familysearch.org/familytree/v2}matchResult.");
#endif

    __child = [FSFAMILYTREEV2MatchResult readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}match of type {http://api.familysearch.org/familytree/v2}matchResult.");
#endif

    if ([self results]) {
      [self setResults: [[self results] arrayByAddingObject: __child]];
    }
    else {
      [self setResults: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "query", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}query of type {http://api.familysearch.org/familytree/v2}searchMatchParameters.");
#endif
    __child = [FSFAMILYTREEV2SearchMatchParameters readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}query of type {http://api.familysearch.org/familytree/v2}searchMatchParameters.");
#endif

    [self setQuery: __child];
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

  if ([self results]) {
    __enumerator = [[self results] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "match", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}match."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}match...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}match...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}match."];
      }
    } //end item iterator.
  }
  if ([self query]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "query", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}query."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}query...");
#endif
    [[self query] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}query...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}query."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2MatchResults (JAXB) */

/**
 *  An Assertion Comment.

 @author Ryan Heaton
 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Citation

/**
 * citation type
 */
- (enum FSFAMILYTREEV2CitationType *) type
{
  return _type;
}

/**
 * citation type
 */
- (void) setType: (enum FSFAMILYTREEV2CitationType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The id of the citation.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the citation.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The action.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The action.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * A temporary id for this citation (e.g. for a citation not persisted yet).
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * A temporary id for this citation (e.g. for a citation not persisted yet).
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The persona id for this citation
 */
- (FSFAMILYTREEV2EntityReference *) person
{
  return _person;
}

/**
 * The persona id for this citation
 */
- (void) setPerson: (FSFAMILYTREEV2EntityReference *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

/**
 * The parent ids for this citation
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * The parent ids for this citation
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * The spouse ids for this citation
 */
- (NSArray *) spouses
{
  return _spouses;
}

/**
 * The spouse ids for this citation
 */
- (void) setSpouses: (NSArray *) newSpouses
{
  [newSpouses retain];
  [_spouses release];
  _spouses = newSpouses;
}

/**
 * The child id for this citation
 */
- (FSFAMILYTREEV2EntityReference *) child
{
  return _child;
}

/**
 * The child id for this citation
 */
- (void) setChild: (FSFAMILYTREEV2EntityReference *) newChild
{
  [newChild retain];
  [_child release];
  _child = newChild;
}

/**
 * assertionId
 */
- (FSFAMILYTREEV2EntityReference *) assertion
{
  return _assertion;
}

/**
 * assertionId
 */
- (void) setAssertion: (FSFAMILYTREEV2EntityReference *) newAssertion
{
  [newAssertion retain];
  [_assertion release];
  _assertion = newAssertion;
}

/**
 * a reference to the contributor of the change.
 */
- (FSFAMILYTREEV2EntityReference *) contributor
{
  return _contributor;
}

/**
 * a reference to the contributor of the change.
 */
- (void) setContributor: (FSFAMILYTREEV2EntityReference *) newContributor
{
  [newContributor retain];
  [_contributor release];
  _contributor = newContributor;
}

/**
 * a reference to the submitter.
 */
- (FSFAMILYTREEV2EntityReference *) submitter
{
  return _submitter;
}

/**
 * a reference to the submitter.
 */
- (void) setSubmitter: (FSFAMILYTREEV2EntityReference *) newSubmitter
{
  [newSubmitter retain];
  [_submitter release];
  _submitter = newSubmitter;
}

/**
 * the assertion assertion.
 */
- (enum FSFAMILYTREEV2AssertionDisposition *) disposition
{
  return _disposition;
}

/**
 * the assertion assertion.
 */
- (void) setDisposition: (enum FSFAMILYTREEV2AssertionDisposition *) newDisposition
{
  if (_disposition != NULL) {
    free(_disposition);
  }
  _disposition = newDisposition;
}

/**
 * (no documentation provided)
 */
- (BOOL *) primarySource
{
  return _primarySource;
}

/**
 * (no documentation provided)
 */
- (void) setPrimarySource: (BOOL *) newPrimarySource
{
  if (_primarySource != NULL) {
    free(_primarySource);
  }
  _primarySource = newPrimarySource;
}

/**
 * (no documentation provided)
 */
- (BOOL *) directEvidence
{
  return _directEvidence;
}

/**
 * (no documentation provided)
 */
- (void) setDirectEvidence: (BOOL *) newDirectEvidence
{
  if (_directEvidence != NULL) {
    free(_directEvidence);
  }
  _directEvidence = newDirectEvidence;
}

/**
 * (no documentation provided)
 */
- (NSString *) entryDate
{
  return _entryDate;
}

/**
 * (no documentation provided)
 */
- (void) setEntryDate: (NSString *) newEntryDate
{
  [newEntryDate retain];
  [_entryDate release];
  _entryDate = newEntryDate;
}

/**
 * citation fields.
 */
- (NSArray *) fields
{
  return _fields;
}

/**
 * citation fields.
 */
- (void) setFields: (NSArray *) newFields
{
  [newFields retain];
  [_fields release];
  _fields = newFields;
}

/**
 * The citation source.
 */
- (FSFAMILYTREEV2Source *) source
{
  return _source;
}

/**
 * The citation source.
 */
- (void) setSource: (FSFAMILYTREEV2Source *) newSource
{
  [newSource retain];
  [_source release];
  _source = newSource;
}

/**
 * The citation comment.
 */
- (NSString *) comment
{
  return _comment;
}

/**
 * The citation comment.
 */
- (void) setComment: (NSString *) newComment
{
  [newComment retain];
  [_comment release];
  _comment = newComment;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setId: nil];
  [self setAction: NULL];
  [self setTempId: nil];
  [self setPerson: nil];
  [self setParents: nil];
  [self setSpouses: nil];
  [self setChild: nil];
  [self setAssertion: nil];
  [self setContributor: nil];
  [self setSubmitter: nil];
  [self setDisposition: NULL];
  [self setPrimarySource: NULL];
  [self setDirectEvidence: NULL];
  [self setEntryDate: nil];
  [self setFields: nil];
  [self setSource: nil];
  [self setComment: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Citation */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Citation (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Citation (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Citation (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Citation from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Citation defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Citation *_fSFAMILYTREEV2Citation = [[FSFAMILYTREEV2Citation alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Citation initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Citation dealloc];
    _fSFAMILYTREEV2Citation = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Citation autorelease];
  return _fSFAMILYTREEV2Citation;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Citation according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Citation to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2CitationTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2CitationType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
#endif
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setPerson: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouses", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}spouses of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}spouses of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self spouses]) {
      [self setSpouses: [[self spouses] arrayByAddingObject: __child]];
    }
    else {
      [self setSpouses: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setChild: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assertion", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setAssertion: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setContributor: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "submitter", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setSubmitter: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "disposition", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDisposition: ((enum FSFAMILYTREEV2AssertionDisposition*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "primarySource", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setPrimarySource: ((BOOL*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "directEvidence", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDirectEvidence: ((BOOL*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "entryDate", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}entryDate of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}entryDate of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setEntryDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "fields", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}fields...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}fields"
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
    && xmlStrcmp(BAD_CAST "field", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}field of type {http://api.familysearch.org/familytree/v2}citationField.");
#endif

    __child = [FSFAMILYTREEV2CitationField readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}field of type {http://api.familysearch.org/familytree/v2}citationField.");
#endif

    if ([self fields]) {
      [self setFields: [[self fields] arrayByAddingObject: __child]];
    }
    else {
      [self setFields: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}fields...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}fields"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setFields: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "source", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}source of type {http://api.familysearch.org/familytree/v2}source.");
#endif
    __child = [FSFAMILYTREEV2Source readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}source of type {http://api.familysearch.org/familytree/v2}source.");
#endif

    [self setSource: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "comment", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}comment of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}comment of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setComment: __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2CitationTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
    }
  }
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
  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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

  if ([self person]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parents", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parents."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parents...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parents...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parents."];
      }
    } //end item iterator.
  }
  if ([self spouses]) {
    __enumerator = [[self spouses] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "spouses", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}spouses."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}spouses...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}spouses...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}spouses."];
      }
    } //end item iterator.
  }
  if ([self child]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
    [[self child] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
    }
  }
  if ([self assertion]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "assertion", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}assertion."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}assertion...");
#endif
    [[self assertion] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}assertion...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}assertion."];
    }
  }
  if ([self contributor]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
    [[self contributor] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
    }
  }
  if ([self submitter]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "submitter", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}submitter."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}submitter...");
#endif
    [[self submitter] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}submitter...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}submitter."];
    }
  }
  if ([self disposition] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "disposition", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(writer, [self disposition]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}disposition."];
    }
  }
  if ([self primarySource] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "primarySource", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}primarySource."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}primarySource...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self primarySource]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}primarySource...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}primarySource."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}primarySource."];
    }
  }
  if ([self directEvidence] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "directEvidence", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}directEvidence."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}directEvidence...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self directEvidence]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}directEvidence...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}directEvidence."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}directEvidence."];
    }
  }
  if ([self entryDate]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "entryDate", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}entryDate."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}entryDate...");
#endif
    [[self entryDate] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}entryDate...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}entryDate."];
    }
  }
  if ([self fields]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "fields", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}fields."];
    }
    __enumerator = [[self fields] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "field", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}field."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}field...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}field...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}field."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}fields."];
    }
  }
  if ([self source]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "source", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}source."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}source...");
#endif
    [[self source] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}source...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}source."];
    }
  }
  if ([self comment]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "comment", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}comment."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}comment...");
#endif
    [[self comment] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}comment...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}comment."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Citation (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Change

/**
 * the change id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * the change id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * the change type.
 */
- (enum FSFAMILYTREEV2ChangeType *) type
{
  return _type;
}

/**
 * the change type.
 */
- (void) setType: (enum FSFAMILYTREEV2ChangeType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * the change action.
 */
- (FSFAMILYTREEV2ChangeAction *) action
{
  return _action;
}

/**
 * the change action.
 */
- (void) setAction: (FSFAMILYTREEV2ChangeAction *) newAction
{
  [newAction retain];
  [_action release];
  _action = newAction;
}

/**
 * the change parent id.
 */
- (FSFAMILYTREEV2EntityReference *) parent
{
  return _parent;
}

/**
 * the change parent id.
 */
- (void) setParent: (FSFAMILYTREEV2EntityReference *) newParent
{
  [newParent retain];
  [_parent release];
  _parent = newParent;
}

/**
 * a list of person references in a change entry.
 */
- (NSArray *) sources
{
  return _sources;
}

/**
 * a list of person references in a change entry.
 */
- (void) setSources: (NSArray *) newSources
{
  [newSources retain];
  [_sources release];
  _sources = newSources;
}

/**
 * a list of references to the resulting persons of the change.
 */
- (NSArray *) results
{
  return _results;
}

/**
 * a list of references to the resulting persons of the change.
 */
- (void) setResults: (NSArray *) newResults
{
  [newResults retain];
  [_results release];
  _results = newResults;
}

/**
 * a list of references to the previous extract persons of the change.
 */
- (NSArray *) previous
{
  return _previous;
}

/**
 * a list of references to the previous extract persons of the change.
 */
- (void) setPrevious: (NSArray *) newPrevious
{
  [newPrevious retain];
  [_previous release];
  _previous = newPrevious;
}

/**
 * a reference to the contributor of the change.
 */
- (FSFAMILYTREEV2EntityReference *) contributor
{
  return _contributor;
}

/**
 * a reference to the contributor of the change.
 */
- (void) setContributor: (FSFAMILYTREEV2EntityReference *) newContributor
{
  [newContributor retain];
  [_contributor release];
  _contributor = newContributor;
}

/**
 * a reference to the submitter of the change.
 */
- (FSFAMILYTREEV2EntityReference *) submitter
{
  return _submitter;
}

/**
 * a reference to the submitter of the change.
 */
- (void) setSubmitter: (FSFAMILYTREEV2EntityReference *) newSubmitter
{
  [newSubmitter retain];
  [_submitter release];
  _submitter = newSubmitter;
}

/**
 * the timestamp of the change.
 */
- (NSDate *) timestamp
{
  return _timestamp;
}

/**
 * the timestamp of the change.
 */
- (void) setTimestamp: (NSDate *) newTimestamp
{
  [newTimestamp retain];
  [_timestamp release];
  _timestamp = newTimestamp;
}

- (void) dealloc
{
  [self setId: nil];
  [self setType: NULL];
  [self setAction: nil];
  [self setParent: nil];
  [self setSources: nil];
  [self setResults: nil];
  [self setPrevious: nil];
  [self setContributor: nil];
  [self setSubmitter: nil];
  [self setTimestamp: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Change */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Change (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Change (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Change (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Change from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Change defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Change *_fSFAMILYTREEV2Change = [[FSFAMILYTREEV2Change alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Change initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Change dealloc];
    _fSFAMILYTREEV2Change = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Change autorelease];
  return _fSFAMILYTREEV2Change;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Change according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Change to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2ChangeTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2ChangeType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}action of type {http://api.familysearch.org/familytree/v2}changeAction.");
#endif
    __child = [FSFAMILYTREEV2ChangeAction readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}action of type {http://api.familysearch.org/familytree/v2}changeAction.");
#endif

    [self setAction: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setParent: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "sourcePersons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}sourcePersons...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}sourcePersons"
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
    && xmlStrcmp(BAD_CAST "sourcePerson", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}sourcePerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}sourcePerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self sources]) {
      [self setSources: [[self sources] arrayByAddingObject: __child]];
    }
    else {
      [self setSources: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}sourcePersons...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}sourcePersons"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setSources: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "resultPersons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}resultPersons...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}resultPersons"
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
    && xmlStrcmp(BAD_CAST "resultPerson", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}resultPerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}resultPerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self results]) {
      [self setResults: [[self results] arrayByAddingObject: __child]];
    }
    else {
      [self setResults: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}resultPersons...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}resultPersons"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setResults: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "previousPersons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}previousPersons...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}previousPersons"
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
    && xmlStrcmp(BAD_CAST "previousPerson", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}previousPerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}previousPerson of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self previous]) {
      [self setPrevious: [[self previous] arrayByAddingObject: __child]];
    }
    else {
      [self setPrevious: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}previousPersons...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}previousPersons"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPrevious: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setContributor: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "submitter", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setSubmitter: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "timestamp", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}timestamp of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif
    __child = [NSDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}timestamp of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif

    [self setTimestamp: __child];
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
  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2ChangeTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self action]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}action...");
#endif
    [[self action] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}action...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}action."];
    }
  }
  if ([self parent]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
    [[self parent] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
    }
  }
  if ([self sources]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "sourcePersons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}sourcePersons."];
    }
    __enumerator = [[self sources] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "sourcePerson", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}sourcePerson."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}sourcePerson...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}sourcePerson...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}sourcePerson."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}sourcePersons."];
    }
  }
  if ([self results]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "resultPersons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}resultPersons."];
    }
    __enumerator = [[self results] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "resultPerson", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}resultPerson."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}resultPerson...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}resultPerson...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}resultPerson."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}resultPersons."];
    }
  }
  if ([self previous]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "previousPersons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}previousPersons."];
    }
    __enumerator = [[self previous] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "previousPerson", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}previousPerson."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}previousPerson...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}previousPerson...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}previousPerson."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}previousPersons."];
    }
  }
  if ([self contributor]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
    [[self contributor] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
    }
  }
  if ([self submitter]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "submitter", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}submitter."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}submitter...");
#endif
    [[self submitter] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}submitter...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}submitter."];
    }
  }
  if ([self timestamp]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "timestamp", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}timestamp."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}timestamp...");
#endif
    [[self timestamp] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}timestamp...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}timestamp."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Change (JAXB) */

/**
 *  An assertion.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2Assertion

/**
 * the id of the assertion.
 */
- (NSString *) id
{
  return _id;
}

/**
 * the id of the assertion.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The action.
 */
- (enum FSFAMILYTREEV2AssertionAction *) action
{
  return _action;
}

/**
 * The action.
 */
- (void) setAction: (enum FSFAMILYTREEV2AssertionAction *) newAction
{
  if (_action != NULL) {
    free(_action);
  }
  _action = newAction;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * A temporary id for this person (e.g. for a person not persisted yet).
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The version for this assertion.
 */
- (NSString *) version
{
  return _version;
}

/**
 * The version for this assertion.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * Whether this is a modifiable assertion.
 */
- (BOOL *) modifiable
{
  return _modifiable;
}

/**
 * Whether this is a modifiable assertion.
 */
- (void) setModifiable: (BOOL *) newModifiable
{
  if (_modifiable != NULL) {
    free(_modifiable);
  }
  _modifiable = newModifiable;
}

/**
 * the assertion assertion.
 */
- (enum FSFAMILYTREEV2AssertionDisposition *) disposition
{
  return _disposition;
}

/**
 * the assertion assertion.
 */
- (void) setDisposition: (enum FSFAMILYTREEV2AssertionDisposition *) newDisposition
{
  if (_disposition != NULL) {
    free(_disposition);
  }
  _disposition = newDisposition;
}

/**
 * The modified timestamp for this assertion.
 */
- (NSDate *) modified
{
  return _modified;
}

/**
 * The modified timestamp for this assertion.
 */
- (void) setModified: (NSDate *) newModified
{
  [newModified retain];
  [_modified release];
  _modified = newModified;
}

/**
 * The selection information.
 */
- (FSFAMILYTREEV2ValueSelection *) selected
{
  return _selected;
}

/**
 * The selection information.
 */
- (void) setSelected: (FSFAMILYTREEV2ValueSelection *) newSelected
{
  [newSelected retain];
  [_selected release];
  _selected = newSelected;
}

/**
 * The contributors.
 */
- (NSArray *) contributors
{
  return _contributors;
}

/**
 * The contributors.
 */
- (void) setContributors: (NSArray *) newContributors
{
  [newContributors retain];
  [_contributors release];
  _contributors = newContributors;
}

/**
 * The personas.
 */
- (NSArray *) personas
{
  return _personas;
}

/**
 * The personas.
 */
- (void) setPersonas: (NSArray *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
}

/**
 * the note references.
 */
- (NSArray *) notes
{
  return _notes;
}

/**
 * the note references.
 */
- (void) setNotes: (NSArray *) newNotes
{
  [newNotes retain];
  [_notes release];
  _notes = newNotes;
}

/**
 * the citation references.
 */
- (NSArray *) citations
{
  return _citations;
}

/**
 * the citation references.
 */
- (void) setCitations: (NSArray *) newCitations
{
  [newCitations retain];
  [_citations release];
  _citations = newCitations;
}

- (void) dealloc
{
  [self setId: nil];
  [self setAction: NULL];
  [self setTempId: nil];
  [self setVersion: nil];
  [self setModifiable: NULL];
  [self setDisposition: NULL];
  [self setModified: nil];
  [self setSelected: nil];
  [self setContributors: nil];
  [self setPersonas: nil];
  [self setNotes: nil];
  [self setCitations: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Assertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Assertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Assertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Assertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Assertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Assertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Assertion *_fSFAMILYTREEV2Assertion = [[FSFAMILYTREEV2Assertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Assertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Assertion dealloc];
    _fSFAMILYTREEV2Assertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Assertion autorelease];
  return _fSFAMILYTREEV2Assertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Assertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Assertion to the writer.
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

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}action."];
    }
    [self setAction: ((enum FSFAMILYTREEV2AssertionAction*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "tempId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}tempId...");
#endif
    [self setTempId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}tempId...");
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
    && xmlStrcmp(BAD_CAST "version", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}version of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}version of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setVersion: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "modifiable", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setModifiable: ((BOOL*) _child_accessor)];
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "disposition", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDisposition: ((enum FSFAMILYTREEV2AssertionDisposition*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "modified", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif
    __child = [NSDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}modified of type {http://www.w3.org/2001/XMLSchema}dateTime.");
#endif

    [self setModified: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "selected", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}selected of type {http://api.familysearch.org/familytree/v2}valueSelection.");
#endif
    __child = [FSFAMILYTREEV2ValueSelection readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}selected of type {http://api.familysearch.org/familytree/v2}valueSelection.");
#endif

    [self setSelected: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributors", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
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
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributorReference.");
#endif

    __child = [FSFAMILYTREEV2ContributorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributorReference.");
#endif

    if ([self contributors]) {
      [self setContributors: [[self contributors] arrayByAddingObject: __child]];
    }
    else {
      [self setContributors: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setContributors: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "personas", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}personas"
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
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personaReference.");
#endif

    __child = [FSFAMILYTREEV2PersonaReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}personaReference.");
#endif

    if ([self personas]) {
      [self setPersonas: [[self personas] arrayByAddingObject: __child]];
    }
    else {
      [self setPersonas: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}personas"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPersonas: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "notes", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}notes of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}notes of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self notes]) {
      [self setNotes: [[self notes] arrayByAddingObject: __child]];
    }
    else {
      [self setNotes: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "citations", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}citations of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}citations of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    if ([self citations]) {
      [self setCitations: [[self citations] arrayByAddingObject: __child]];
    }
    else {
      [self setCitations: [NSArray arrayWithObject: __child]];
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
  if ([self action] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(writer, [self action]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}action."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
    }
  }
  if ([self tempId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "tempId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}tempId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}tempId...");
#endif
    [[self tempId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}tempId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}tempId."];
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

  if ([self version]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "version", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}version."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}version...");
#endif
    [[self version] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}version...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}version."];
    }
  }
  if ([self modifiable] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "modifiable", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}modifiable...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self modifiable]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}modifiable...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}modifiable."];
    }
  }
  if ([self disposition] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "disposition", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(writer, [self disposition]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}disposition."];
    }
  }
  if ([self modified]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "modified", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}modified."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}modified...");
#endif
    [[self modified] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}modified...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}modified."];
    }
  }
  if ([self selected]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "selected", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}selected."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}selected...");
#endif
    [[self selected] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}selected...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}selected."];
    }
  }
  if ([self contributors]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributors", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
    __enumerator = [[self contributors] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
  }
  if ([self personas]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "personas", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
    __enumerator = [[self personas] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persona", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}persona."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}persona...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}persona...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}persona."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
  }
  if ([self notes]) {
    __enumerator = [[self notes] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "notes", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}notes."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}notes...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}notes...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}notes."];
      }
    } //end item iterator.
  }
  if ([self citations]) {
    __enumerator = [[self citations] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "citations", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}citations."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}citations...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}citations...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}citations."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2Assertion (JAXB) */

/**
 * Reads a ChangeActionType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ChangeActionType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2ChangeActionType *xmlTextReaderReadFSFAMILYTREEV2ChangeActionTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2ChangeActionType *value = calloc(1, sizeof(enum FSFAMILYTREEV2ChangeActionType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Absolute Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_ABSOLUTE_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "CMIS ODM Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_CMIS_ODM_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Exact Match Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_EXACT_MATCH_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "GFE Giant Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_GFE_GIANT_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Manual Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_MANUAL_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Recursive Family Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_RECURSIVE_FAMILY_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Subset Match Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_SUBSET_MATCH_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Manual Separate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_MANUAL_SEPARATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "GEDCOM Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_GEDCOM_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Zip Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_ZIP_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "IMS Auto Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_IMS_AUTO_COMBINE;
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
 * Writes a ChangeActionType to XML.
 *
 * @param writer The XML writer.
 * @param _changeActionType The ChangeActionType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2ChangeActionTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2ChangeActionType *_changeActionType)
{
  switch (*_changeActionType) {
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_ABSOLUTE_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Absolute Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_CMIS_ODM_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "CMIS ODM Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_EXACT_MATCH_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Exact Match Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_GFE_GIANT_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "GFE Giant Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_MANUAL_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Manual Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_RECURSIVE_FAMILY_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Recursive Family Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_SUBSET_MATCH_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Subset Match Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_MANUAL_SEPARATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Manual Separate");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_GEDCOM_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "GEDCOM Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_ZIP_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Zip Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGEACTIONTYPE_IMS_AUTO_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "IMS Auto Combine");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a CitationFieldType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The CitationFieldType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2CitationFieldType *xmlTextReaderReadFSFAMILYTREEV2CitationFieldTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2CitationFieldType *value = calloc(1, sizeof(enum FSFAMILYTREEV2CitationFieldType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Actual Text") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_ACTUAL_TEXT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Batch Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BATCH_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Batch Type") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BATCH_TYPE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Book Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BOOK_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Call Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_CALL_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Description") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_DESCRIPTION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Event Date") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_DATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Event Role") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_ROLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Event Type") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_TYPE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Frame Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_FRAME_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Image Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_IMAGE_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Link") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LINK;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "LDS Temple Record Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LDS_TEMPLE_RECORD_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Location in Source") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LOCATION_IN_SOURCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Page Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_PAGE_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Record Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_RECORD_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Reference Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_REFERENCE_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Serial Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_SERIAL_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Sheet Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_SHEET_NUMBER;
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
 * Writes a CitationFieldType to XML.
 *
 * @param writer The XML writer.
 * @param _citationFieldType The CitationFieldType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2CitationFieldTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2CitationFieldType *_citationFieldType)
{
  switch (*_citationFieldType) {
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_ACTUAL_TEXT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Actual Text");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BATCH_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Batch Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BATCH_TYPE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Batch Type");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_BOOK_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Book Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_CALL_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Call Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_DESCRIPTION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Description");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_DATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Event Date");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_ROLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Event Role");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_EVENT_TYPE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Event Type");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_FRAME_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Frame Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_IMAGE_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Image Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LINK:
      return xmlTextWriterWriteString(writer, BAD_CAST "Link");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LDS_TEMPLE_RECORD_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "LDS Temple Record Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_LOCATION_IN_SOURCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Location in Source");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_PAGE_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Page Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_RECORD_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Record Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_REFERENCE_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Reference Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_SERIAL_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Serial Number");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONFIELDTYPE_SHEET_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Sheet Number");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a EventType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The EventType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2EventType *xmlTextReaderReadFSFAMILYTREEV2EventTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2EventType *value = calloc(1, sizeof(enum FSFAMILYTREEV2EventType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Adoption") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ADOPTION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Adult Christening") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ADULT_CHRISTENING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Baptism") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAPTISM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Confirmation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CONFIRMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Bar Mitzvah") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAR_MITZVAH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Bas Mitzvah") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAS_MITZVAH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Birth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BIRTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Blessing") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BLESSING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Burial") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BURIAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Christening") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CHRISTENING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cremation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CREMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Death") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DEATH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Graduation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_GRADUATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Immigration") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_IMMIGRATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Military Service") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MILITARY_SERVICE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Mission") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MISSION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Move") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MOVE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Naturalization") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_NATURALIZATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Probate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_PROBATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Retirement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_RETIREMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Will") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_WILL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Annulment") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ANNULMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Divorce") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DIVORCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Divorce Filing") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DIVORCE_FILING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Engagement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ENGAGEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Banns") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_BANNS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Contract") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_CONTRACT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage License") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_LICENSE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_OTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Census") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CENSUS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Circumcision") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CIRCUMCISION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Emigration") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_EMIGRATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Excommunication") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_EXCOMMUNICATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "First Communion") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FIRST_COMMUNION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "First Known Child") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FIRST_KNOWN_CHILD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Funeral") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FUNERAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Hospitalization") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_HOSPITALIZATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Illness") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ILLNESS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Naming") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_NAMING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Settlement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_SETTLEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Miscarriage") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MISCARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ordination") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ORDINATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Separation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_SEPARATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Time Only Marriage") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_TIME_ONLY_MARRIAGE;
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
 * Writes a EventType to XML.
 *
 * @param writer The XML writer.
 * @param _eventType The EventType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2EventTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2EventType *_eventType)
{
  switch (*_eventType) {
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ADOPTION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adoption");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ADULT_CHRISTENING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adult Christening");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAPTISM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Baptism");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CONFIRMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Confirmation");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAR_MITZVAH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Bar Mitzvah");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BAS_MITZVAH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Bas Mitzvah");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BIRTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Birth");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BLESSING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Blessing");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_BURIAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Burial");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CHRISTENING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Christening");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CREMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cremation");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DEATH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Death");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_GRADUATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Graduation");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_IMMIGRATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Immigration");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MILITARY_SERVICE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Military Service");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MISSION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Mission");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MOVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Move");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_NATURALIZATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Naturalization");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_PROBATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Probate");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_RETIREMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Retirement");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_WILL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Will");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ANNULMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Annulment");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DIVORCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Divorce");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_DIVORCE_FILING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Divorce Filing");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ENGAGEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Engagement");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_BANNS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Banns");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_CONTRACT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Contract");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_LICENSE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage License");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CENSUS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Census");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_CIRCUMCISION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Circumcision");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_EMIGRATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Emigration");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_EXCOMMUNICATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Excommunication");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FIRST_COMMUNION:
      return xmlTextWriterWriteString(writer, BAD_CAST "First Communion");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FIRST_KNOWN_CHILD:
      return xmlTextWriterWriteString(writer, BAD_CAST "First Known Child");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_FUNERAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Funeral");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_HOSPITALIZATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Hospitalization");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ILLNESS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Illness");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_NAMING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Naming");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MARRIAGE_SETTLEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Settlement");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_MISCARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Miscarriage");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_ORDINATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ordination");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_SEPARATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Separation");
    case FAMILYTREE_FAMILYTREE_V2_EVENTTYPE_TIME_ONLY_MARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Time Only Marriage");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a SourceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The SourceType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2SourceType *xmlTextReaderReadFSFAMILYTREEV2SourceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2SourceType *value = calloc(1, sizeof(enum FSFAMILYTREEV2SourceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Church Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_CHURCH_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Company Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_COMPANY_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family Possession") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_FAMILY_POSSESSION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Government Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_GOVERNMENT_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memory of Someone") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_MEMORY_OF_SOMEONE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Published Information") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_PUBLISHED_INFORMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "School Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_SCHOOL_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_OTHER;
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
 * Writes a SourceType to XML.
 *
 * @param writer The XML writer.
 * @param _sourceType The SourceType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2SourceTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2SourceType *_sourceType)
{
  switch (*_sourceType) {
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_CHURCH_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Church Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_COMPANY_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Company Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_FAMILY_POSSESSION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family Possession");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_GOVERNMENT_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Government Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_MEMORY_OF_SOMEONE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memory of Someone");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_PUBLISHED_INFORMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Published Information");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_SCHOOL_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "School Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a UserPreferenceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The UserPreferenceType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2UserPreferenceType *xmlTextReaderReadFSFAMILYTREEV2UserPreferenceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2UserPreferenceType *value = calloc(1, sizeof(enum FSFAMILYTREEV2UserPreferenceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Display Contact Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYCONTACTNAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Display Full Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYFULLNAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Display Phone") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYPHONE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Display Email") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYEMAIL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Display Address") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYPOSTALADDRESS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Preferred Locale") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_PREFERREDLOCALE;
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
 * Writes a UserPreferenceType to XML.
 *
 * @param writer The XML writer.
 * @param _userPreferenceType The UserPreferenceType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2UserPreferenceTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2UserPreferenceType *_userPreferenceType)
{
  switch (*_userPreferenceType) {
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYCONTACTNAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Display Contact Name");
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYFULLNAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Display Full Name");
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYPHONE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Display Phone");
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYEMAIL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Display Email");
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_DISPLAYPOSTALADDRESS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Display Address");
    case FAMILYTREE_FAMILYTREE_V2_USERPREFERENCETYPE_PREFERREDLOCALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Preferred Locale");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a UserPermission from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The UserPermission, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2UserPermission *xmlTextReaderReadFSFAMILYTREEV2UserPermissionType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2UserPermission *value = calloc(1, sizeof(enum FSFAMILYTREEV2UserPermission));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Read") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPERMISSION_READ;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Write") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_USERPERMISSION_WRITE;
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
 * Writes a UserPermission to XML.
 *
 * @param writer The XML writer.
 * @param _userPermission The UserPermission to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2UserPermissionType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2UserPermission *_userPermission)
{
  switch (*_userPermission) {
    case FAMILYTREE_FAMILYTREE_V2_USERPERMISSION_READ:
      return xmlTextWriterWriteString(writer, BAD_CAST "Read");
    case FAMILYTREE_FAMILYTREE_V2_USERPERMISSION_WRITE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Write");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A user of the new FamilySearch.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2User

/**
 * The preferred name of the user.
 */
- (NSString *) preferredName
{
  return _preferredName;
}

/**
 * The preferred name of the user.
 */
- (void) setPreferredName: (NSString *) newPreferredName
{
  [newPreferredName retain];
  [_preferredName release];
  _preferredName = newPreferredName;
}

/**
 * The helper access number.
 */
- (NSString *) accessNumber
{
  return _accessNumber;
}

/**
 * The helper access number.
 */
- (void) setAccessNumber: (NSString *) newAccessNumber
{
  [newAccessNumber retain];
  [_accessNumber release];
  _accessNumber = newAccessNumber;
}

/**
 * The user's permissions.
 */
- (NSArray *) permissions
{
  return _permissions;
}

/**
 * The user's permissions.
 */
- (void) setPermissions: (NSArray *) newPermissions
{
  [newPermissions retain];
  [_permissions release];
  _permissions = newPermissions;
}

/**
 * The current proxy for the user.
 */
- (FSFAMILYTREEV2Proxy *) proxy
{
  return _proxy;
}

/**
 * The current proxy for the user.
 */
- (void) setProxy: (FSFAMILYTREEV2Proxy *) newProxy
{
  [newProxy retain];
  [_proxy release];
  _proxy = newProxy;
}

/**
 * the user preferences.
 */
- (NSArray *) preferences
{
  return _preferences;
}

/**
 * the user preferences.
 */
- (void) setPreferences: (NSArray *) newPreferences
{
  [newPreferences retain];
  [_preferences release];
  _preferences = newPreferences;
}

/**
 * Not used.
 */
- (NSArray *) roles
{
  return _roles;
}

/**
 * Not used.
 */
- (void) setRoles: (NSArray *) newRoles
{
  [newRoles retain];
  [_roles release];
  _roles = newRoles;
}

- (void) dealloc
{
  [self setPreferredName: nil];
  [self setAccessNumber: nil];
  [self setPermissions: nil];
  [self setProxy: nil];
  [self setPreferences: nil];
  [self setRoles: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2User */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2User (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2User (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2User (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2User from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2User defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2User *_fSFAMILYTREEV2User = [[FSFAMILYTREEV2User alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2User initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2User dealloc];
    _fSFAMILYTREEV2User = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2User autorelease];
  return _fSFAMILYTREEV2User;
}

/**
 * Initialize this instance of FSFAMILYTREEV2User according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2User to the writer.
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
    && xmlStrcmp(BAD_CAST "preferredName", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}preferredName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}preferredName of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPreferredName: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "accessNumber", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}accessNumber of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}accessNumber of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAccessNumber: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "permissions", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}permissions...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}permissions"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}permission of type {http://api.familysearch.org/familytree/v2}userPermission.");
#endif

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2UserPermissionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    __child = [NSValue value: _child_accessor withObjCType: @encode(enum FSFAMILYTREEV2UserPermission)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}permission of type {http://api.familysearch.org/familytree/v2}userPermission.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}permissions...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}permissions"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPermissions: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "proxy", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}proxy of type {http://api.familysearch.org/familytree/v2}proxy.");
#endif
    __child = [FSFAMILYTREEV2Proxy readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}proxy of type {http://api.familysearch.org/familytree/v2}proxy.");
#endif

    [self setProxy: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "preferences", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}preferences...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}preferences"
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
    && xmlStrcmp(BAD_CAST "preference", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}preference of type {http://api.familysearch.org/familytree/v2}userPreference.");
#endif

    __child = [FSFAMILYTREEV2UserPreference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}preference of type {http://api.familysearch.org/familytree/v2}userPreference.");
#endif

    if ([self preferences]) {
      [self setPreferences: [[self preferences] arrayByAddingObject: __child]];
    }
    else {
      [self setPreferences: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}preferences...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}preferences"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPreferences: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "roles", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}roles...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}roles"
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
    && xmlStrcmp(BAD_CAST "role", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}role of type {http://api.familysearch.org/familytree/v2}proxyRole.");
#endif

    __child = [FSFAMILYTREEV2ProxyRole readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}role of type {http://api.familysearch.org/familytree/v2}proxyRole.");
#endif

    if ([self roles]) {
      [self setRoles: [[self roles] arrayByAddingObject: __child]];
    }
    else {
      [self setRoles: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}roles...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}roles"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setRoles: (NSArray*) __child];
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

  if ([self preferredName]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "preferredName", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}preferredName."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}preferredName...");
#endif
    [[self preferredName] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}preferredName...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}preferredName."];
    }
  }
  if ([self accessNumber]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "accessNumber", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}accessNumber."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}accessNumber...");
#endif
    [[self accessNumber] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}accessNumber...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}accessNumber."];
    }
  }
  if ([self permissions]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "permissions", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}permissions."];
    }
    __enumerator = [[self permissions] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "permission", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}permission."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}permission...");
#endif
      status = xmlTextWriterWriteFSFAMILYTREEV2UserPermissionType(writer, ((enum FSFAMILYTREEV2UserPermission*) [((NSValue *)__item) pointerValue]));
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing child element {http://api.familysearch.org/familytree/v2}permission."];
      }
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}permission...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}permission."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}permissions."];
    }
  }
  if ([self proxy]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "proxy", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}proxy."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}proxy...");
#endif
    [[self proxy] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}proxy...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}proxy."];
    }
  }
  if ([self preferences]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "preferences", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}preferences."];
    }
    __enumerator = [[self preferences] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "preference", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}preference."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}preference...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}preference...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}preference."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}preferences."];
    }
  }
  if ([self roles]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "roles", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}roles."];
    }
    __enumerator = [[self roles] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "role", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}role."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}role...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}role...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}role."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}roles."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2User (JAXB) */

/**
 * Reads a SourceFieldType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The SourceFieldType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2SourceFieldType *xmlTextReaderReadFSFAMILYTREEV2SourceFieldTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2SourceFieldType *value = calloc(1, sizeof(enum FSFAMILYTREEV2SourceFieldType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Abbreviation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_ABBREVIATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Actual Text") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_ACTUAL_TEXT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Agency") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_AGENCY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Author") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_AUTHOR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Batch Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_BATCH_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Call Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_CALL_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Film Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_FILM_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Language") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LANGUAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Link") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LINK;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Locality") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LOCALITY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Place") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Provider") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PROVIDER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Publication Information") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PUBLICATION_INFORMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Reference Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_REFERENCE_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Template") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TEMPLATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Template Type") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TEMPLATE_TYPE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Time Period") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TIME_PERIOD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Title") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TITLE;
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
 * Writes a SourceFieldType to XML.
 *
 * @param writer The XML writer.
 * @param _sourceFieldType The SourceFieldType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2SourceFieldTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2SourceFieldType *_sourceFieldType)
{
  switch (*_sourceFieldType) {
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_ABBREVIATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Abbreviation");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_ACTUAL_TEXT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Actual Text");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_AGENCY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Agency");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_AUTHOR:
      return xmlTextWriterWriteString(writer, BAD_CAST "Author");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_BATCH_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Batch Number");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_CALL_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Call Number");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_FILM_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Film Number");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LANGUAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Language");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LINK:
      return xmlTextWriterWriteString(writer, BAD_CAST "Link");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_LOCALITY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Locality");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Place");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PROVIDER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Provider");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_PUBLICATION_INFORMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Publication Information");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_REFERENCE_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Reference Number");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TEMPLATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Template");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TEMPLATE_TYPE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Template Type");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TIME_PERIOD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Time Period");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEFIELDTYPE_TITLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Title");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a SourceDetail from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The SourceDetail, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2SourceDetail *xmlTextReaderReadFSFAMILYTREEV2SourceDetailType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2SourceDetail *value = calloc(1, sizeof(enum FSFAMILYTREEV2SourceDetail));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Adoption Papers") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ADOPTION_PAPERS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Anniversary Announcement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ANNIVERSARY_ANNOUNCEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Baptism Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BAPTISM_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Birth Announcement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BIRTH_ANNOUNCEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Birth Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BIRTH_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Blessing Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BLESSING_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Burial Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BURIAL_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cemetery Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CEMETERY_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Census Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CENSUS_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Christening Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CHRISTENING_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Citizenship Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CITIZENSHIP_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Court Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_COURT_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Death Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DEATH_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Diploma") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DIPLOMA;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Divorce Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DIVORCE_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family Bible") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FAMILY_BIBLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family Genealogies") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FAMILY_GENEALOGIES;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memory of Friend") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_FRIEND;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Funeral Program") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FUNERAL_PROGRAM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Handwritten Information") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_HANDWRITTEN_INFORMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Honor Roll") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_HONOR_ROLL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Insurance Policy") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_INSURANCE_POLICY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Journal") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_JOURNAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Land Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_LAND_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Letter") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_LETTER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MARRIAGE_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Medical Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEDICAL_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Military Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MILITARY_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Mortgage Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MORTGAGE_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "My Memory") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MY_MEMORY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Newspaper Article") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_NEWSPAPER_ARTICLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Obituary") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_OBITUARY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ordination Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ORDINATION_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memory of Parent") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_PARENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Passenger Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PASSENGER_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Photographs") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PHOTOGRAPHS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Probate Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PROBATE_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memory of Relative") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_RELATIVE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memory of Sibling") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_SIBLING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Report Card") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_REPORT_CARD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Social Security Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_SOCIAL_SECURITY_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Society Membership") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_SOCIETY_MEMBERSHIP;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Tax Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_TAX_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Transcript") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_TRANSCRIPT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Voting Record") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_VOTING_RECORD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Wedding Announcement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_WEDDING_ANNOUNCEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Yearbook") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_YEARBOOK;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unknown") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_UNKNOWN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_OTHER;
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
 * Writes a SourceDetail to XML.
 *
 * @param writer The XML writer.
 * @param _sourceDetail The SourceDetail to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2SourceDetailType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2SourceDetail *_sourceDetail)
{
  switch (*_sourceDetail) {
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ADOPTION_PAPERS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adoption Papers");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ANNIVERSARY_ANNOUNCEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Anniversary Announcement");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BAPTISM_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Baptism Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BIRTH_ANNOUNCEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Birth Announcement");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BIRTH_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Birth Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BLESSING_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Blessing Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_BURIAL_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Burial Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CEMETERY_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cemetery Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CENSUS_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Census Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CHRISTENING_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Christening Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_CITIZENSHIP_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Citizenship Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_COURT_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Court Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DEATH_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Death Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DIPLOMA:
      return xmlTextWriterWriteString(writer, BAD_CAST "Diploma");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_DIVORCE_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Divorce Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FAMILY_BIBLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family Bible");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FAMILY_GENEALOGIES:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family Genealogies");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_FRIEND:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memory of Friend");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_FUNERAL_PROGRAM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Funeral Program");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_HANDWRITTEN_INFORMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Handwritten Information");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_HONOR_ROLL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Honor Roll");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_INSURANCE_POLICY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Insurance Policy");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_JOURNAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Journal");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_LAND_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Land Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_LETTER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Letter");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MARRIAGE_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEDICAL_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Medical Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MILITARY_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Military Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MORTGAGE_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Mortgage Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MY_MEMORY:
      return xmlTextWriterWriteString(writer, BAD_CAST "My Memory");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_NEWSPAPER_ARTICLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Newspaper Article");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_OBITUARY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Obituary");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_ORDINATION_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ordination Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_PARENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memory of Parent");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PASSENGER_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Passenger Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PHOTOGRAPHS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Photographs");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_PROBATE_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Probate Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_RELATIVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memory of Relative");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_MEMORY_OF_SIBLING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memory of Sibling");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_REPORT_CARD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Report Card");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_SOCIAL_SECURITY_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Social Security Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_SOCIETY_MEMBERSHIP:
      return xmlTextWriterWriteString(writer, BAD_CAST "Society Membership");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_TAX_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Tax Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_TRANSCRIPT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Transcript");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_VOTING_RECORD:
      return xmlTextWriterWriteString(writer, BAD_CAST "Voting Record");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_WEDDING_ANNOUNCEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Wedding Announcement");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_YEARBOOK:
      return xmlTextWriterWriteString(writer, BAD_CAST "Yearbook");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_UNKNOWN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unknown");
    case FAMILYTREE_FAMILYTREE_V2_SOURCEDETAIL_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a SearchMatchParameterField from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The SearchMatchParameterField, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2SearchMatchParameterField *xmlTextReaderReadFSFAMILYTREEV2SearchMatchParameterFieldType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2SearchMatchParameterField *value = calloc(1, sizeof(enum FSFAMILYTREEV2SearchMatchParameterField));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "id") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_ID;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "gender") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_GENDER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "givenName") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_GIVENNAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "familyName") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_FAMILYNAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "nameSuffix") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_NAMESUFFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "birthDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "christeningDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "deathDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "burialDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "marriageDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "residenceDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "immigrationDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "emigrationDate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONDATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "birthPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "christeningPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "deathPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "burialPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "marriagePlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "residencePlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "immigrationPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "emigrationPlace") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONPLACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "birthYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "christeningYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "deathYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "burialYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "marriageYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "residenceYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "immigrationYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "emigrationYear") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONYEAR;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "birthMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "christeningMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "deathMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "burialMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "marriageMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "residenceMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "immigrationMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "emigrationMonth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONMONTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "birthDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "christeningDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "deathDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "burialDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "marriageDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "residenceDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "immigrationDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONDAY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "emigrationDay") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONDAY;
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
 * Writes a SearchMatchParameterField to XML.
 *
 * @param writer The XML writer.
 * @param _searchMatchParameterField The SearchMatchParameterField to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2SearchMatchParameterFieldType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2SearchMatchParameterField *_searchMatchParameterField)
{
  switch (*_searchMatchParameterField) {
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_ID:
      return xmlTextWriterWriteString(writer, BAD_CAST "id");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_GENDER:
      return xmlTextWriterWriteString(writer, BAD_CAST "gender");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "name");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_GIVENNAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "givenName");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_FAMILYNAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "familyName");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_NAMESUFFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "nameSuffix");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "birthDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "christeningDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "deathDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "burialDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "marriageDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "residenceDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "immigrationDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONDATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "emigrationDate");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "birthPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "christeningPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "deathPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "burialPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "marriagePlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "residencePlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "immigrationPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONPLACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "emigrationPlace");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "birthYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "christeningYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "deathYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "burialYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "marriageYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "residenceYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "immigrationYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONYEAR:
      return xmlTextWriterWriteString(writer, BAD_CAST "emigrationYear");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "birthMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "christeningMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "deathMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "burialMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "marriageMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "residenceMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "immigrationMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONMONTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "emigrationMonth");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BIRTHDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "birthDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_CHRISTENINGDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "christeningDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_DEATHDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "deathDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_BURIALDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "burialDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_MARRIAGEDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "marriageDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_RESIDENCEDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "residenceDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_IMMIGRATIONDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "immigrationDay");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERFIELD_EMIGRATIONDAY:
      return xmlTextWriterWriteString(writer, BAD_CAST "emigrationDay");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A person used for displaying seach results.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2SearchPerson

/**
 * The minimum birth year for this person.
 */
- (NSString *) minBirthYear
{
  return _minBirthYear;
}

/**
 * The minimum birth year for this person.
 */
- (void) setMinBirthYear: (NSString *) newMinBirthYear
{
  [newMinBirthYear retain];
  [_minBirthYear release];
  _minBirthYear = newMinBirthYear;
}

/**
 * The maximum death year for this person.
 */
- (NSString *) maxDeathYear
{
  return _maxDeathYear;
}

/**
 * The maximum death year for this person.
 */
- (void) setMaxDeathYear: (NSString *) newMaxDeathYear
{
  [newMaxDeathYear retain];
  [_maxDeathYear release];
  _maxDeathYear = newMaxDeathYear;
}

- (void) dealloc
{
  [self setMinBirthYear: nil];
  [self setMaxDeathYear: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2SearchPerson */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2SearchPerson (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2SearchPerson (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2SearchPerson (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2SearchPerson from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2SearchPerson defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2SearchPerson *_fSFAMILYTREEV2SearchPerson = [[FSFAMILYTREEV2SearchPerson alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2SearchPerson initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2SearchPerson dealloc];
    _fSFAMILYTREEV2SearchPerson = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2SearchPerson autorelease];
  return _fSFAMILYTREEV2SearchPerson;
}

/**
 * Initialize this instance of FSFAMILYTREEV2SearchPerson according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2SearchPerson to the writer.
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
    && xmlStrcmp(BAD_CAST "minBirthYear", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}minBirthYear of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}minBirthYear of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setMinBirthYear: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "maxDeathYear", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}maxDeathYear of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}maxDeathYear of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setMaxDeathYear: __child];
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

  if ([self minBirthYear]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "minBirthYear", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}minBirthYear."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}minBirthYear...");
#endif
    [[self minBirthYear] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}minBirthYear...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}minBirthYear."];
    }
  }
  if ([self maxDeathYear]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "maxDeathYear", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}maxDeathYear."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}maxDeathYear...");
#endif
    [[self maxDeathYear] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}maxDeathYear...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}maxDeathYear."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2SearchPerson (JAXB) */

/**
 * Reads a SearchMatchParameterRelationship from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The SearchMatchParameterRelationship, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2SearchMatchParameterRelationship *xmlTextReaderReadFSFAMILYTREEV2SearchMatchParameterRelationshipType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2SearchMatchParameterRelationship *value = calloc(1, sizeof(enum FSFAMILYTREEV2SearchMatchParameterRelationship));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "self") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_SELF;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "father") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_FATHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "mother") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_MOTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "spouse") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_SPOUSE;
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
 * Writes a SearchMatchParameterRelationship to XML.
 *
 * @param writer The XML writer.
 * @param _searchMatchParameterRelationship The SearchMatchParameterRelationship to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2SearchMatchParameterRelationshipType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2SearchMatchParameterRelationship *_searchMatchParameterRelationship)
{
  switch (*_searchMatchParameterRelationship) {
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_SELF:
      return xmlTextWriterWriteString(writer, BAD_CAST "self");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_FATHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "father");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_MOTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "mother");
    case FAMILYTREE_FAMILYTREE_V2_SEARCHMATCHPARAMETERRELATIONSHIP_SPOUSE:
      return xmlTextWriterWriteString(writer, BAD_CAST "spouse");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a RepositoryType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The RepositoryType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2RepositoryType *xmlTextReaderReadFSFAMILYTREEV2RepositoryTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2RepositoryType *value = calloc(1, sizeof(enum FSFAMILYTREEV2RepositoryType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Archive") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_ARCHIVE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Church") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_CHURCH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Individual") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_INDIVIDUAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Government") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_GOVERNMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Library") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_LIBRARY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Newspaper") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_NEWSPAPER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "School") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_SCHOOL;
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
 * Writes a RepositoryType to XML.
 *
 * @param writer The XML writer.
 * @param _repositoryType The RepositoryType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2RepositoryTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2RepositoryType *_repositoryType)
{
  switch (*_repositoryType) {
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_ARCHIVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Archive");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_CHURCH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Church");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_INDIVIDUAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Individual");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_GOVERNMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Government");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_LIBRARY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Library");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_NEWSPAPER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Newspaper");
    case FAMILYTREE_FAMILYTREE_V2_REPOSITORYTYPE_SCHOOL:
      return xmlTextWriterWriteString(writer, BAD_CAST "School");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  The existence of a person or relationship.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ExistsAssertion

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2ExistsValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2ExistsValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ExistsAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ExistsAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ExistsAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ExistsAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ExistsAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ExistsAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ExistsAssertion *_fSFAMILYTREEV2ExistsAssertion = [[FSFAMILYTREEV2ExistsAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ExistsAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ExistsAssertion dealloc];
    _fSFAMILYTREEV2ExistsAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ExistsAssertion autorelease];
  return _fSFAMILYTREEV2ExistsAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ExistsAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ExistsAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}existsValue.");
#endif
    __child = [FSFAMILYTREEV2ExistsValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}existsValue.");
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

  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2ExistsAssertion (JAXB) */

/**
 *  An exists value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ExistsValue

- (void) dealloc
{
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ExistsValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ExistsValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ExistsValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ExistsValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ExistsValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ExistsValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ExistsValue *_fSFAMILYTREEV2ExistsValue = [[FSFAMILYTREEV2ExistsValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ExistsValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ExistsValue dealloc];
    _fSFAMILYTREEV2ExistsValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ExistsValue autorelease];
  return _fSFAMILYTREEV2ExistsValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ExistsValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ExistsValue to the writer.
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

}
@end /* implementation FSFAMILYTREEV2ExistsValue (JAXB) */

/**
 * Reads a GenderType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The GenderType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2GenderType *xmlTextReaderReadFSFAMILYTREEV2GenderTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2GenderType *value = calloc(1, sizeof(enum FSFAMILYTREEV2GenderType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Male") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_MALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Female") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_FEMALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unknown") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_UNKNOWN;
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
 * Writes a GenderType to XML.
 *
 * @param writer The XML writer.
 * @param _genderType The GenderType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2GenderTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2GenderType *_genderType)
{
  switch (*_genderType) {
    case FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_MALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Male");
    case FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_FEMALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Female");
    case FAMILYTREE_FAMILYTREE_V2_GENDERTYPE_UNKNOWN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unknown");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a LineageType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The LineageType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2LineageType *xmlTextReaderReadFSFAMILYTREEV2LineageTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2LineageType *value = calloc(1, sizeof(enum FSFAMILYTREEV2LineageType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Biological") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_BIOLOGICAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Adoptive") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_ADOPTIVE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Foster") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_FOSTER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Guardianship") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_GUARDIANSHIP;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Step") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_STEP;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_OTHER;
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
 * Writes a LineageType to XML.
 *
 * @param writer The XML writer.
 * @param _lineageType The LineageType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2LineageTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2LineageType *_lineageType)
{
  switch (*_lineageType) {
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_BIOLOGICAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Biological");
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_ADOPTIVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adoptive");
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_FOSTER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Foster");
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_GUARDIANSHIP:
      return xmlTextWriterWriteString(writer, BAD_CAST "Guardianship");
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_STEP:
      return xmlTextWriterWriteString(writer, BAD_CAST "Step");
    case FAMILYTREE_FAMILYTREE_V2_LINEAGETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A Family Tree persona reference.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonaReference

/**
 * (no documentation provided)
 */
- (enum FSFAMILYTREEV2AssertionDisposition *) disposition
{
  return _disposition;
}

/**
 * (no documentation provided)
 */
- (void) setDisposition: (enum FSFAMILYTREEV2AssertionDisposition *) newDisposition
{
  if (_disposition != NULL) {
    free(_disposition);
  }
  _disposition = newDisposition;
}

/**
 * (no documentation provided)
 */
- (NSArray *) spouses
{
  return _spouses;
}

/**
 * (no documentation provided)
 */
- (void) setSpouses: (NSArray *) newSpouses
{
  [newSpouses retain];
  [_spouses release];
  _spouses = newSpouses;
}

/**
 * (no documentation provided)
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * (no documentation provided)
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * (no documentation provided)
 */
- (FSFAMILYTREEV2PersonReference *) child
{
  return _child;
}

/**
 * (no documentation provided)
 */
- (void) setChild: (FSFAMILYTREEV2PersonReference *) newChild
{
  [newChild retain];
  [_child release];
  _child = newChild;
}

- (void) dealloc
{
  [self setDisposition: NULL];
  [self setSpouses: nil];
  [self setParents: nil];
  [self setChild: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonaReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonaReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonaReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonaReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonaReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonaReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonaReference *_fSFAMILYTREEV2PersonaReference = [[FSFAMILYTREEV2PersonaReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonaReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonaReference dealloc];
    _fSFAMILYTREEV2PersonaReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonaReference autorelease];
  return _fSFAMILYTREEV2PersonaReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonaReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonaReference to the writer.
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
    && xmlStrcmp(BAD_CAST "disposition", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDisposition: ((enum FSFAMILYTREEV2AssertionDisposition*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}spouse of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self spouses]) {
      [self setSpouses: [[self spouses] arrayByAddingObject: __child]];
    }
    else {
      [self setSpouses: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parent of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif
    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}child of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    [self setChild: __child];
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

  if ([self disposition] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "disposition", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(writer, [self disposition]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}disposition."];
    }
  }
  if ([self spouses]) {
    __enumerator = [[self spouses] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "spouse", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}spouse."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}spouse...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}spouse...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}spouse."];
      }
    } //end item iterator.
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parent."];
      }
    } //end item iterator.
  }
  if ([self child]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "child", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}child."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}child...");
#endif
    [[self child] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}child...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}child."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2PersonaReference (JAXB) */

/**
 *  A Family Tree person reference.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonReference

/**
 * The gender of the person.
 */
- (enum FSFAMILYTREEV2GenderType *) gender
{
  return _gender;
}

/**
 * The gender of the person.
 */
- (void) setGender: (enum FSFAMILYTREEV2GenderType *) newGender
{
  if (_gender != NULL) {
    free(_gender);
  }
  _gender = newGender;
}

- (void) dealloc
{
  [self setGender: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonReference *_fSFAMILYTREEV2PersonReference = [[FSFAMILYTREEV2PersonReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonReference dealloc];
    _fSFAMILYTREEV2PersonReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonReference autorelease];
  return _fSFAMILYTREEV2PersonReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "gender", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}gender...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2GenderTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}gender."];
    }
    [self setGender: ((enum FSFAMILYTREEV2GenderType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}gender...");
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

  if ([self gender] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "gender", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}gender."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}gender...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2GenderTypeType(writer, [self gender]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}gender."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}gender...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}gender."];
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
@end /* implementation FSFAMILYTREEV2PersonReference (JAXB) */

/**
 *  A Family Tree person reference.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2PersonPersona

/**
 * The contributors.
 */
- (NSArray *) contributors
{
  return _contributors;
}

/**
 * The contributors.
 */
- (void) setContributors: (NSArray *) newContributors
{
  [newContributors retain];
  [_contributors release];
  _contributors = newContributors;
}

- (void) dealloc
{
  [self setContributors: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2PersonPersona */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2PersonPersona (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2PersonPersona (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2PersonPersona (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2PersonPersona from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2PersonPersona defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2PersonPersona *_fSFAMILYTREEV2PersonPersona = [[FSFAMILYTREEV2PersonPersona alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2PersonPersona initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2PersonPersona dealloc];
    _fSFAMILYTREEV2PersonPersona = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2PersonPersona autorelease];
  return _fSFAMILYTREEV2PersonPersona;
}

/**
 * Initialize this instance of FSFAMILYTREEV2PersonPersona according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2PersonPersona to the writer.
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
    && xmlStrcmp(BAD_CAST "contributors", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
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
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributorReference.");
#endif

    __child = [FSFAMILYTREEV2ContributorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributorReference.");
#endif

    if ([self contributors]) {
      [self setContributors: [[self contributors] arrayByAddingObject: __child]];
    }
    else {
      [self setContributors: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setContributors: (NSArray*) __child];
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

  if ([self contributors]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributors", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
    __enumerator = [[self contributors] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2PersonPersona (JAXB) */

/**
 * Reads a MediaType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The MediaType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2MediaType *xmlTextReaderReadFSFAMILYTREEV2MediaTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2MediaType *value = calloc(1, sizeof(enum FSFAMILYTREEV2MediaType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Article") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_ARTICLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Audio") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_AUDIO;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Book") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_BOOK;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cassette Tape") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_CASSETTE_TAPE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Compact Disc") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_COMPACT_DISC;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "DVD") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_DVD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Email") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_EMAIL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Eight MM") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_EIGHT_MM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Electronic Document") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_ELECTRONIC_DOCUMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Gazetteer") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_GAZETTEER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Internet") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_INTERNET;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Magazine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MAGAZINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Manuscript") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MANUSCRIPT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Map") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MAP;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Memorabilia") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MEMORABILIA;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Microfilm") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MICROFILM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Microfiche") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MICROFICHE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Newspaper") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_NEWSPAPER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Periodical") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PERIODICAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Photograph") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PHOTOGRAPH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Paper") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PAPER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Reel to Reel") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_REEL_TO_REEL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "VHS") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_VHS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Video") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_VIDEO;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Website") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_WEBSITE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Written Correspondence") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_WRITTEN_CORRESPONDENCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_OTHER;
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
 * Writes a MediaType to XML.
 *
 * @param writer The XML writer.
 * @param _mediaType The MediaType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2MediaTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2MediaType *_mediaType)
{
  switch (*_mediaType) {
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_ARTICLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Article");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_AUDIO:
      return xmlTextWriterWriteString(writer, BAD_CAST "Audio");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_BOOK:
      return xmlTextWriterWriteString(writer, BAD_CAST "Book");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_CASSETTE_TAPE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cassette Tape");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_COMPACT_DISC:
      return xmlTextWriterWriteString(writer, BAD_CAST "Compact Disc");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_DVD:
      return xmlTextWriterWriteString(writer, BAD_CAST "DVD");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_EMAIL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Email");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_EIGHT_MM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Eight MM");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_ELECTRONIC_DOCUMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Electronic Document");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_GAZETTEER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Gazetteer");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_INTERNET:
      return xmlTextWriterWriteString(writer, BAD_CAST "Internet");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MAGAZINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Magazine");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MANUSCRIPT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Manuscript");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MAP:
      return xmlTextWriterWriteString(writer, BAD_CAST "Map");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MEMORABILIA:
      return xmlTextWriterWriteString(writer, BAD_CAST "Memorabilia");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MICROFILM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Microfilm");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_MICROFICHE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Microfiche");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_NEWSPAPER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Newspaper");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PERIODICAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Periodical");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PHOTOGRAPH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Photograph");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_PAPER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Paper");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_REEL_TO_REEL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Reel to Reel");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_VHS:
      return xmlTextWriterWriteString(writer, BAD_CAST "VHS");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_VIDEO:
      return xmlTextWriterWriteString(writer, BAD_CAST "Video");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_WEBSITE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Website");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_WRITTEN_CORRESPONDENCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Written Correspondence");
    case FAMILYTREE_FAMILYTREE_V2_MEDIATYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a PersonIdType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The PersonIdType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2PersonIdType *xmlTextReaderReadFSFAMILYTREEV2PersonIdTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2PersonIdType *value = calloc(1, sizeof(enum FSFAMILYTREEV2PersonIdType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Ancestral File Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_PERSONIDTYPE_AFN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "GEDCOM UID") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_PERSONIDTYPE_GEDCOM;
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
 * Writes a PersonIdType to XML.
 *
 * @param writer The XML writer.
 * @param _personIdType The PersonIdType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2PersonIdTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2PersonIdType *_personIdType)
{
  switch (*_personIdType) {
    case FAMILYTREE_FAMILYTREE_V2_PERSONIDTYPE_AFN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ancestral File Number");
    case FAMILYTREE_FAMILYTREE_V2_PERSONIDTYPE_GEDCOM:
      return xmlTextWriterWriteString(writer, BAD_CAST "GEDCOM UID");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  An ordinance of a person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2OrdinanceAssertion

/**
 * Whether this is an official assertion.
 */
- (BOOL *) official
{
  return _official;
}

/**
 * Whether this is an official assertion.
 */
- (void) setOfficial: (BOOL *) newOfficial
{
  if (_official != NULL) {
    free(_official);
  }
  _official = newOfficial;
}

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2OrdinanceValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2OrdinanceValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setOfficial: NULL];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2OrdinanceAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2OrdinanceAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2OrdinanceAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2OrdinanceAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2OrdinanceAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2OrdinanceAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2OrdinanceAssertion *_fSFAMILYTREEV2OrdinanceAssertion = [[FSFAMILYTREEV2OrdinanceAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2OrdinanceAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2OrdinanceAssertion dealloc];
    _fSFAMILYTREEV2OrdinanceAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2OrdinanceAssertion autorelease];
  return _fSFAMILYTREEV2OrdinanceAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2OrdinanceAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2OrdinanceAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "official", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setOfficial: ((BOOL*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}ordinanceValue.");
#endif
    __child = [FSFAMILYTREEV2OrdinanceValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}ordinanceValue.");
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

  if ([self official] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "official", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}official."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}official...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self official]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}official...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}official."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}official."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2OrdinanceAssertion (JAXB) */

/**
 *  An ordinance value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2OrdinanceValue

/**
 * The type of the ordinance.
 */
- (enum FSFAMILYTREEV2OrdinanceType *) type
{
  return _type;
}

/**
 * The type of the ordinance.
 */
- (void) setType: (enum FSFAMILYTREEV2OrdinanceType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The temple code if the ordinance was performed in a temple.
 */
- (NSString *) temple
{
  return _temple;
}

/**
 * The temple code if the ordinance was performed in a temple.
 */
- (void) setTemple: (NSString *) newTemple
{
  [newTemple retain];
  [_temple release];
  _temple = newTemple;
}

/**
 * The date the assertion occurred.
 */
- (FSFAMILYTREEV2GenDate *) date
{
  return _date;
}

/**
 * The date the assertion occurred.
 */
- (void) setDate: (FSFAMILYTREEV2GenDate *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * The place the assertion occurred.
 */
- (FSFAMILYTREEV2Place *) place
{
  return _place;
}

/**
 * The place the assertion occurred.
 */
- (void) setPlace: (FSFAMILYTREEV2Place *) newPlace
{
  [newPlace retain];
  [_place release];
  _place = newPlace;
}

/**
 * the parents in a sealing.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * the parents in a sealing.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setTemple: nil];
  [self setDate: nil];
  [self setPlace: nil];
  [self setParents: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2OrdinanceValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2OrdinanceValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2OrdinanceValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2OrdinanceValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2OrdinanceValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2OrdinanceValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2OrdinanceValue *_fSFAMILYTREEV2OrdinanceValue = [[FSFAMILYTREEV2OrdinanceValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2OrdinanceValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2OrdinanceValue dealloc];
    _fSFAMILYTREEV2OrdinanceValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2OrdinanceValue autorelease];
  return _fSFAMILYTREEV2OrdinanceValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2OrdinanceValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2OrdinanceValue to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2OrdinanceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2OrdinanceType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}temple of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}temple of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setTemple: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif
    __child = [FSFAMILYTREEV2GenDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif
    __child = [FSFAMILYTREEV2Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif

    [self setPlace: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    __child = [FSFAMILYTREEV2PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}parents of type {http://api.familysearch.org/familytree/v2}personReference.");
#endif

    if ([self parents]) {
      [self setParents: [[self parents] arrayByAddingObject: __child]];
    }
    else {
      [self setParents: [NSArray arrayWithObject: __child]];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2OrdinanceTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self temple]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "temple", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}temple."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}temple...");
#endif
    [[self temple] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}temple...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}temple."];
    }
  }
  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}date."];
    }
  }
  if ([self place]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "place", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}place."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}place...");
#endif
    [[self place] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}place...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}place."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "parents", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}parents."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}parents...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}parents...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}parents."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSFAMILYTREEV2OrdinanceValue (JAXB) */

/**
 * Reads a OrdinanceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The OrdinanceType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2OrdinanceType *xmlTextReaderReadFSFAMILYTREEV2OrdinanceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2OrdinanceType *value = calloc(1, sizeof(enum FSFAMILYTREEV2OrdinanceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Born in Covenant") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_BORN_IN_COVENANT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Baptism") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_BAPTISM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Confirmation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_CONFIRMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Initiatory") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_INITIATORY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Endowment") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_ENDOWMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Sealing to Parents") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_SEALING_TO_PARENTS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Sealing to Spouse") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_SEALING_TO_SPOUSE;
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
 * Writes a OrdinanceType to XML.
 *
 * @param writer The XML writer.
 * @param _ordinanceType The OrdinanceType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2OrdinanceTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2OrdinanceType *_ordinanceType)
{
  switch (*_ordinanceType) {
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_BORN_IN_COVENANT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Born in Covenant");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_BAPTISM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Baptism");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_CONFIRMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Confirmation");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_INITIATORY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Initiatory");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_ENDOWMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Endowment");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_SEALING_TO_PARENTS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Sealing to Parents");
    case FAMILYTREE_FAMILYTREE_V2_ORDINANCETYPE_SEALING_TO_SPOUSE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Sealing to Spouse");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NameType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NameType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2NameType *xmlTextReaderReadFSFAMILYTREEV2NameTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2NameType *value = calloc(1, sizeof(enum FSFAMILYTREEV2NameType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Also Known As") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_AKA;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Married Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_MARRIED_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Nickname") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_NICKNAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_OTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Phonetic") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_PHONETIC;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unknown") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMETYPE_UNKNOWN;
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
 * Writes a NameType to XML.
 *
 * @param writer The XML writer.
 * @param _nameType The NameType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2NameTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2NameType *_nameType)
{
  switch (*_nameType) {
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_AKA:
      return xmlTextWriterWriteString(writer, BAD_CAST "Also Known As");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_MARRIED_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Married Name");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Name");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_NICKNAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Nickname");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_PHONETIC:
      return xmlTextWriterWriteString(writer, BAD_CAST "Phonetic");
    case FAMILYTREE_FAMILYTREE_V2_NAMETYPE_UNKNOWN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unknown");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A name value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2NameValue

/**
 * The type of this name.
 */
- (enum FSFAMILYTREEV2NameType *) type
{
  return _type;
}

/**
 * The type of this name.
 */
- (void) setType: (enum FSFAMILYTREEV2NameType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The name forms.
 */
- (NSArray *) forms
{
  return _forms;
}

/**
 * The name forms.
 */
- (void) setForms: (NSArray *) newForms
{
  [newForms retain];
  [_forms release];
  _forms = newForms;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setForms: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2NameValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2NameValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2NameValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2NameValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2NameValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2NameValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2NameValue *_fSFAMILYTREEV2NameValue = [[FSFAMILYTREEV2NameValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2NameValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2NameValue dealloc];
    _fSFAMILYTREEV2NameValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2NameValue autorelease];
  return _fSFAMILYTREEV2NameValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2NameValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2NameValue to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2NameTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2NameType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "forms", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}forms...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}forms"
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
    && xmlStrcmp(BAD_CAST "form", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}form of type {http://api.familysearch.org/familytree/v2}nameForm.");
#endif

    __child = [FSFAMILYTREEV2NameForm readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}form of type {http://api.familysearch.org/familytree/v2}nameForm.");
#endif

    if ([self forms]) {
      [self setForms: [[self forms] arrayByAddingObject: __child]];
    }
    else {
      [self setForms: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}forms...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}forms"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setForms: (NSArray*) __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2NameTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self forms]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "forms", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}forms."];
    }
    __enumerator = [[self forms] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "form", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}form."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}form...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}form...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}form."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}forms."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2NameValue (JAXB) */

/**
 * Reads a NamePieceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NamePieceType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2NamePieceType *xmlTextReaderReadFSFAMILYTREEV2NamePieceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2NamePieceType *value = calloc(1, sizeof(enum FSFAMILYTREEV2NamePieceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Prefix") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_PREFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Suffix") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_SUFFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Given") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_GIVEN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_FAMILY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_OTHER;
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
 * Writes a NamePieceType to XML.
 *
 * @param writer The XML writer.
 * @param _namePieceType The NamePieceType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2NamePieceTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2NamePieceType *_namePieceType)
{
  switch (*_namePieceType) {
    case FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_PREFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Prefix");
    case FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_SUFFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Suffix");
    case FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_GIVEN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Given");
    case FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_FAMILY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family");
    case FAMILYTREE_FAMILYTREE_V2_NAMEPIECETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NameFormScript from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NameFormScript, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2NameFormScript *xmlTextReaderReadFSFAMILYTREEV2NameFormScriptType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2NameFormScript *value = calloc(1, sizeof(enum FSFAMILYTREEV2NameFormScript));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Spanish") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_SPANISH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Portuguese") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_PORTUGUESE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Chinese") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_CHINESE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Kana") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_KANA;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Hangul") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_HANGUL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cyrillic") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_CYRILLIC;
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
 * Writes a NameFormScript to XML.
 *
 * @param writer The XML writer.
 * @param _nameFormScript The NameFormScript to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2NameFormScriptType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2NameFormScript *_nameFormScript)
{
  switch (*_nameFormScript) {
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_SPANISH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Spanish");
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_PORTUGUESE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Portuguese");
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_CHINESE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Chinese");
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_KANA:
      return xmlTextWriterWriteString(writer, BAD_CAST "Kana");
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_HANGUL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Hangul");
    case FAMILYTREE_FAMILYTREE_V2_NAMEFORMSCRIPT_CYRILLIC:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cyrillic");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A name of a person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2NameAssertion

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2NameValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2NameValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2NameAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2NameAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2NameAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2NameAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2NameAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2NameAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2NameAssertion *_fSFAMILYTREEV2NameAssertion = [[FSFAMILYTREEV2NameAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2NameAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2NameAssertion dealloc];
    _fSFAMILYTREEV2NameAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2NameAssertion autorelease];
  return _fSFAMILYTREEV2NameAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2NameAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2NameAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}nameValue.");
#endif
    __child = [FSFAMILYTREEV2NameValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}nameValue.");
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

  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2NameAssertion (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2MatchResult

/**
 * The confidence of the match.
 */
- (enum FSFAMILYTREEV2MatchConfidence *) confidence
{
  return _confidence;
}

/**
 * The confidence of the match.
 */
- (void) setConfidence: (enum FSFAMILYTREEV2MatchConfidence *) newConfidence
{
  if (_confidence != NULL) {
    free(_confidence);
  }
  _confidence = newConfidence;
}

- (void) dealloc
{
  [self setConfidence: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2MatchResult */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2MatchResult (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2MatchResult (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2MatchResult (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2MatchResult from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2MatchResult defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2MatchResult *_fSFAMILYTREEV2MatchResult = [[FSFAMILYTREEV2MatchResult alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2MatchResult initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2MatchResult dealloc];
    _fSFAMILYTREEV2MatchResult = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2MatchResult autorelease];
  return _fSFAMILYTREEV2MatchResult;
}

/**
 * Initialize this instance of FSFAMILYTREEV2MatchResult according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2MatchResult to the writer.
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
    && xmlStrcmp(BAD_CAST "confidence", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2MatchConfidenceType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setConfidence: ((enum FSFAMILYTREEV2MatchConfidence*) _child_accessor)];
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

  if ([self confidence] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "confidence", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}confidence."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}confidence...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2MatchConfidenceType(writer, [self confidence]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}confidence...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}confidence."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}confidence."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2MatchResult (JAXB) */

/**
 * Reads a MatchConfidence from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The MatchConfidence, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2MatchConfidence *xmlTextReaderReadFSFAMILYTREEV2MatchConfidenceType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2MatchConfidence *value = calloc(1, sizeof(enum FSFAMILYTREEV2MatchConfidence));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "High") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_HIGH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Medium") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_MEDIUM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Low") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_LOW;
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
 * Writes a MatchConfidence to XML.
 *
 * @param writer The XML writer.
 * @param _matchConfidence The MatchConfidence to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2MatchConfidenceType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2MatchConfidence *_matchConfidence)
{
  switch (*_matchConfidence) {
    case FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_HIGH:
      return xmlTextWriterWriteString(writer, BAD_CAST "High");
    case FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_MEDIUM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Medium");
    case FAMILYTREE_FAMILYTREE_V2_MATCHCONFIDENCE_LOW:
      return xmlTextWriterWriteString(writer, BAD_CAST "Low");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A gender value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2GenderValue

/**
 * The type of the gender.
 */
- (enum FSFAMILYTREEV2GenderType *) type
{
  return _type;
}

/**
 * The type of the gender.
 */
- (void) setType: (enum FSFAMILYTREEV2GenderType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

- (void) dealloc
{
  [self setType: NULL];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2GenderValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2GenderValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2GenderValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2GenderValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2GenderValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2GenderValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2GenderValue *_fSFAMILYTREEV2GenderValue = [[FSFAMILYTREEV2GenderValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2GenderValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2GenderValue dealloc];
    _fSFAMILYTREEV2GenderValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2GenderValue autorelease];
  return _fSFAMILYTREEV2GenderValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2GenderValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2GenderValue to the writer.
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
    && xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2GenderTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setType: ((enum FSFAMILYTREEV2GenderType*) _child_accessor)];
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

  if ([self type] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2GenderTypeType(writer, [self type]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}type...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}type."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}type."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2GenderValue (JAXB) */

/**
 *  A gender of a person.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2GenderAssertion

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2GenderValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2GenderValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2GenderAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2GenderAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2GenderAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2GenderAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2GenderAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2GenderAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2GenderAssertion *_fSFAMILYTREEV2GenderAssertion = [[FSFAMILYTREEV2GenderAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2GenderAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2GenderAssertion dealloc];
    _fSFAMILYTREEV2GenderAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2GenderAssertion autorelease];
  return _fSFAMILYTREEV2GenderAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2GenderAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2GenderAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}genderValue.");
#endif
    __child = [FSFAMILYTREEV2GenderValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}genderValue.");
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

  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2GenderAssertion (JAXB) */

/**
 *  An event value.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2EventValue

/**
 * The type of the event.
 */
- (enum FSFAMILYTREEV2EventType *) type
{
  return _type;
}

/**
 * The type of the event.
 */
- (void) setType: (enum FSFAMILYTREEV2EventType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The description of the event.
 */
- (NSString *) description
{
  return _description;
}

/**
 * The description of the event.
 */
- (void) setDescription: (NSString *) newDescription
{
  [newDescription retain];
  [_description release];
  _description = newDescription;
}

/**
 * The date the assertion occurred.
 */
- (FSFAMILYTREEV2GenDate *) date
{
  return _date;
}

/**
 * The date the assertion occurred.
 */
- (void) setDate: (FSFAMILYTREEV2GenDate *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * The place the assertion occurred.
 */
- (FSFAMILYTREEV2Place *) place
{
  return _place;
}

/**
 * The place the assertion occurred.
 */
- (void) setPlace: (FSFAMILYTREEV2Place *) newPlace
{
  [newPlace retain];
  [_place release];
  _place = newPlace;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setDescription: nil];
  [self setDate: nil];
  [self setPlace: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2EventValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2EventValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2EventValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2EventValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2EventValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2EventValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2EventValue *_fSFAMILYTREEV2EventValue = [[FSFAMILYTREEV2EventValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2EventValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2EventValue dealloc];
    _fSFAMILYTREEV2EventValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2EventValue autorelease];
  return _fSFAMILYTREEV2EventValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2EventValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2EventValue to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2EventTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2EventType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "description", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}description of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}description of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setDescription: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif
    __child = [FSFAMILYTREEV2GenDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif
    __child = [FSFAMILYTREEV2Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif

    [self setPlace: __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2EventTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self description]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "description", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}description."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}description...");
#endif
    [[self description] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}description...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}description."];
    }
  }
  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}date."];
    }
  }
  if ([self place]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "place", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}place."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}place...");
#endif
    [[self place] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}place...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}place."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2EventValue (JAXB) */

/**
 *  An event of a person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2EventAssertion

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2EventValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2EventValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2EventAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2EventAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2EventAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2EventAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2EventAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2EventAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2EventAssertion *_fSFAMILYTREEV2EventAssertion = [[FSFAMILYTREEV2EventAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2EventAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2EventAssertion dealloc];
    _fSFAMILYTREEV2EventAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2EventAssertion autorelease];
  return _fSFAMILYTREEV2EventAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2EventAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2EventAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}eventValue.");
#endif
    __child = [FSFAMILYTREEV2EventValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}eventValue.");
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

  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2EventAssertion (JAXB) */

/**
 *  A Family Tree contributor reference.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2ContributorReference

/**
 * (no documentation provided)
 */
- (enum FSFAMILYTREEV2AssertionDisposition *) disposition
{
  return _disposition;
}

/**
 * (no documentation provided)
 */
- (void) setDisposition: (enum FSFAMILYTREEV2AssertionDisposition *) newDisposition
{
  if (_disposition != NULL) {
    free(_disposition);
  }
  _disposition = newDisposition;
}

/**
 * (no documentation provided)
 */
- (FSFAMILYTREEV2EntityReference *) submitter
{
  return _submitter;
}

/**
 * (no documentation provided)
 */
- (void) setSubmitter: (FSFAMILYTREEV2EntityReference *) newSubmitter
{
  [newSubmitter retain];
  [_submitter release];
  _submitter = newSubmitter;
}

- (void) dealloc
{
  [self setDisposition: NULL];
  [self setSubmitter: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2ContributorReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2ContributorReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2ContributorReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2ContributorReference (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2ContributorReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2ContributorReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2ContributorReference *_fSFAMILYTREEV2ContributorReference = [[FSFAMILYTREEV2ContributorReference alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2ContributorReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2ContributorReference dealloc];
    _fSFAMILYTREEV2ContributorReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2ContributorReference autorelease];
  return _fSFAMILYTREEV2ContributorReference;
}

/**
 * Initialize this instance of FSFAMILYTREEV2ContributorReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2ContributorReference to the writer.
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
    && xmlStrcmp(BAD_CAST "disposition", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setDisposition: ((enum FSFAMILYTREEV2AssertionDisposition*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "submitter", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}submitter of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setSubmitter: __child];
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

  if ([self disposition] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "disposition", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(writer, [self disposition]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}disposition...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}disposition."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}disposition."];
    }
  }
  if ([self submitter]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "submitter", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}submitter."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}submitter...");
#endif
    [[self submitter] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}submitter...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}submitter."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2ContributorReference (JAXB) */

/**
 *  A contributor of information to new FamilySearch.

 @author Ryan Heaton

 */
@implementation FSFAMILYTREEV2Contributor

/**
 * The user aliases.
 */
- (NSArray *) aliases
{
  return _aliases;
}

/**
 * The user aliases.
 */
- (void) setAliases: (NSArray *) newAliases
{
  [newAliases retain];
  [_aliases release];
  _aliases = newAliases;
}

- (void) dealloc
{
  [self setAliases: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2Contributor */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2Contributor (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2Contributor (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2Contributor (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2Contributor from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2Contributor defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2Contributor *_fSFAMILYTREEV2Contributor = [[FSFAMILYTREEV2Contributor alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2Contributor initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2Contributor dealloc];
    _fSFAMILYTREEV2Contributor = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2Contributor autorelease];
  return _fSFAMILYTREEV2Contributor;
}

/**
 * Initialize this instance of FSFAMILYTREEV2Contributor according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2Contributor to the writer.
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
    && xmlStrcmp(BAD_CAST "aliases", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}aliases...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}aliases"
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
    && xmlStrcmp(BAD_CAST "alias", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}alias of type {http://api.familysearch.org/familytree/v2}contributorAlias.");
#endif

    __child = [FSFAMILYTREEV2ContributorAlias readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}alias of type {http://api.familysearch.org/familytree/v2}contributorAlias.");
#endif

    if ([self aliases]) {
      [self setAliases: [[self aliases] arrayByAddingObject: __child]];
    }
    else {
      [self setAliases: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}aliases...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}aliases"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setAliases: (NSArray*) __child];
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

  if ([self aliases]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "aliases", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}aliases."];
    }
    __enumerator = [[self aliases] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "alias", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}alias."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}alias...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}alias...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}alias."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}aliases."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2Contributor (JAXB) */

/**
 * Reads a CombineSeparateAction from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The CombineSeparateAction, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2CombineSeparateAction *xmlTextReaderReadFSFAMILYTREEV2CombineSeparateActionType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2CombineSeparateAction *value = calloc(1, sizeof(enum FSFAMILYTREEV2CombineSeparateAction));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Separate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_COMBINESEPARATEACTION_SEPARATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Move") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_COMBINESEPARATEACTION_MOVE;
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
 * Writes a CombineSeparateAction to XML.
 *
 * @param writer The XML writer.
 * @param _combineSeparateAction The CombineSeparateAction to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2CombineSeparateActionType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2CombineSeparateAction *_combineSeparateAction)
{
  switch (*_combineSeparateAction) {
    case FAMILYTREE_FAMILYTREE_V2_COMBINESEPARATEACTION_SEPARATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Separate");
    case FAMILYTREE_FAMILYTREE_V2_COMBINESEPARATEACTION_MOVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Move");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a CitationType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The CitationType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2CitationType *xmlTextReaderReadFSFAMILYTREEV2CitationTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2CitationType *value = calloc(1, sizeof(enum FSFAMILYTREEV2CitationType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Artifact") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_ARTIFACT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Interview") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_INTERVIEW;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "In My Possession") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_IN_MY_POSSESSION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Lecture") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_LECTURE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Possession of Someone Else") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_POSSESSION_OF_SOMEONE_ELSE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Standard Source") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_STANDARD_SOURCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Word of Mouth") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_WORD_OF_MOUTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Written Correspondence") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_WRITTEN_CORRESPONDENCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_OTHER;
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
 * Writes a CitationType to XML.
 *
 * @param writer The XML writer.
 * @param _citationType The CitationType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2CitationTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2CitationType *_citationType)
{
  switch (*_citationType) {
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_ARTIFACT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Artifact");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_INTERVIEW:
      return xmlTextWriterWriteString(writer, BAD_CAST "Interview");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_IN_MY_POSSESSION:
      return xmlTextWriterWriteString(writer, BAD_CAST "In My Possession");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_LECTURE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Lecture");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_POSSESSION_OF_SOMEONE_ELSE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Possession of Someone Else");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_STANDARD_SOURCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Standard Source");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_WORD_OF_MOUTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Word of Mouth");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_WRITTEN_CORRESPONDENCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Written Correspondence");
    case FAMILYTREE_FAMILYTREE_V2_CITATIONTYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a CharacteristicType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The CharacteristicType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2CharacteristicType *xmlTextReaderReadFSFAMILYTREEV2CharacteristicTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2CharacteristicType *value = calloc(1, sizeof(enum FSFAMILYTREEV2CharacteristicType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Caste Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CASTE_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Clan Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CLAN_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "National ID") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NATIONAL_ID;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "National Origin") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NATIONAL_ORIGIN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Title of Nobility") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NOBILITY_TITLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Occupation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_OCCUPATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Physical Description") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_PHYSICAL_DESCRIPTION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Race") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RACE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Religious Affiliation") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RELIGIOUS_AFFILIATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Stillborn") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_STILLBORN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Tribe Name") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_TRIBE_NAME;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "GEDCOM ID") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_GEDCOM_ID;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Common Law Marriage") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_COMMON_LAW_MARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Lineage") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_LINEAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Exists") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_EXISTS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_OTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Number of Children") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NUMBER_OF_CHILDREN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Number of Marriages") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NUMBER_OF_MARRIAGES;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Currently Spouses") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CURRENTLY_SPOUSES;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Died before Eight") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_DIED_BEFORE_EIGHT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Name Sake") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NAME_SAKE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Never Had Children") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NEVER_HAD_CHILDREN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Never Married") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NEVER_MARRIED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Not Accountable") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NOT_ACCOUNTABLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Possessions") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_POSSESSIONS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Residence") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RESIDENCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Scholastic Achievement") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_SCHOLASTIC_ACHIEVEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Social Security Number") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_SOCIAL_SECURITY_NUMBER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Twin") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_TWIN;
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
 * Writes a CharacteristicType to XML.
 *
 * @param writer The XML writer.
 * @param _characteristicType The CharacteristicType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2CharacteristicTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2CharacteristicType *_characteristicType)
{
  switch (*_characteristicType) {
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CASTE_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Caste Name");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CLAN_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Clan Name");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NATIONAL_ID:
      return xmlTextWriterWriteString(writer, BAD_CAST "National ID");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NATIONAL_ORIGIN:
      return xmlTextWriterWriteString(writer, BAD_CAST "National Origin");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NOBILITY_TITLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Title of Nobility");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_OCCUPATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Occupation");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_PHYSICAL_DESCRIPTION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Physical Description");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RACE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Race");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RELIGIOUS_AFFILIATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Religious Affiliation");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_STILLBORN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Stillborn");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_TRIBE_NAME:
      return xmlTextWriterWriteString(writer, BAD_CAST "Tribe Name");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_GEDCOM_ID:
      return xmlTextWriterWriteString(writer, BAD_CAST "GEDCOM ID");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_COMMON_LAW_MARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Common Law Marriage");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_LINEAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Lineage");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_EXISTS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Exists");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NUMBER_OF_CHILDREN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Number of Children");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NUMBER_OF_MARRIAGES:
      return xmlTextWriterWriteString(writer, BAD_CAST "Number of Marriages");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_CURRENTLY_SPOUSES:
      return xmlTextWriterWriteString(writer, BAD_CAST "Currently Spouses");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_DIED_BEFORE_EIGHT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Died before Eight");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NAME_SAKE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Name Sake");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NEVER_HAD_CHILDREN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Never Had Children");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NEVER_MARRIED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Never Married");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_NOT_ACCOUNTABLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Not Accountable");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_POSSESSIONS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Possessions");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_RESIDENCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Residence");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_SCHOLASTIC_ACHIEVEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Scholastic Achievement");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_SOCIAL_SECURITY_NUMBER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Social Security Number");
    case FAMILYTREE_FAMILYTREE_V2_CHARACTERISTICTYPE_TWIN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Twin");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  A characteristic value.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2CharacteristicValue

/**
 * The type of the characteristic.
 */
- (enum FSFAMILYTREEV2CharacteristicType *) type
{
  return _type;
}

/**
 * The type of the characteristic.
 */
- (void) setType: (enum FSFAMILYTREEV2CharacteristicType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The lineage.
 */
- (enum FSFAMILYTREEV2LineageType *) lineage
{
  return _lineage;
}

/**
 * The lineage.
 */
- (void) setLineage: (enum FSFAMILYTREEV2LineageType *) newLineage
{
  if (_lineage != NULL) {
    free(_lineage);
  }
  _lineage = newLineage;
}

/**
 * The generic value of this characteristic.
 */
- (NSString *) detail
{
  return _detail;
}

/**
 * The generic value of this characteristic.
 */
- (void) setDetail: (NSString *) newDetail
{
  [newDetail retain];
  [_detail release];
  _detail = newDetail;
}

/**
 * The date the assertion occurred.
 */
- (FSFAMILYTREEV2GenDate *) date
{
  return _date;
}

/**
 * The date the assertion occurred.
 */
- (void) setDate: (FSFAMILYTREEV2GenDate *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * The place the assertion occurred.
 */
- (FSFAMILYTREEV2Place *) place
{
  return _place;
}

/**
 * The place the assertion occurred.
 */
- (void) setPlace: (FSFAMILYTREEV2Place *) newPlace
{
  [newPlace retain];
  [_place release];
  _place = newPlace;
}

- (void) dealloc
{
  [self setType: NULL];
  [self setLineage: NULL];
  [self setDetail: nil];
  [self setDate: nil];
  [self setPlace: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2CharacteristicValue */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2CharacteristicValue (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2CharacteristicValue (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2CharacteristicValue (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2CharacteristicValue from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2CharacteristicValue defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2CharacteristicValue *_fSFAMILYTREEV2CharacteristicValue = [[FSFAMILYTREEV2CharacteristicValue alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2CharacteristicValue initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2CharacteristicValue dealloc];
    _fSFAMILYTREEV2CharacteristicValue = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2CharacteristicValue autorelease];
  return _fSFAMILYTREEV2CharacteristicValue;
}

/**
 * Initialize this instance of FSFAMILYTREEV2CharacteristicValue according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2CharacteristicValue to the writer.
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

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2CharacteristicTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSFAMILYTREEV2CharacteristicType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "lineage", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSFAMILYTREEV2LineageTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setLineage: ((enum FSFAMILYTREEV2LineageType*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "detail", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}detail of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}detail of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setDetail: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif
    __child = [FSFAMILYTREEV2GenDate readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}date of type {http://api.familysearch.org/familytree/v2}date.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif
    __child = [FSFAMILYTREEV2Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}place of type {http://api.familysearch.org/familytree/v2}place.");
#endif

    [self setPlace: __child];
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

  if ([self type] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2CharacteristicTypeType(writer, [self type]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}type."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
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

  if ([self lineage] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "lineage", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}lineage."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}lineage...");
#endif
    status = xmlTextWriterWriteFSFAMILYTREEV2LineageTypeType(writer, [self lineage]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}lineage...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}lineage."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}lineage."];
    }
  }
  if ([self detail]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "detail", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}detail."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}detail...");
#endif
    [[self detail] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}detail...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}detail."];
    }
  }
  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}date."];
    }
  }
  if ([self place]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "place", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}place."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}place...");
#endif
    [[self place] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}place...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}place."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2CharacteristicValue (JAXB) */

/**
 *  A characteristic of a person.

 @author Rob Lyon

 */
@implementation FSFAMILYTREEV2CharacteristicAssertion

/**
 * The value for this assertion.
 */
- (FSFAMILYTREEV2CharacteristicValue *) value
{
  return _value;
}

/**
 * The value for this assertion.
 */
- (void) setValue: (FSFAMILYTREEV2CharacteristicValue *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

- (void) dealloc
{
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2CharacteristicAssertion */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2CharacteristicAssertion (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2CharacteristicAssertion (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2CharacteristicAssertion (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2CharacteristicAssertion from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2CharacteristicAssertion defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2CharacteristicAssertion *_fSFAMILYTREEV2CharacteristicAssertion = [[FSFAMILYTREEV2CharacteristicAssertion alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2CharacteristicAssertion initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2CharacteristicAssertion dealloc];
    _fSFAMILYTREEV2CharacteristicAssertion = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2CharacteristicAssertion autorelease];
  return _fSFAMILYTREEV2CharacteristicAssertion;
}

/**
 * Initialize this instance of FSFAMILYTREEV2CharacteristicAssertion according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2CharacteristicAssertion to the writer.
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
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}characteristicValue.");
#endif
    __child = [FSFAMILYTREEV2CharacteristicValue readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}value of type {http://api.familysearch.org/familytree/v2}characteristicValue.");
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

  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}value."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2CharacteristicAssertion (JAXB) */

/**
 * Reads a ChangeType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ChangeType, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2ChangeType *xmlTextReaderReadFSFAMILYTREEV2ChangeTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2ChangeType *value = calloc(1, sizeof(enum FSFAMILYTREEV2ChangeType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Combine") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGETYPE_COMBINE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Separate") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_CHANGETYPE_SEPARATE;
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
 * Writes a ChangeType to XML.
 *
 * @param writer The XML writer.
 * @param _changeType The ChangeType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2ChangeTypeType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2ChangeType *_changeType)
{
  switch (*_changeType) {
    case FAMILYTREE_FAMILYTREE_V2_CHANGETYPE_COMBINE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Combine");
    case FAMILYTREE_FAMILYTREE_V2_CHANGETYPE_SEPARATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Separate");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a AssertionDisposition from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The AssertionDisposition, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2AssertionDisposition *xmlTextReaderReadFSFAMILYTREEV2AssertionDispositionType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2AssertionDisposition *value = calloc(1, sizeof(enum FSFAMILYTREEV2AssertionDisposition));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Affirming") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_AFFIRMING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Disputing") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_DISPUTING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Affirming And Disputing") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_AFFIRMING_DISPUTING;
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
 * Writes a AssertionDisposition to XML.
 *
 * @param writer The XML writer.
 * @param _assertionDisposition The AssertionDisposition to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2AssertionDispositionType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2AssertionDisposition *_assertionDisposition)
{
  switch (*_assertionDisposition) {
    case FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_AFFIRMING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Affirming");
    case FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_DISPUTING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Disputing");
    case FAMILYTREE_FAMILYTREE_V2_ASSERTIONDISPOSITION_AFFIRMING_DISPUTING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Affirming And Disputing");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a AssertionAction from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The AssertionAction, or NULL if unable to be read.
 */
static enum FSFAMILYTREEV2AssertionAction *xmlTextReaderReadFSFAMILYTREEV2AssertionActionType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSFAMILYTREEV2AssertionAction *value = calloc(1, sizeof(enum FSFAMILYTREEV2AssertionAction));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Select") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ASSERTIONACTION_SELECT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Delete") == 0) {
      *value = FAMILYTREE_FAMILYTREE_V2_ASSERTIONACTION_DELETE;
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
 * Writes a AssertionAction to XML.
 *
 * @param writer The XML writer.
 * @param _assertionAction The AssertionAction to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSFAMILYTREEV2AssertionActionType(xmlTextWriterPtr writer, enum FSFAMILYTREEV2AssertionAction *_assertionAction)
{
  switch (*_assertionAction) {
    case FAMILYTREE_FAMILYTREE_V2_ASSERTIONACTION_SELECT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Select");
    case FAMILYTREE_FAMILYTREE_V2_ASSERTIONACTION_DELETE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Delete");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2FamilyTreeStatus

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
 * Reference to the person to which the error applies.
 */
- (FSFAMILYTREEV2EntityReference *) person
{
  return _person;
}

/**
 * Reference to the person to which the error applies.
 */
- (void) setPerson: (FSFAMILYTREEV2EntityReference *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

/**
 * Reference to the persona to which the error applies.
 */
- (FSFAMILYTREEV2EntityReference *) persona
{
  return _persona;
}

/**
 * Reference to the persona to which the error applies.
 */
- (void) setPersona: (FSFAMILYTREEV2EntityReference *) newPersona
{
  [newPersona retain];
  [_persona release];
  _persona = newPersona;
}

/**
 * The assertion to which this error applies.
 */
- (FSFAMILYTREEV2EntityReference *) assertion
{
  return _assertion;
}

/**
 * The assertion to which this error applies.
 */
- (void) setAssertion: (FSFAMILYTREEV2EntityReference *) newAssertion
{
  [newAssertion retain];
  [_assertion release];
  _assertion = newAssertion;
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
  [self setPerson: nil];
  [self setPersona: nil];
  [self setAssertion: nil];
  [self setDetails: nil];
  [super dealloc];
}
@end /* implementation FSFAMILYTREEV2FamilyTreeStatus */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2FamilyTreeStatus (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2FamilyTreeStatus (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2FamilyTreeStatus (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2FamilyTreeStatus from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2FamilyTreeStatus defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2FamilyTreeStatus *_fSFAMILYTREEV2FamilyTreeStatus = [[FSFAMILYTREEV2FamilyTreeStatus alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2FamilyTreeStatus initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2FamilyTreeStatus dealloc];
    _fSFAMILYTREEV2FamilyTreeStatus = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2FamilyTreeStatus autorelease];
  return _fSFAMILYTREEV2FamilyTreeStatus;
}

/**
 * Initialize this instance of FSFAMILYTREEV2FamilyTreeStatus according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2FamilyTreeStatus to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setMessage: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setPerson: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setPersona: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assertion", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif
    __child = [FSFAMILYTREEV2EntityReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}assertion of type {http://api.familysearch.org/familytree/v2}entityReference.");
#endif

    [self setAssertion: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "details", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}details of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}details of type {http://www.w3.org/2001/XMLSchema}string.");
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "code", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}code."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}code...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_code);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}code...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}code."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}code."];
    }
  }
  if ([self subcode] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "subcode", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}subcode."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}subcode...");
#endif
    status = xmlTextWriterWriteIntType(writer, [self subcode]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}subcode...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/familytree/v2}subcode."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}subcode."];
    }
  }
  if ([self message]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "message", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}message."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}message...");
#endif
    [[self message] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}message...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}message."];
    }
  }
  if ([self person]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
    }
  }
  if ([self persona]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persona", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}persona."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}persona...");
#endif
    [[self persona] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}persona...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}persona."];
    }
  }
  if ([self assertion]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "assertion", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}assertion."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}assertion...");
#endif
    [[self assertion] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}assertion...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}assertion."];
    }
  }
  if ([self details]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "details", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}details."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/familytree/v2}details...");
#endif
    [[self details] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}details...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}details."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2FamilyTreeStatus (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSFAMILYTREEV1FamilyTree

- (void) dealloc
{
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSFAMILYTREEV1FamilyTree *_fSFAMILYTREEV1FamilyTree;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSFAMILYTREEV1FamilyTree = (FSFAMILYTREEV1FamilyTree *) [FSFAMILYTREEV1FamilyTree readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSFAMILYTREEV1FamilyTree;
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
@end /* implementation FSFAMILYTREEV1FamilyTree */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV1FamilyTree (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSFAMILYTREEV1FamilyTree (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV1FamilyTree (JAXB)

/**
 * Read an instance of FSFAMILYTREEV1FamilyTree from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV1FamilyTree defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV1FamilyTree *_fSFAMILYTREEV1FamilyTree = [[FSFAMILYTREEV1FamilyTree alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV1FamilyTree initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV1FamilyTree dealloc];
    _fSFAMILYTREEV1FamilyTree = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV1FamilyTree autorelease];
  return _fSFAMILYTREEV1FamilyTree;
}

/**
 * Initialize this instance of FSFAMILYTREEV1FamilyTree according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV1FamilyTree to the writer.
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
 * Reads a FSFAMILYTREEV1FamilyTree from an XML reader. The element to be read is
 * "{http://api.familysearch.org/familytree/v1}familytree".
 *
 * @param reader The XML reader.
 * @return The FSFAMILYTREEV1FamilyTree.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSFAMILYTREEV1FamilyTree *_familyTree = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/familytree/v1}familytree."];
    }
  }

  if (xmlStrcmp(BAD_CAST "familytree", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/familytree/v1}familytree.");
#endif
    _familyTree = (FSFAMILYTREEV1FamilyTree *)[FSFAMILYTREEV1FamilyTree readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/familytree/v1}familytree.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSFAMILYTREEV1FamilyTree. Expected element {http://api.familysearch.org/familytree/v1}familytree. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSFAMILYTREEV1FamilyTree. Expected element {http://api.familysearch.org/familytree/v1}familytree. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _familyTree;
}

/**
 * Writes this FSFAMILYTREEV1FamilyTree to XML under element name "{http://api.familysearch.org/familytree/v1}familytree".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _familyTree The FamilyTree to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSFAMILYTREEV1FamilyTree to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v1", BAD_CAST "familytree", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/familytree/v1}familytree. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/familytree/v1}familytree...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:fsapi_v1", BAD_CAST "http://api.familysearch.org/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:fsapi_v1' on '{http://api.familysearch.org/familytree/v1}familytree'. XML writer status: %i\n", rc];
    }

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:familytree_v1", BAD_CAST "http://api.familysearch.org/familytree/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:familytree_v1' on '{http://api.familysearch.org/familytree/v1}familytree'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/familytree/v1}familytree...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/familytree/v1}familyTree for root element {http://api.familysearch.org/familytree/v1}familytree...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/familytree/v1}familyTree for root element {http://api.familysearch.org/familytree/v1}familytree...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/familytree/v1}familytree. XML writer status: %i\n", rc];
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

}
@end /* implementation FSFAMILYTREEV1FamilyTree (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2FamilyTreeProperty

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
@end /* implementation FSFAMILYTREEV2FamilyTreeProperty */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2FamilyTreeProperty (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSFAMILYTREEV2FamilyTreeProperty (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2FamilyTreeProperty (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2FamilyTreeProperty from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2FamilyTreeProperty defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2FamilyTreeProperty *_fSFAMILYTREEV2FamilyTreeProperty = [[FSFAMILYTREEV2FamilyTreeProperty alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2FamilyTreeProperty initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2FamilyTreeProperty dealloc];
    _fSFAMILYTREEV2FamilyTreeProperty = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2FamilyTreeProperty autorelease];
  return _fSFAMILYTREEV2FamilyTreeProperty;
}

/**
 * Initialize this instance of FSFAMILYTREEV2FamilyTreeProperty according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2FamilyTreeProperty to the writer.
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
@end /* implementation FSFAMILYTREEV2FamilyTreeProperty (JAXB) */

/**
 *  @author Rob Lyon

 */
@implementation FSFAMILYTREEV2FamilyTree

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
 * The persons.
 */
- (NSArray *) persons
{
  return _persons;
}

/**
 * The persons.
 */
- (void) setPersons: (NSArray *) newPersons
{
  [newPersons retain];
  [_persons release];
  _persons = newPersons;
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
 * The personas.
 */
- (NSArray *) personas
{
  return _personas;
}

/**
 * The personas.
 */
- (void) setPersonas: (NSArray *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
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
 * The users.
 */
- (NSArray *) users
{
  return _users;
}

/**
 * The users.
 */
- (void) setUsers: (NSArray *) newUsers
{
  [newUsers retain];
  [_users release];
  _users = newUsers;
}

/**
 * The results of a search.
 */
- (NSArray *) searches
{
  return _searches;
}

/**
 * The results of a search.
 */
- (void) setSearches: (NSArray *) newSearches
{
  [newSearches retain];
  [_searches release];
  _searches = newSearches;
}

/**
 * The results of a match operation.
 */
- (NSArray *) matches
{
  return _matches;
}

/**
 * The results of a match operation.
 */
- (void) setMatches: (NSArray *) newMatches
{
  [newMatches retain];
  [_matches release];
  _matches = newMatches;
}

/**
 * The contributors.
 */
- (NSArray *) contributors
{
  return _contributors;
}

/**
 * The contributors.
 */
- (void) setContributors: (NSArray *) newContributors
{
  [newContributors retain];
  [_contributors release];
  _contributors = newContributors;
}

/**
 * The pedigrees.
 */
- (NSArray *) pedigrees
{
  return _pedigrees;
}

/**
 * The pedigrees.
 */
- (void) setPedigrees: (NSArray *) newPedigrees
{
  [newPedigrees retain];
  [_pedigrees release];
  _pedigrees = newPedigrees;
}

/**
 * The notes.
 */
- (NSArray *) notes
{
  return _notes;
}

/**
 * The notes.
 */
- (void) setNotes: (NSArray *) newNotes
{
  [newNotes retain];
  [_notes release];
  _notes = newNotes;
}

/**
 * The citations.
 */
- (NSArray *) citations
{
  return _citations;
}

/**
 * The citations.
 */
- (void) setCitations: (NSArray *) newCitations
{
  [newCitations retain];
  [_citations release];
  _citations = newCitations;
}

- (void) dealloc
{
  [self setStatusCode: NULL];
  [self setDeprecated: NULL];
  [self setStatusMessage: nil];
  [self setVersion: nil];
  [self setPersons: nil];
  [self setStatus: nil];
  [self setPersonas: nil];
  [self setProperties: nil];
  [self setUsers: nil];
  [self setSearches: nil];
  [self setMatches: nil];
  [self setContributors: nil];
  [self setPedigrees: nil];
  [self setNotes: nil];
  [self setCitations: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSFAMILYTREEV2FamilyTree *_fSFAMILYTREEV2FamilyTree;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSFAMILYTREEV2FamilyTree = (FSFAMILYTREEV2FamilyTree *) [FSFAMILYTREEV2FamilyTree readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSFAMILYTREEV2FamilyTree;
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
@end /* implementation FSFAMILYTREEV2FamilyTree */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSFAMILYTREEV2FamilyTree (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSFAMILYTREEV2FamilyTree (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSFAMILYTREEV2FamilyTree (JAXB)

/**
 * Read an instance of FSFAMILYTREEV2FamilyTree from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSFAMILYTREEV2FamilyTree defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSFAMILYTREEV2FamilyTree *_fSFAMILYTREEV2FamilyTree = [[FSFAMILYTREEV2FamilyTree alloc] init];
  NS_DURING
  {
    [_fSFAMILYTREEV2FamilyTree initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSFAMILYTREEV2FamilyTree dealloc];
    _fSFAMILYTREEV2FamilyTree = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSFAMILYTREEV2FamilyTree autorelease];
  return _fSFAMILYTREEV2FamilyTree;
}

/**
 * Initialize this instance of FSFAMILYTREEV2FamilyTree according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSFAMILYTREEV2FamilyTree to the writer.
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
 * Reads a FSFAMILYTREEV2FamilyTree from an XML reader. The element to be read is
 * "{http://api.familysearch.org/familytree/v2}familytree".
 *
 * @param reader The XML reader.
 * @return The FSFAMILYTREEV2FamilyTree.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSFAMILYTREEV2FamilyTree *_familyTree = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/familytree/v2}familytree."];
    }
  }

  if (xmlStrcmp(BAD_CAST "familytree", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/familytree/v2}familytree.");
#endif
    _familyTree = (FSFAMILYTREEV2FamilyTree *)[FSFAMILYTREEV2FamilyTree readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/familytree/v2}familytree.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSFAMILYTREEV2FamilyTree. Expected element {http://api.familysearch.org/familytree/v2}familytree. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSFAMILYTREEV2FamilyTree. Expected element {http://api.familysearch.org/familytree/v2}familytree. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _familyTree;
}

/**
 * Writes this FSFAMILYTREEV2FamilyTree to XML under element name "{http://api.familysearch.org/familytree/v2}familytree".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _familyTree The FamilyTree to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSFAMILYTREEV2FamilyTree to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "familytree", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/familytree/v2}familytree. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/familytree/v2}familytree...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:familytree_v2", BAD_CAST "http://api.familysearch.org/familytree/v2");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:familytree_v2' on '{http://api.familysearch.org/familytree/v2}familytree'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/familytree/v2}familytree...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/familytree/v2}familyTree for root element {http://api.familysearch.org/familytree/v2}familytree...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/familytree/v2}familyTree for root element {http://api.familysearch.org/familytree/v2}familytree...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/familytree/v2}familytree. XML writer status: %i\n", rc];
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
    && xmlStrcmp(BAD_CAST "persons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}persons...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}persons"
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
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    __child = [FSFAMILYTREEV2Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}person of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    if ([self persons]) {
      [self setPersons: [[self persons] arrayByAddingObject: __child]];
    }
    else {
      [self setPersons: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}persons...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}persons"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPersons: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}status of type {http://api.familysearch.org/familytree/v2}familyTreeStatus.");
#endif

    __child = [FSFAMILYTREEV2FamilyTreeStatus readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}status of type {http://api.familysearch.org/familytree/v2}familyTreeStatus.");
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
    && xmlStrcmp(BAD_CAST "personas", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}personas"
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
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    __child = [FSFAMILYTREEV2Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}persona of type {http://api.familysearch.org/familytree/v2}person.");
#endif

    if ([self personas]) {
      [self setPersonas: [[self personas] arrayByAddingObject: __child]];
    }
    else {
      [self setPersonas: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}personas...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}personas"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPersonas: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "properties", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}properties...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}properties"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}property of type {http://api.familysearch.org/familytree/v2}familyTreeProperty.");
#endif

    __child = [FSFAMILYTREEV2FamilyTreeProperty readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}property of type {http://api.familysearch.org/familytree/v2}familyTreeProperty.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}properties...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}properties"
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
    && xmlStrcmp(BAD_CAST "users", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}users...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}users"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}user of type {http://api.familysearch.org/familytree/v2}user.");
#endif

    __child = [FSFAMILYTREEV2User readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}user of type {http://api.familysearch.org/familytree/v2}user.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}users...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}users"
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
    && xmlStrcmp(BAD_CAST "searches", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}searches of type {http://api.familysearch.org/familytree/v2}searchResults.");
#endif

    __child = [FSFAMILYTREEV2SearchResults readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}searches of type {http://api.familysearch.org/familytree/v2}searchResults.");
#endif

    if ([self searches]) {
      [self setSearches: [[self searches] arrayByAddingObject: __child]];
    }
    else {
      [self setSearches: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "matches", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}matches of type {http://api.familysearch.org/familytree/v2}matchResults.");
#endif

    __child = [FSFAMILYTREEV2MatchResults readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}matches of type {http://api.familysearch.org/familytree/v2}matchResults.");
#endif

    if ([self matches]) {
      [self setMatches: [[self matches] arrayByAddingObject: __child]];
    }
    else {
      [self setMatches: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "contributors", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
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
    && xmlStrcmp(BAD_CAST "contributor", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributor.");
#endif

    __child = [FSFAMILYTREEV2Contributor readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}contributor of type {http://api.familysearch.org/familytree/v2}contributor.");
#endif

    if ([self contributors]) {
      [self setContributors: [[self contributors] arrayByAddingObject: __child]];
    }
    else {
      [self setContributors: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}contributors...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}contributors"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setContributors: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "pedigrees", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}pedigrees...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}pedigrees"
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
    && xmlStrcmp(BAD_CAST "pedigree", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}pedigree of type {http://api.familysearch.org/familytree/v2}pedigree.");
#endif

    __child = [FSFAMILYTREEV2Pedigree readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}pedigree of type {http://api.familysearch.org/familytree/v2}pedigree.");
#endif

    if ([self pedigrees]) {
      [self setPedigrees: [[self pedigrees] arrayByAddingObject: __child]];
    }
    else {
      [self setPedigrees: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}pedigrees...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}pedigrees"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPedigrees: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "notes", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}notes...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}notes"
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
    && xmlStrcmp(BAD_CAST "note", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}note of type {http://api.familysearch.org/familytree/v2}note.");
#endif

    __child = [FSFAMILYTREEV2Note readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}note of type {http://api.familysearch.org/familytree/v2}note.");
#endif

    if ([self notes]) {
      [self setNotes: [[self notes] arrayByAddingObject: __child]];
    }
    else {
      [self setNotes: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}notes...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}notes"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setNotes: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "citations", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/familytree/v2}citations...");
#endif
      //start wrapper element "{http://api.familysearch.org/familytree/v2}citations"
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
    && xmlStrcmp(BAD_CAST "citation", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/familytree/v2", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/familytree/v2}citation of type {http://api.familysearch.org/familytree/v2}citation.");
#endif

    __child = [FSFAMILYTREEV2Citation readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/familytree/v2}citation of type {http://api.familysearch.org/familytree/v2}citation.");
#endif

    if ([self citations]) {
      [self setCitations: [[self citations] arrayByAddingObject: __child]];
    }
    else {
      [self setCitations: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/familytree/v2}citations...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/familytree/v2}citations"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setCitations: (NSArray*) __child];
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

  if ([self persons]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}persons."];
    }
    __enumerator = [[self persons] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "person", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}person."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}person...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}person...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}person."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}persons."];
    }
  }
  if ([self status]) {
    __enumerator = [[self status] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "status", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}status."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}status...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}status...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}status."];
      }
    } //end item iterator.
  }
  if ([self personas]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "personas", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
    __enumerator = [[self personas] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "persona", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}persona."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}persona...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}persona...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}persona."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}personas."];
    }
  }
  if ([self properties]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "properties", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}properties."];
    }
    __enumerator = [[self properties] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "property", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}property."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}property...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}property...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}property."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}properties."];
    }
  }
  if ([self users]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "users", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}users."];
    }
    __enumerator = [[self users] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "user", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}user."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}user...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}user...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}user."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}users."];
    }
  }
  if ([self searches]) {
    __enumerator = [[self searches] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "searches", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}searches."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}searches...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}searches...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}searches."];
      }
    } //end item iterator.
  }
  if ([self matches]) {
    __enumerator = [[self matches] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "matches", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}matches."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}matches...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}matches...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}matches."];
      }
    } //end item iterator.
  }
  if ([self contributors]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributors", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
    __enumerator = [[self contributors] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "contributor", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}contributor."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}contributor...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}contributor...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}contributor."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}contributors."];
    }
  }
  if ([self pedigrees]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "pedigrees", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}pedigrees."];
    }
    __enumerator = [[self pedigrees] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "pedigree", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}pedigree."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}pedigree...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}pedigree...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}pedigree."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}pedigrees."];
    }
  }
  if ([self notes]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "notes", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}notes."];
    }
    __enumerator = [[self notes] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "note", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}note."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}note...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}note...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}note."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}notes."];
    }
  }
  if ([self citations]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "citations", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/familytree/v2}citations."];
    }
    __enumerator = [[self citations] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "familytree_v2", BAD_CAST "citation", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/familytree/v2}citation."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/familytree/v2}citation...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/familytree/v2}citation...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/familytree/v2}citation."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/familytree/v2}citations."];
    }
  }
}
@end /* implementation FSFAMILYTREEV2FamilyTree (JAXB) */
