#import "reservation.h"

/**
 *  A collection of cards from the temple.

 @author Duane Kuehne

 */
@implementation FSRESERVATIONV1Cards

/**
 * The cards.
 */
- (NSArray *) cardItems
{
  return _cardItems;
}

/**
 * The cards.
 */
- (void) setCardItems: (NSArray *) newCardItems
{
  [newCardItems retain];
  [_cardItems release];
  _cardItems = newCardItems;
}

- (void) dealloc
{
  [self setCardItems: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Cards */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Cards (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Cards (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Cards (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Cards from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Cards defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Cards *_fSRESERVATIONV1Cards = [[FSRESERVATIONV1Cards alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Cards initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Cards dealloc];
    _fSRESERVATIONV1Cards = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Cards autorelease];
  return _fSRESERVATIONV1Cards;
}

/**
 * Initialize this instance of FSRESERVATIONV1Cards according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Cards to the writer.
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
    && xmlStrcmp(BAD_CAST "card", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}card.");
#endif

    __child = [FSRESERVATIONV1Card readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}card.");
#endif

    if ([self cardItems]) {
      [self setCardItems: [[self cardItems] arrayByAddingObject: __child]];
    }
    else {
      [self setCardItems: [NSArray arrayWithObject: __child]];
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

  if ([self cardItems]) {
    __enumerator = [[self cardItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "card", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}card."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}card...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}card...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}card."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1Cards (JAXB) */

/**
 *  A date.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1DateData

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
- (FSRESERVATIONV1DateAstro *) astro
{
  return _astro;
}

/**
 * The astro date.
 */
- (void) setAstro: (FSRESERVATIONV1DateAstro *) newAstro
{
  [newAstro retain];
  [_astro release];
  _astro = newAstro;
}

- (void) dealloc
{
  [self setOriginal: nil];
  [self setNormalized: nil];
  [self setAstro: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1DateData */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1DateData (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1DateData (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1DateData (JAXB)

/**
 * Read an instance of FSRESERVATIONV1DateData from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1DateData defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1DateData *_fSRESERVATIONV1DateData = [[FSRESERVATIONV1DateData alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1DateData initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1DateData dealloc];
    _fSRESERVATIONV1DateData = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1DateData autorelease];
  return _fSRESERVATIONV1DateData;
}

/**
 * Initialize this instance of FSRESERVATIONV1DateData according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1DateData to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setOriginal: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setNormalized: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "astro", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}astro of type {http://api.familysearch.org/reservation/v1}dateAstro.");
#endif
    __child = [FSRESERVATIONV1DateAstro readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}astro of type {http://api.familysearch.org/reservation/v1}dateAstro.");
#endif

    [self setAstro: __child];
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

  if ([self original]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}original...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}original."];
    }
  }
  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}normalized."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}normalized...");
#endif
    [[self normalized] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}normalized...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}normalized."];
    }
  }
  if ([self astro]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "astro", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}astro."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}astro...");
#endif
    [[self astro] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}astro...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}astro."];
    }
  }
}
@end /* implementation FSRESERVATIONV1DateData (JAXB) */

/**
 *  An astro date.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1DateAstro

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
@end /* implementation FSRESERVATIONV1DateAstro */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1DateAstro (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1DateAstro (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1DateAstro (JAXB)

/**
 * Read an instance of FSRESERVATIONV1DateAstro from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1DateAstro defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1DateAstro *_fSRESERVATIONV1DateAstro = [[FSRESERVATIONV1DateAstro alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1DateAstro initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1DateAstro dealloc];
    _fSRESERVATIONV1DateAstro = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1DateAstro autorelease];
  return _fSRESERVATIONV1DateAstro;
}

/**
 * Initialize this instance of FSRESERVATIONV1DateAstro according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1DateAstro to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}earliest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}earliest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setEarliest: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "latest", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}latest of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}latest of type {http://www.w3.org/2001/XMLSchema}string.");
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "earliest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}earliest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}earliest...");
#endif
    [[self earliest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}earliest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}earliest."];
    }
  }
  if ([self latest]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "latest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}latest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}latest...");
#endif
    [[self latest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}latest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}latest."];
    }
  }
}
@end /* implementation FSRESERVATIONV1DateAstro (JAXB) */

/**
 *  a Reference to a Contributor.  This is currently used for the owner of a {@link Reservation}.

 @author PabstEC

 */
@implementation FSRESERVATIONV1ContributorReference

/**
 * the reference
 */
- (NSString *) ref
{
  return _ref;
}

/**
 * the reference
 */
- (void) setRef: (NSString *) newRef
{
  [newRef retain];
  [_ref release];
  _ref = newRef;
}

- (void) dealloc
{
  [self setRef: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1ContributorReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1ContributorReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1ContributorReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1ContributorReference (JAXB)

/**
 * Read an instance of FSRESERVATIONV1ContributorReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1ContributorReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1ContributorReference *_fSRESERVATIONV1ContributorReference = [[FSRESERVATIONV1ContributorReference alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1ContributorReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1ContributorReference dealloc];
    _fSRESERVATIONV1ContributorReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1ContributorReference autorelease];
  return _fSRESERVATIONV1ContributorReference;
}

/**
 * Initialize this instance of FSRESERVATIONV1ContributorReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1ContributorReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "ref", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}ref...");
#endif
    [self setRef: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}ref...");
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

  if ([self ref]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "ref", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}ref."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}ref...");
#endif
    [[self ref] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}ref...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}ref."];
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
@end /* implementation FSRESERVATIONV1ContributorReference (JAXB) */

/**
 *  A reference to an element from an error.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1ErrorReference

/**
 * The reference to the id of the element.
 */
- (NSString *) ref
{
  return _ref;
}

/**
 * The reference to the id of the element.
 */
- (void) setRef: (NSString *) newRef
{
  [newRef retain];
  [_ref release];
  _ref = newRef;
}

/**
 * The temporary id that was supplied in the request.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * The temporary id that was supplied in the request.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

- (void) dealloc
{
  [self setRef: nil];
  [self setTempId: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1ErrorReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1ErrorReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1ErrorReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1ErrorReference (JAXB)

/**
 * Read an instance of FSRESERVATIONV1ErrorReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1ErrorReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1ErrorReference *_fSRESERVATIONV1ErrorReference = [[FSRESERVATIONV1ErrorReference alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1ErrorReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1ErrorReference dealloc];
    _fSRESERVATIONV1ErrorReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1ErrorReference autorelease];
  return _fSRESERVATIONV1ErrorReference;
}

/**
 * Initialize this instance of FSRESERVATIONV1ErrorReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1ErrorReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "ref", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}ref...");
#endif
    [self setRef: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}ref...");
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

  if ([self ref]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "ref", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}ref."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}ref...");
#endif
    [[self ref] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}ref...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}ref."];
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

}
@end /* implementation FSRESERVATIONV1ErrorReference (JAXB) */

/**
 *  An event.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1Event

/**
 * the scope of the event.
 */
- (enum FSRESERVATIONV1Scope *) scope
{
  return _scope;
}

/**
 * the scope of the event.
 */
- (void) setScope: (enum FSRESERVATIONV1Scope *) newScope
{
  if (_scope != NULL) {
    free(_scope);
  }
  _scope = newScope;
}

/**
 * The type of the event.
 */
- (enum FSRESERVATIONV1EventType *) type
{
  return _type;
}

/**
 * The type of the event.
 */
- (void) setType: (enum FSRESERVATIONV1EventType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The date the assertion occurred.
 */
- (FSRESERVATIONV1DateData *) date
{
  return _date;
}

/**
 * The date the assertion occurred.
 */
- (void) setDate: (FSRESERVATIONV1DateData *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * The place the assertion occurred.
 */
- (FSRESERVATIONV1Place *) place
{
  return _place;
}

/**
 * The place the assertion occurred.
 */
- (void) setPlace: (FSRESERVATIONV1Place *) newPlace
{
  [newPlace retain];
  [_place release];
  _place = newPlace;
}

- (void) dealloc
{
  [self setScope: NULL];
  [self setType: NULL];
  [self setDate: nil];
  [self setPlace: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Event */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Event (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Event (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Event (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Event from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Event defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Event *_fSRESERVATIONV1Event = [[FSRESERVATIONV1Event alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Event initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Event dealloc];
    _fSRESERVATIONV1Event = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Event autorelease];
  return _fSRESERVATIONV1Event;
}

/**
 * Initialize this instance of FSRESERVATIONV1Event according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Event to the writer.
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

  if ((xmlStrcmp(BAD_CAST "scope", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}scope...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1ScopeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}scope."];
    }
    [self setScope: ((enum FSRESERVATIONV1Scope*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}scope...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1EventTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSRESERVATIONV1EventType*) _child_accessor)];
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
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}date of type {http://api.familysearch.org/reservation/v1}date.");
#endif
    __child = [FSRESERVATIONV1DateData readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}date of type {http://api.familysearch.org/reservation/v1}date.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}place of type {http://api.familysearch.org/reservation/v1}place.");
#endif
    __child = [FSRESERVATIONV1Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}place of type {http://api.familysearch.org/reservation/v1}place.");
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

  if ([self scope] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "scope", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}scope."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}scope...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1ScopeType(writer, [self scope]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}scope."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}scope...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}scope."];
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
    status = xmlTextWriterWriteFSRESERVATIONV1EventTypeType(writer, [self type]);
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

  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}date."];
    }
  }
  if ([self place]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "place", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}place."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}place...");
#endif
    [[self place] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}place...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}place."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Event (JAXB) */

/**
 *  Holds all ordinance status information for a parent group and the children that are part of that parent group.

 @author Sreenivas Boralingiah

 */
@implementation FSRESERVATIONV1Family

/**
 * (no documentation provided)
 */
- (enum FSRESERVATIONV1RollupStatus *) status
{
  return _status;
}

/**
 * (no documentation provided)
 */
- (void) setStatus: (enum FSRESERVATIONV1RollupStatus *) newStatus
{
  if (_status != NULL) {
    free(_status);
  }
  _status = newStatus;
}

/**
 * (no documentation provided)
 */
- (BOOL *) readyForTrip
{
  return _readyForTrip;
}

/**
 * (no documentation provided)
 */
- (void) setReadyForTrip: (BOOL *) newReadyForTrip
{
  if (_readyForTrip != NULL) {
    free(_readyForTrip);
  }
  _readyForTrip = newReadyForTrip;
}

/**
 * the version
 */
- (NSString *) version
{
  return _version;
}

/**
 * the version
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
- (NSArray *) children
{
  return _children;
}

/**
 * (no documentation provided)
 */
- (void) setChildren: (NSArray *) newChildren
{
  [newChildren retain];
  [_children release];
  _children = newChildren;
}

- (void) dealloc
{
  [self setStatus: NULL];
  [self setReadyForTrip: NULL];
  [self setVersion: nil];
  [self setParents: nil];
  [self setChildren: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Family */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Family (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Family (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Family (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Family from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Family defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Family *_fSRESERVATIONV1Family = [[FSRESERVATIONV1Family alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Family initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Family dealloc];
    _fSRESERVATIONV1Family = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Family autorelease];
  return _fSRESERVATIONV1Family;
}

/**
 * Initialize this instance of FSRESERVATIONV1Family according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Family to the writer.
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

  if ((xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}status...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1RollupStatusType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}status."];
    }
    [self setStatus: ((enum FSRESERVATIONV1RollupStatus*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}status...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "readyForTrip", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}readyForTrip...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}readyForTrip."];
    }
    [self setReadyForTrip: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}readyForTrip...");
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
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}parents...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}parents"
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
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    __child = [FSRESERVATIONV1Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}person.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}parents...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}parents"
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
    && xmlStrcmp(BAD_CAST "children", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}children...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}children"
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
    && xmlStrcmp(BAD_CAST "child", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}child of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    __child = [FSRESERVATIONV1Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}child of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    if ([self children]) {
      [self setChildren: [[self children] arrayByAddingObject: __child]];
    }
    else {
      [self setChildren: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}children...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}children"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setChildren: (NSArray*) __child];
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

  if ([self status] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "status", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}status."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}status...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1RollupStatusType(writer, [self status]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}status."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}status...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}status."];
    }
  }
  if ([self readyForTrip] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "readyForTrip", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}readyForTrip."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}readyForTrip...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self readyForTrip]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}readyForTrip."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}readyForTrip...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}readyForTrip."];
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

  if ([self parents]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "parents", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}parents."];
    }
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}parent."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}parents."];
    }
  }
  if ([self children]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "children", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}children."];
    }
    __enumerator = [[self children] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "child", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}child."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}child...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}child...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}child."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}children."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Family (JAXB) */

/**
 *  Created by IntelliJ IDEA. User: boralingiahsr Date: Jan 10, 2008 Time: 11:38:44 AM To change this template use File | Settings | File Templates.

 */
@implementation FSRESERVATIONV1Inventory

/**
 * (no documentation provided)
 */
- (enum FSRESERVATIONV1InventoryType *) type
{
  return _type;
}

/**
 * (no documentation provided)
 */
- (void) setType: (enum FSRESERVATIONV1InventoryType *) newType
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
@end /* implementation FSRESERVATIONV1Inventory */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Inventory (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Inventory (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Inventory (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Inventory from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Inventory defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Inventory *_fSRESERVATIONV1Inventory = [[FSRESERVATIONV1Inventory alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Inventory initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Inventory dealloc];
    _fSRESERVATIONV1Inventory = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Inventory autorelease];
  return _fSRESERVATIONV1Inventory;
}

/**
 * Initialize this instance of FSRESERVATIONV1Inventory according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Inventory to the writer.
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
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1InventoryTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSRESERVATIONV1InventoryType*) _child_accessor)];
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
    status = xmlTextWriterWriteFSRESERVATIONV1InventoryTypeType(writer, [self type]);
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

}
@end /* implementation FSRESERVATIONV1Inventory (JAXB) */

/**
 *  minimum qualification data for a person involved in an ordinance.

 @author PabstEC

 */
@implementation FSRESERVATIONV1MinimumQualification

/**
 * The person's qualifying name.
 */
- (FSRESERVATIONV1NameForm *) name
{
  return _name;
}

/**
 * The person's qualifying name.
 */
- (void) setName: (FSRESERVATIONV1NameForm *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

- (void) dealloc
{
  [self setName: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1MinimumQualification */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1MinimumQualification (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1MinimumQualification (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1MinimumQualification (JAXB)

/**
 * Read an instance of FSRESERVATIONV1MinimumQualification from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1MinimumQualification defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1MinimumQualification *_fSRESERVATIONV1MinimumQualification = [[FSRESERVATIONV1MinimumQualification alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1MinimumQualification initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1MinimumQualification dealloc];
    _fSRESERVATIONV1MinimumQualification = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1MinimumQualification autorelease];
  return _fSRESERVATIONV1MinimumQualification;
}

/**
 * Initialize this instance of FSRESERVATIONV1MinimumQualification according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1MinimumQualification to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}name of type {http://api.familysearch.org/reservation/v1}nameForm.");
#endif
    __child = [FSRESERVATIONV1NameForm readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}name of type {http://api.familysearch.org/reservation/v1}nameForm.");
#endif

    [self setName: __child];
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "name", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}name."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}name...");
#endif
    [[self name] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}name...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}name."];
    }
  }
}
@end /* implementation FSRESERVATIONV1MinimumQualification (JAXB) */

/**
 *  A name form.
 
 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1NameForm

/**
 * The name form script.
 */
- (enum FSRESERVATIONV1NameFormScript *) script
{
  return _script;
}

/**
 * The name form script.
 */
- (void) setScript: (enum FSRESERVATIONV1NameFormScript *) newScript
{
  if (_script != NULL) {
    free(_script);
  }
  _script = newScript;
}

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

- (void) dealloc
{
  [self setScript: NULL];
  [self setFullText: nil];
  [self setPieces: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1NameForm */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1NameForm (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1NameForm (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1NameForm (JAXB)

/**
 * Read an instance of FSRESERVATIONV1NameForm from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1NameForm defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1NameForm *_fSRESERVATIONV1NameForm = [[FSRESERVATIONV1NameForm alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1NameForm initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1NameForm dealloc];
    _fSRESERVATIONV1NameForm = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1NameForm autorelease];
  return _fSRESERVATIONV1NameForm;
}

/**
 * Initialize this instance of FSRESERVATIONV1NameForm according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1NameForm to the writer.
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

  if ((xmlStrcmp(BAD_CAST "script", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}script...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1NameFormScriptType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}script."];
    }
    [self setScript: ((enum FSRESERVATIONV1NameFormScript*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}script...");
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
    && xmlStrcmp(BAD_CAST "fullText", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}fullText of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}fullText of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setFullText: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "pieces", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}pieces...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}pieces"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}piece of type {http://api.familysearch.org/reservation/v1}namePiece.");
#endif

    __child = [FSRESERVATIONV1NamePiece readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}piece of type {http://api.familysearch.org/reservation/v1}namePiece.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}pieces...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}pieces"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPieces: (NSArray*) __child];
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

  if ([self script] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "script", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}script."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}script...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1NameFormScriptType(writer, [self script]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}script."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}script...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}script."];
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

  if ([self fullText]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "fullText", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}fullText."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}fullText...");
#endif
    [[self fullText] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}fullText...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}fullText."];
    }
  }
  if ([self pieces]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "pieces", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}pieces."];
    }
    __enumerator = [[self pieces] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "piece", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}piece."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}piece...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}piece...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}piece."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}pieces."];
    }
  }
}
@end /* implementation FSRESERVATIONV1NameForm (JAXB) */

/**
 *  A piece of a name.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1NamePiece

/**
 * The type of the name piece.
 */
- (enum FSRESERVATIONV1NamePieceType *) type
{
  return _type;
}

/**
 * The type of the name piece.
 */
- (void) setType: (enum FSRESERVATIONV1NamePieceType *) newType
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
@end /* implementation FSRESERVATIONV1NamePiece */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1NamePiece (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1NamePiece (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1NamePiece (JAXB)

/**
 * Read an instance of FSRESERVATIONV1NamePiece from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1NamePiece defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1NamePiece *_fSRESERVATIONV1NamePiece = [[FSRESERVATIONV1NamePiece alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1NamePiece initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1NamePiece dealloc];
    _fSRESERVATIONV1NamePiece = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1NamePiece autorelease];
  return _fSRESERVATIONV1NamePiece;
}

/**
 * Initialize this instance of FSRESERVATIONV1NamePiece according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1NamePiece to the writer.
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
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1NamePieceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSRESERVATIONV1NamePieceType*) _child_accessor)];
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPredelimiters: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setValue: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "postdelimiters", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
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
    status = xmlTextWriterWriteFSRESERVATIONV1NamePieceTypeType(writer, [self type]);
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "predelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}predelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}predelimiters...");
#endif
    [[self predelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}predelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}predelimiters."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}value."];
    }
  }
  if ([self postdelimiters]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "postdelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}postdelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}postdelimiters...");
#endif
    [[self postdelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}postdelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}postdelimiters."];
    }
  }
}
@end /* implementation FSRESERVATIONV1NamePiece (JAXB) */

/**
 *  An ordinance.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1Ordinance

/**
 * (no documentation provided)
 */
- (enum FSRESERVATIONV1OrdinanceStatus *) status
{
  return _status;
}

/**
 * (no documentation provided)
 */
- (void) setStatus: (enum FSRESERVATIONV1OrdinanceStatus *) newStatus
{
  if (_status != NULL) {
    free(_status);
  }
  _status = newStatus;
}

/**
 * (no documentation provided)
 */
- (BOOL *) reservable
{
  return _reservable;
}

/**
 * (no documentation provided)
 */
- (void) setReservable: (BOOL *) newReservable
{
  if (_reservable != NULL) {
    free(_reservable);
  }
  _reservable = newReservable;
}

/**
 * (no documentation provided)
 */
- (BOOL *) readyForTrip
{
  return _readyForTrip;
}

/**
 * (no documentation provided)
 */
- (void) setReadyForTrip: (BOOL *) newReadyForTrip
{
  if (_readyForTrip != NULL) {
    free(_readyForTrip);
  }
  _readyForTrip = newReadyForTrip;
}

/**
 * (no documentation provided)
 */
- (BOOL *) completed
{
  return _completed;
}

/**
 * (no documentation provided)
 */
- (void) setCompleted: (BOOL *) newCompleted
{
  if (_completed != NULL) {
    free(_completed);
  }
  _completed = newCompleted;
}

/**
 * Person(s) including the prerequisite Ordinance or null if readyForTrip is false
 */
- (NSArray *) prerequisitesForTrip
{
  return _prerequisitesForTrip;
}

/**
 * Person(s) including the prerequisite Ordinance or null if readyForTrip is false
 */
- (void) setPrerequisitesForTrip: (NSArray *) newPrerequisitesForTrip
{
  [newPrerequisitesForTrip retain];
  [_prerequisitesForTrip release];
  _prerequisitesForTrip = newPrerequisitesForTrip;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1Reservation *) reservation
{
  return _reservation;
}

/**
 * (no documentation provided)
 */
- (void) setReservation: (FSRESERVATIONV1Reservation *) newReservation
{
  [newReservation retain];
  [_reservation release];
  _reservation = newReservation;
}

/**
 * The BIC flag for a sealing to parents ordinance.
 */
- (BOOL *) bornInCovenant
{
  return _bornInCovenant;
}

/**
 * The BIC flag for a sealing to parents ordinance.
 */
- (void) setBornInCovenant: (BOOL *) newBornInCovenant
{
  if (_bornInCovenant != NULL) {
    free(_bornInCovenant);
  }
  _bornInCovenant = newBornInCovenant;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1DateData *) date
{
  return _date;
}

/**
 * (no documentation provided)
 */
- (void) setDate: (FSRESERVATIONV1DateData *) newDate
{
  [newDate retain];
  [_date release];
  _date = newDate;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1Place *) place
{
  return _place;
}

/**
 * (no documentation provided)
 */
- (void) setPlace: (FSRESERVATIONV1Place *) newPlace
{
  [newPlace retain];
  [_place release];
  _place = newPlace;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1Temple *) temple
{
  return _temple;
}

/**
 * (no documentation provided)
 */
- (void) setTemple: (FSRESERVATIONV1Temple *) newTemple
{
  [newTemple retain];
  [_temple release];
  _temple = newTemple;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1PersonReference *) spouse
{
  return _spouse;
}

/**
 * (no documentation provided)
 */
- (void) setSpouse: (FSRESERVATIONV1PersonReference *) newSpouse
{
  [newSpouse retain];
  [_spouse release];
  _spouse = newSpouse;
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

- (void) dealloc
{
  [self setStatus: NULL];
  [self setReservable: NULL];
  [self setReadyForTrip: NULL];
  [self setCompleted: NULL];
  [self setPrerequisitesForTrip: nil];
  [self setReservation: nil];
  [self setBornInCovenant: NULL];
  [self setDate: nil];
  [self setPlace: nil];
  [self setTemple: nil];
  [self setSpouse: nil];
  [self setParents: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Ordinance */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Ordinance (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Ordinance (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Ordinance (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Ordinance from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Ordinance defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Ordinance *_fSRESERVATIONV1Ordinance = [[FSRESERVATIONV1Ordinance alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Ordinance initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Ordinance dealloc];
    _fSRESERVATIONV1Ordinance = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Ordinance autorelease];
  return _fSRESERVATIONV1Ordinance;
}

/**
 * Initialize this instance of FSRESERVATIONV1Ordinance according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Ordinance to the writer.
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

  if ((xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}status...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1OrdinanceStatusType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}status."];
    }
    [self setStatus: ((enum FSRESERVATIONV1OrdinanceStatus*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}status...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "reservable", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}reservable...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}reservable."];
    }
    [self setReservable: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}reservable...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "readyForTrip", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}readyForTrip...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}readyForTrip."];
    }
    [self setReadyForTrip: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}readyForTrip...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "completed", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}completed...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}completed."];
    }
    [self setCompleted: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}completed...");
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
    && xmlStrcmp(BAD_CAST "prerequisitesForTrip", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}prerequisitesForTrip...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}prerequisitesForTrip"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    __child = [FSRESERVATIONV1Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    if ([self prerequisitesForTrip]) {
      [self setPrerequisitesForTrip: [[self prerequisitesForTrip] arrayByAddingObject: __child]];
    }
    else {
      [self setPrerequisitesForTrip: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}prerequisitesForTrip...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}prerequisitesForTrip"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setPrerequisitesForTrip: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "reservation", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}reservation of type {http://api.familysearch.org/reservation/v1}reservation.");
#endif
    __child = [FSRESERVATIONV1Reservation readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}reservation of type {http://api.familysearch.org/reservation/v1}reservation.");
#endif

    [self setReservation: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "bornInCovenant", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setBornInCovenant: ((BOOL*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}date of type {http://api.familysearch.org/reservation/v1}date.");
#endif
    __child = [FSRESERVATIONV1DateData readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}date of type {http://api.familysearch.org/reservation/v1}date.");
#endif

    [self setDate: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}place of type {http://api.familysearch.org/reservation/v1}place.");
#endif
    __child = [FSRESERVATIONV1Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}place of type {http://api.familysearch.org/reservation/v1}place.");
#endif

    [self setPlace: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "temple", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}temple of type {http://api.familysearch.org/reservation/v1}temple.");
#endif
    __child = [FSRESERVATIONV1Temple readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}temple of type {http://api.familysearch.org/reservation/v1}temple.");
#endif

    [self setTemple: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "spouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}spouse of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif
    __child = [FSRESERVATIONV1PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}spouse of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif

    [self setSpouse: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif

    __child = [FSRESERVATIONV1PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}personReference.");
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

  if ([self status] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "status", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}status."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}status...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1OrdinanceStatusType(writer, [self status]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}status."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}status...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}status."];
    }
  }
  if ([self reservable] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "reservable", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}reservable."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}reservable...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self reservable]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}reservable."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}reservable...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}reservable."];
    }
  }
  if ([self readyForTrip] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "readyForTrip", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}readyForTrip."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}readyForTrip...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self readyForTrip]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}readyForTrip."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}readyForTrip...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}readyForTrip."];
    }
  }
  if ([self completed] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "completed", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}completed."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}completed...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self completed]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}completed."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}completed...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}completed."];
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

  if ([self prerequisitesForTrip]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "prerequisitesForTrip", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}prerequisitesForTrip."];
    }
    __enumerator = [[self prerequisitesForTrip] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "person", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}person."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}person...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}person...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}person."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}prerequisitesForTrip."];
    }
  }
  if ([self reservation]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "reservation", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}reservation."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}reservation...");
#endif
    [[self reservation] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}reservation...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}reservation."];
    }
  }
  if ([self bornInCovenant] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "bornInCovenant", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}bornInCovenant...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self bornInCovenant]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}bornInCovenant...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }
  }
  if ([self date]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "date", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}date."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}date...");
#endif
    [[self date] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}date...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}date."];
    }
  }
  if ([self place]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "place", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}place."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}place...");
#endif
    [[self place] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}place...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}place."];
    }
  }
  if ([self temple]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "temple", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}temple."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}temple...");
#endif
    [[self temple] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}temple...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}temple."];
    }
  }
  if ([self spouse]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "spouse", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}spouse."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}spouse...");
#endif
    [[self spouse] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}spouse...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}spouse."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}parent."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1Ordinance (JAXB) */

/**
 *  Reference to a specific ordinance.
 
 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1OrdinanceReference

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1PersonReference *) spouse
{
  return _spouse;
}

/**
 * (no documentation provided)
 */
- (void) setSpouse: (FSRESERVATIONV1PersonReference *) newSpouse
{
  [newSpouse retain];
  [_spouse release];
  _spouse = newSpouse;
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

- (void) dealloc
{
  [self setSpouse: nil];
  [self setParents: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1OrdinanceReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1OrdinanceReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1OrdinanceReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1OrdinanceReference (JAXB)

/**
 * Read an instance of FSRESERVATIONV1OrdinanceReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1OrdinanceReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1OrdinanceReference *_fSRESERVATIONV1OrdinanceReference = [[FSRESERVATIONV1OrdinanceReference alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1OrdinanceReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1OrdinanceReference dealloc];
    _fSRESERVATIONV1OrdinanceReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1OrdinanceReference autorelease];
  return _fSRESERVATIONV1OrdinanceReference;
}

/**
 * Initialize this instance of FSRESERVATIONV1OrdinanceReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1OrdinanceReference to the writer.
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
    && xmlStrcmp(BAD_CAST "spouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}spouse of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif
    __child = [FSRESERVATIONV1PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}spouse of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif

    [self setSpouse: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parent", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}personReference.");
#endif

    __child = [FSRESERVATIONV1PersonReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}parent of type {http://api.familysearch.org/reservation/v1}personReference.");
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

  if ([self spouse]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "spouse", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}spouse."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}spouse...");
#endif
    [[self spouse] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}spouse...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}spouse."];
    }
  }
  if ([self parents]) {
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "parent", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}parent."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}parent...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}parent...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}parent."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1OrdinanceReference (JAXB) */

/**
 *  A reservation person.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1Person

/**
 * The person status.
 */
- (enum FSRESERVATIONV1RollupStatus *) status
{
  return _status;
}

/**
 * The person status.
 */
- (void) setStatus: (enum FSRESERVATIONV1RollupStatus *) newStatus
{
  if (_status != NULL) {
    free(_status);
  }
  _status = newStatus;
}

/**
 * The person is ready to be added to a temple trip
 */
- (BOOL *) readyForTrip
{
  return _readyForTrip;
}

/**
 * The person is ready to be added to a temple trip
 */
- (void) setReadyForTrip: (BOOL *) newReadyForTrip
{
  if (_readyForTrip != NULL) {
    free(_readyForTrip);
  }
  _readyForTrip = newReadyForTrip;
}

/**
 * the version
 */
- (NSString *) version
{
  return _version;
}

/**
 * the version
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * The person id.
 */
- (NSString *) ref
{
  return _ref;
}

/**
 * The person id.
 */
- (void) setRef: (NSString *) newRef
{
  [newRef retain];
  [_ref release];
  _ref = newRef;
}

/**
 * the action to perform on this person
 */
- (NSString *) action
{
  return _action;
}

/**
 * the action to perform on this person
 */
- (void) setAction: (NSString *) newAction
{
  [newAction retain];
  [_action release];
  _action = newAction;
}

/**
 * The role as a parent (if applicable).
 */
- (enum FSRESERVATIONV1ParentRole *) role
{
  return _role;
}

/**
 * The role as a parent (if applicable).
 */
- (void) setRole: (enum FSRESERVATIONV1ParentRole *) newRole
{
  if (_role != NULL) {
    free(_role);
  }
  _role = newRole;
}

/**
 * The requested id.
 */
- (NSString *) requestedRef
{
  return _requestedRef;
}

/**
 * The requested id.
 */
- (void) setRequestedRef: (NSString *) newRequestedRef
{
  [newRequestedRef retain];
  [_requestedRef release];
  _requestedRef = newRequestedRef;
}

/**
 * The temp id.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * The temp id.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The ordinance qualification data for the person.
 */
- (FSRESERVATIONV1Qualification *) qualification
{
  return _qualification;
}

/**
 * The ordinance qualification data for the person.
 */
- (void) setQualification: (FSRESERVATIONV1Qualification *) newQualification
{
  [newQualification retain];
  [_qualification release];
  _qualification = newQualification;
}

/**
 * The person BIC flag.
 */
- (BOOL *) bornInCovenant
{
  return _bornInCovenant;
}

/**
 * The person BIC flag.
 */
- (void) setBornInCovenant: (BOOL *) newBornInCovenant
{
  if (_bornInCovenant != NULL) {
    free(_bornInCovenant);
  }
  _bornInCovenant = newBornInCovenant;
}

/**
 * The baptism ordinance.
 */
- (FSRESERVATIONV1Ordinance *) baptism
{
  return _baptism;
}

/**
 * The baptism ordinance.
 */
- (void) setBaptism: (FSRESERVATIONV1Ordinance *) newBaptism
{
  [newBaptism retain];
  [_baptism release];
  _baptism = newBaptism;
}

/**
 * The confirmation ordinance.
 */
- (FSRESERVATIONV1Ordinance *) confirmation
{
  return _confirmation;
}

/**
 * The confirmation ordinance.
 */
- (void) setConfirmation: (FSRESERVATIONV1Ordinance *) newConfirmation
{
  [newConfirmation retain];
  [_confirmation release];
  _confirmation = newConfirmation;
}

/**
 * The initiatory ordinance.
 */
- (FSRESERVATIONV1Ordinance *) initiatory
{
  return _initiatory;
}

/**
 * The initiatory ordinance.
 */
- (void) setInitiatory: (FSRESERVATIONV1Ordinance *) newInitiatory
{
  [newInitiatory retain];
  [_initiatory release];
  _initiatory = newInitiatory;
}

/**
 * The endowment ordinance.
 */
- (FSRESERVATIONV1Ordinance *) endowment
{
  return _endowment;
}

/**
 * The endowment ordinance.
 */
- (void) setEndowment: (FSRESERVATIONV1Ordinance *) newEndowment
{
  [newEndowment retain];
  [_endowment release];
  _endowment = newEndowment;
}

/**
 * The sealing to parents ordinances.
 */
- (NSArray *) sealingToParentsOrdinances
{
  return _sealingToParentsOrdinances;
}

/**
 * The sealing to parents ordinances.
 */
- (void) setSealingToParentsOrdinances: (NSArray *) newSealingToParentsOrdinances
{
  [newSealingToParentsOrdinances retain];
  [_sealingToParentsOrdinances release];
  _sealingToParentsOrdinances = newSealingToParentsOrdinances;
}

/**
 * The sealing to spouse ordinances.
 */
- (NSArray *) sealingToSpouseOrdinances
{
  return _sealingToSpouseOrdinances;
}

/**
 * The sealing to spouse ordinances.
 */
- (void) setSealingToSpouseOrdinances: (NSArray *) newSealingToSpouseOrdinances
{
  [newSealingToSpouseOrdinances retain];
  [_sealingToSpouseOrdinances release];
  _sealingToSpouseOrdinances = newSealingToSpouseOrdinances;
}

/**
 * The sealing to spouse ordinances.
 */
- (FSRESERVATIONV1UserNotifications *) userNotifications
{
  return _userNotifications;
}

/**
 * The sealing to spouse ordinances.
 */
- (void) setUserNotifications: (FSRESERVATIONV1UserNotifications *) newUserNotifications
{
  [newUserNotifications retain];
  [_userNotifications release];
  _userNotifications = newUserNotifications;
}

- (void) dealloc
{
  [self setStatus: NULL];
  [self setReadyForTrip: NULL];
  [self setVersion: nil];
  [self setRef: nil];
  [self setAction: nil];
  [self setRole: NULL];
  [self setRequestedRef: nil];
  [self setTempId: nil];
  [self setQualification: nil];
  [self setBornInCovenant: NULL];
  [self setBaptism: nil];
  [self setConfirmation: nil];
  [self setInitiatory: nil];
  [self setEndowment: nil];
  [self setSealingToParentsOrdinances: nil];
  [self setSealingToSpouseOrdinances: nil];
  [self setUserNotifications: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Person */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Person (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Person (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Person (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Person from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Person defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Person *_fSRESERVATIONV1Person = [[FSRESERVATIONV1Person alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Person initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Person dealloc];
    _fSRESERVATIONV1Person = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Person autorelease];
  return _fSRESERVATIONV1Person;
}

/**
 * Initialize this instance of FSRESERVATIONV1Person according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Person to the writer.
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

  if ((xmlStrcmp(BAD_CAST "status", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}status...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1RollupStatusType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}status."];
    }
    [self setStatus: ((enum FSRESERVATIONV1RollupStatus*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}status...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "readyForTrip", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}readyForTrip...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}readyForTrip."];
    }
    [self setReadyForTrip: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}readyForTrip...");
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

  if ((xmlStrcmp(BAD_CAST "ref", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}ref...");
#endif
    [self setRef: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}ref...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "action", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}action...");
#endif
    [self setAction: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}action...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "role", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}role...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1ParentRoleType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}role."];
    }
    [self setRole: ((enum FSRESERVATIONV1ParentRole*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}role...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "requestedRef", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requestedRef...");
#endif
    [self setRequestedRef: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requestedRef...");
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
    && xmlStrcmp(BAD_CAST "qualification", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}qualification of type {http://api.familysearch.org/reservation/v1}qualification.");
#endif
    __child = [FSRESERVATIONV1Qualification readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}qualification of type {http://api.familysearch.org/reservation/v1}qualification.");
#endif

    [self setQualification: __child];
    return YES;
  } //end "if choice"


  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "bornInCovenant", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setBornInCovenant: ((BOOL*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "baptism", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}baptism of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif
    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}baptism of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    [self setBaptism: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "confirmation", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}confirmation of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif
    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}confirmation of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    [self setConfirmation: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "initiatory", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}initiatory of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif
    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}initiatory of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    [self setInitiatory: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "endowment", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}endowment of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif
    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}endowment of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    [self setEndowment: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "sealingToParents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}sealingToParents of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}sealingToParents of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    if ([self sealingToParentsOrdinances]) {
      [self setSealingToParentsOrdinances: [[self sealingToParentsOrdinances] arrayByAddingObject: __child]];
    }
    else {
      [self setSealingToParentsOrdinances: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "sealingToSpouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}sealingToSpouse of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    __child = [FSRESERVATIONV1Ordinance readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}sealingToSpouse of type {http://api.familysearch.org/reservation/v1}ordinance.");
#endif

    if ([self sealingToSpouseOrdinances]) {
      [self setSealingToSpouseOrdinances: [[self sealingToSpouseOrdinances] arrayByAddingObject: __child]];
    }
    else {
      [self setSealingToSpouseOrdinances: [NSArray arrayWithObject: __child]];
    }
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "userNotifications", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}userNotifications of type {http://api.familysearch.org/reservation/v1}userNotifications.");
#endif
    __child = [FSRESERVATIONV1UserNotifications readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}userNotifications of type {http://api.familysearch.org/reservation/v1}userNotifications.");
#endif

    [self setUserNotifications: __child];
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

  if ([self status] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "status", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}status."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}status...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1RollupStatusType(writer, [self status]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}status."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}status...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}status."];
    }
  }
  if ([self readyForTrip] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "readyForTrip", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}readyForTrip."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}readyForTrip...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self readyForTrip]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}readyForTrip."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}readyForTrip...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}readyForTrip."];
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
  if ([self ref]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "ref", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}ref."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}ref...");
#endif
    [[self ref] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}ref...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}ref."];
    }
  }
  if ([self action]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "action", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}action."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}action...");
#endif
    [[self action] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}action...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}action."];
    }
  }
  if ([self role] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "role", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}role."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}role...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1ParentRoleType(writer, [self role]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}role."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}role...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}role."];
    }
  }
  if ([self requestedRef]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requestedRef", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requestedRef."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requestedRef...");
#endif
    [[self requestedRef] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requestedRef...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requestedRef."];
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

  if ([self qualification]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "qualification", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}qualification."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}qualification...");
#endif
    [[self qualification] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}qualification...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}qualification."];
    }
  }
  if ([self bornInCovenant] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "bornInCovenant", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}bornInCovenant...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self bornInCovenant]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}bornInCovenant...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}bornInCovenant."];
    }
  }
  if ([self baptism]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "baptism", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}baptism."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}baptism...");
#endif
    [[self baptism] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}baptism...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}baptism."];
    }
  }
  if ([self confirmation]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "confirmation", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}confirmation."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}confirmation...");
#endif
    [[self confirmation] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}confirmation...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}confirmation."];
    }
  }
  if ([self initiatory]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "initiatory", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}initiatory."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}initiatory...");
#endif
    [[self initiatory] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}initiatory...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}initiatory."];
    }
  }
  if ([self endowment]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "endowment", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}endowment."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}endowment...");
#endif
    [[self endowment] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}endowment...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}endowment."];
    }
  }
  if ([self sealingToParentsOrdinances]) {
    __enumerator = [[self sealingToParentsOrdinances] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "sealingToParents", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}sealingToParents."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}sealingToParents...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}sealingToParents...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}sealingToParents."];
      }
    } //end item iterator.
  }
  if ([self sealingToSpouseOrdinances]) {
    __enumerator = [[self sealingToSpouseOrdinances] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "sealingToSpouse", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}sealingToSpouse."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}sealingToSpouse...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}sealingToSpouse...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}sealingToSpouse."];
      }
    } //end item iterator.
  }
  if ([self userNotifications]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "userNotifications", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}userNotifications."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}userNotifications...");
#endif
    [[self userNotifications] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}userNotifications...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}userNotifications."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Person (JAXB) */

/**
 *  A reservation persona

 @author Tim Adair (timadair@ldschurch.org) Date: Mar 9, 2009 Time: 11:25:43 AM

 */
@implementation FSRESERVATIONV1Persona

/**
 * The id of the persona.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the persona.
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
@end /* implementation FSRESERVATIONV1Persona */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Persona (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Persona (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Persona (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Persona from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Persona defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Persona *_fSRESERVATIONV1Persona = [[FSRESERVATIONV1Persona alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Persona initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Persona dealloc];
    _fSRESERVATIONV1Persona = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Persona autorelease];
  return _fSRESERVATIONV1Persona;
}

/**
 * Initialize this instance of FSRESERVATIONV1Persona according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Persona to the writer.
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
@end /* implementation FSRESERVATIONV1Persona (JAXB) */

/**
 *  A place.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1Place

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
- (FSRESERVATIONV1NormalizedPlace *) normalized
{
  return _normalized;
}

/**
 * The normalized form of the place.
 */
- (void) setNormalized: (FSRESERVATIONV1NormalizedPlace *) newNormalized
{
  [newNormalized retain];
  [_normalized release];
  _normalized = newNormalized;
}

- (void) dealloc
{
  [self setOriginal: nil];
  [self setNormalized: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Place */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Place (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Place (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Place (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Place from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Place defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Place *_fSRESERVATIONV1Place = [[FSRESERVATIONV1Place alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Place initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Place dealloc];
    _fSRESERVATIONV1Place = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Place autorelease];
  return _fSRESERVATIONV1Place;
}

/**
 * Initialize this instance of FSRESERVATIONV1Place according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Place to the writer.
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}original of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setOriginal: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}normalized of type {http://api.familysearch.org/reservation/v1}normalizedPlace.");
#endif
    __child = [FSRESERVATIONV1NormalizedPlace readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}normalized of type {http://api.familysearch.org/reservation/v1}normalizedPlace.");
#endif

    [self setNormalized: __child];
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

  if ([self original]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}original...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}original."];
    }
  }
  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}normalized."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}normalized...");
#endif
    [[self normalized] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}normalized...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}normalized."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Place (JAXB) */

/**
 *  An ordinance reservation.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1Reservation

/**
 * (no documentation provided)
 */
- (NSString *) modifiedDate
{
  return _modifiedDate;
}

/**
 * (no documentation provided)
 */
- (void) setModifiedDate: (NSString *) newModifiedDate
{
  [newModifiedDate retain];
  [_modifiedDate release];
  _modifiedDate = newModifiedDate;
}

/**
 * (no documentation provided)
 */
- (NSDate *) modified
{
  return _modified;
}

/**
 * (no documentation provided)
 */
- (void) setModified: (NSDate *) newModified
{
  [newModified retain];
  [_modified release];
  _modified = newModified;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1ContributorReference *) owner
{
  return _owner;
}

/**
 * (no documentation provided)
 */
- (void) setOwner: (FSRESERVATIONV1ContributorReference *) newOwner
{
  [newOwner retain];
  [_owner release];
  _owner = newOwner;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1Inventory *) inventory
{
  return _inventory;
}

/**
 * (no documentation provided)
 */
- (void) setInventory: (FSRESERVATIONV1Inventory *) newInventory
{
  [newInventory retain];
  [_inventory release];
  _inventory = newInventory;
}

/**
 * (no documentation provided)
 */
- (NSArray *) assignableInventories
{
  return _assignableInventories;
}

/**
 * (no documentation provided)
 */
- (void) setAssignableInventories: (NSArray *) newAssignableInventories
{
  [newAssignableInventories retain];
  [_assignableInventories release];
  _assignableInventories = newAssignableInventories;
}

- (void) dealloc
{
  [self setModifiedDate: nil];
  [self setModified: nil];
  [self setOwner: nil];
  [self setInventory: nil];
  [self setAssignableInventories: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Reservation */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Reservation (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Reservation (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Reservation (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Reservation from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Reservation defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Reservation *_fSRESERVATIONV1Reservation = [[FSRESERVATIONV1Reservation alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Reservation initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Reservation dealloc];
    _fSRESERVATIONV1Reservation = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Reservation autorelease];
  return _fSRESERVATIONV1Reservation;
}

/**
 * Initialize this instance of FSRESERVATIONV1Reservation according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Reservation to the writer.
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

  if ((xmlStrcmp(BAD_CAST "modifiedDate", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}modifiedDate...");
#endif
    [self setModifiedDate: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}modifiedDate...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "modified", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}modified...");
#endif
    [self setModified: (NSDate*) [NSDate readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}modified...");
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
    && xmlStrcmp(BAD_CAST "owner", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}owner of type {http://api.familysearch.org/reservation/v1}contributorReference.");
#endif
    __child = [FSRESERVATIONV1ContributorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}owner of type {http://api.familysearch.org/reservation/v1}contributorReference.");
#endif

    [self setOwner: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "inventory", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}inventory of type {http://api.familysearch.org/reservation/v1}inventory.");
#endif
    __child = [FSRESERVATIONV1Inventory readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}inventory of type {http://api.familysearch.org/reservation/v1}inventory.");
#endif

    [self setInventory: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "assignableInventories", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}assignableInventories...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}assignableInventories"
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
    && xmlStrcmp(BAD_CAST "inventory", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}inventory of type {http://api.familysearch.org/reservation/v1}inventory.");
#endif

    __child = [FSRESERVATIONV1Inventory readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}inventory of type {http://api.familysearch.org/reservation/v1}inventory.");
#endif

    if ([self assignableInventories]) {
      [self setAssignableInventories: [[self assignableInventories] arrayByAddingObject: __child]];
    }
    else {
      [self setAssignableInventories: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}assignableInventories...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}assignableInventories"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setAssignableInventories: (NSArray*) __child];
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

  if ([self modifiedDate]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "modifiedDate", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}modifiedDate."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}modifiedDate...");
#endif
    [[self modifiedDate] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}modifiedDate...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}modifiedDate."];
    }
  }
  if ([self modified]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "modified", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}modified."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}modified...");
#endif
    [[self modified] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}modified...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}modified."];
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

  if ([self owner]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "owner", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}owner."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}owner...");
#endif
    [[self owner] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}owner...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}owner."];
    }
  }
  if ([self inventory]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "inventory", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}inventory."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}inventory...");
#endif
    [[self inventory] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}inventory...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}inventory."];
    }
  }
  if ([self assignableInventories]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "assignableInventories", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}assignableInventories."];
    }
    __enumerator = [[self assignableInventories] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "inventory", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}inventory."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}inventory...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}inventory...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}inventory."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}assignableInventories."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Reservation (JAXB) */

/**
 *  A list of reservation persons.

 @author Rob Lyon

 */
@implementation FSRESERVATIONV1Persons

/**
 * the number of persons.
 */
- (int) count
{
  return _count;
}

/**
 * the number of persons.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * Value for property 'start'.
 */
- (NSString *) start
{
  return _start;
}

/**
 * Value for property 'start'.
 */
- (void) setStart: (NSString *) newStart
{
  [newStart retain];
  [_start release];
  _start = newStart;
}

/**
 * Value for property 'end'.
 */
- (NSString *) end
{
  return _end;
}

/**
 * Value for property 'end'.
 */
- (void) setEnd: (NSString *) newEnd
{
  [newEnd retain];
  [_end release];
  _end = newEnd;
}

/**
 * a list of persons.
 */
- (NSArray *) personItems
{
  return _personItems;
}

/**
 * a list of persons.
 */
- (void) setPersonItems: (NSArray *) newPersonItems
{
  [newPersonItems retain];
  [_personItems release];
  _personItems = newPersonItems;
}

- (void) dealloc
{
  [self setStart: nil];
  [self setEnd: nil];
  [self setPersonItems: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Persons */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Persons (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Persons (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Persons (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Persons from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Persons defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Persons *_fSRESERVATIONV1Persons = [[FSRESERVATIONV1Persons alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Persons initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Persons dealloc];
    _fSRESERVATIONV1Persons = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Persons autorelease];
  return _fSRESERVATIONV1Persons;
}

/**
 * Initialize this instance of FSRESERVATIONV1Persons according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Persons to the writer.
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

  if ((xmlStrcmp(BAD_CAST "start", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}start...");
#endif
    [self setStart: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}start...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "end", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}end...");
#endif
    [self setEnd: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}end...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    __child = [FSRESERVATIONV1Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    if ([self personItems]) {
      [self setPersonItems: [[self personItems] arrayByAddingObject: __child]];
    }
    else {
      [self setPersonItems: [NSArray arrayWithObject: __child]];
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
  if ([self start]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "start", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}start."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}start...");
#endif
    [[self start] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}start...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}start."];
    }
  }
  if ([self end]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "end", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}end."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}end...");
#endif
    [[self end] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}end...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}end."];
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

  if ([self personItems]) {
    __enumerator = [[self personItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "person", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}person."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}person...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}person...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}person."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1Persons (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSRESERVATIONV1PersonReference

/**
 * (no documentation provided)
 */
- (NSString *) ref
{
  return _ref;
}

/**
 * (no documentation provided)
 */
- (void) setRef: (NSString *) newRef
{
  [newRef retain];
  [_ref release];
  _ref = newRef;
}

/**
 * (no documentation provided)
 */
- (enum FSRESERVATIONV1ParentRole *) role
{
  return _role;
}

/**
 * (no documentation provided)
 */
- (void) setRole: (enum FSRESERVATIONV1ParentRole *) newRole
{
  if (_role != NULL) {
    free(_role);
  }
  _role = newRole;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1Qualification *) qualification
{
  return _qualification;
}

/**
 * (no documentation provided)
 */
- (void) setQualification: (FSRESERVATIONV1Qualification *) newQualification
{
  [newQualification retain];
  [_qualification release];
  _qualification = newQualification;
}

- (void) dealloc
{
  [self setRef: nil];
  [self setRole: NULL];
  [self setQualification: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1PersonReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1PersonReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1PersonReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1PersonReference (JAXB)

/**
 * Read an instance of FSRESERVATIONV1PersonReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1PersonReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1PersonReference *_fSRESERVATIONV1PersonReference = [[FSRESERVATIONV1PersonReference alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1PersonReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1PersonReference dealloc];
    _fSRESERVATIONV1PersonReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1PersonReference autorelease];
  return _fSRESERVATIONV1PersonReference;
}

/**
 * Initialize this instance of FSRESERVATIONV1PersonReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1PersonReference to the writer.
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

  if ((xmlStrcmp(BAD_CAST "ref", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}ref...");
#endif
    [self setRef: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}ref...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "role", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}role...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1ParentRoleType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}role."];
    }
    [self setRole: ((enum FSRESERVATIONV1ParentRole*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}role...");
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
    && xmlStrcmp(BAD_CAST "qualification", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}qualification of type {http://api.familysearch.org/reservation/v1}qualification.");
#endif
    __child = [FSRESERVATIONV1Qualification readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}qualification of type {http://api.familysearch.org/reservation/v1}qualification.");
#endif

    [self setQualification: __child];
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

  if ([self ref]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "ref", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}ref."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}ref...");
#endif
    [[self ref] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}ref...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}ref."];
    }
  }
  if ([self role] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "role", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}role."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}role...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1ParentRoleType(writer, [self role]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}role."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}role...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}role."];
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

  if ([self qualification]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "qualification", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}qualification."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}qualification...");
#endif
    [[self qualification] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}qualification...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}qualification."];
    }
  }
}
@end /* implementation FSRESERVATIONV1PersonReference (JAXB) */

/**
 *  A trip to the temple.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1Trip

/**
 * The id of the trip.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The id of the trip.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The date the trip was created.
 */
- (NSDate *) created
{
  return _created;
}

/**
 * The date the trip was created.
 */
- (void) setCreated: (NSDate *) newCreated
{
  [newCreated retain];
  [_created release];
  _created = newCreated;
}

/**
 * Temp id to be echoed back in the response.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * Temp id to be echoed back in the response.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The summary.
 */
- (FSRESERVATIONV1TripSummary *) summary
{
  return _summary;
}

/**
 * The summary.
 */
- (void) setSummary: (FSRESERVATIONV1TripSummary *) newSummary
{
  [newSummary retain];
  [_summary release];
  _summary = newSummary;
}

/**
 * The persons included in the trip.
 */
- (FSRESERVATIONV1Persons *) persons
{
  return _persons;
}

/**
 * The persons included in the trip.
 */
- (void) setPersons: (FSRESERVATIONV1Persons *) newPersons
{
  [newPersons retain];
  [_persons release];
  _persons = newPersons;
}

/**
 * The cards in the trip.
 */
- (NSArray *) cards
{
  return _cards;
}

/**
 * The cards in the trip.
 */
- (void) setCards: (NSArray *) newCards
{
  [newCards retain];
  [_cards release];
  _cards = newCards;
}

/**
 * (no documentation provided)
 */
- (FSRESERVATIONV1UserNotifications *) userNotifications
{
  return _userNotifications;
}

/**
 * (no documentation provided)
 */
- (void) setUserNotifications: (FSRESERVATIONV1UserNotifications *) newUserNotifications
{
  [newUserNotifications retain];
  [_userNotifications release];
  _userNotifications = newUserNotifications;
}

- (void) dealloc
{
  [self setId: nil];
  [self setCreated: nil];
  [self setTempId: nil];
  [self setSummary: nil];
  [self setPersons: nil];
  [self setCards: nil];
  [self setUserNotifications: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Trip */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Trip (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Trip (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Trip (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Trip from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Trip defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Trip *_fSRESERVATIONV1Trip = [[FSRESERVATIONV1Trip alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Trip initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Trip dealloc];
    _fSRESERVATIONV1Trip = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Trip autorelease];
  return _fSRESERVATIONV1Trip;
}

/**
 * Initialize this instance of FSRESERVATIONV1Trip according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Trip to the writer.
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

  if ((xmlStrcmp(BAD_CAST "created", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}created...");
#endif
    [self setCreated: (NSDate*) [NSDate readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}created...");
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
    && xmlStrcmp(BAD_CAST "summary", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}summary of type {http://api.familysearch.org/reservation/v1}tripSummary.");
#endif
    __child = [FSRESERVATIONV1TripSummary readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}summary of type {http://api.familysearch.org/reservation/v1}tripSummary.");
#endif

    [self setSummary: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "persons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}persons of type {http://api.familysearch.org/reservation/v1}persons.");
#endif
    __child = [FSRESERVATIONV1Persons readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}persons of type {http://api.familysearch.org/reservation/v1}persons.");
#endif

    [self setPersons: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "cards", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}cards...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}cards"
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
    && xmlStrcmp(BAD_CAST "card", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}card.");
#endif

    __child = [FSRESERVATIONV1Card readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}card.");
#endif

    if ([self cards]) {
      [self setCards: [[self cards] arrayByAddingObject: __child]];
    }
    else {
      [self setCards: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}cards...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}cards"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setCards: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "userNotifications", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}userNotifications of type {http://api.familysearch.org/reservation/v1}userNotifications.");
#endif
    __child = [FSRESERVATIONV1UserNotifications readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}userNotifications of type {http://api.familysearch.org/reservation/v1}userNotifications.");
#endif

    [self setUserNotifications: __child];
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
  if ([self created]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "created", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}created."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}created...");
#endif
    [[self created] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}created...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}created."];
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

  if ([self summary]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "summary", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}summary."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}summary...");
#endif
    [[self summary] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}summary...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}summary."];
    }
  }
  if ([self persons]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "persons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}persons."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}persons...");
#endif
    [[self persons] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}persons...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}persons."];
    }
  }
  if ([self cards]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "cards", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}cards."];
    }
    __enumerator = [[self cards] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "card", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}card."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}card...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}card...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}card."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}cards."];
    }
  }
  if ([self userNotifications]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "userNotifications", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}userNotifications."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}userNotifications...");
#endif
    [[self userNotifications] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}userNotifications...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}userNotifications."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Trip (JAXB) */

/**
 *  Summary of a trip.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1TripSummary

/**
 * Card summary for males.
 */
- (FSRESERVATIONV1TripCardSummary *) males
{
  return _males;
}

/**
 * Card summary for males.
 */
- (void) setMales: (FSRESERVATIONV1TripCardSummary *) newMales
{
  [newMales retain];
  [_males release];
  _males = newMales;
}

/**
 * Card summary for females.
 */
- (FSRESERVATIONV1TripCardSummary *) females
{
  return _females;
}

/**
 * Card summary for females.
 */
- (void) setFemales: (FSRESERVATIONV1TripCardSummary *) newFemales
{
  [newFemales retain];
  [_females release];
  _females = newFemales;
}

/**
 * Card summary for couples.
 */
- (FSRESERVATIONV1TripCardSummary *) couples
{
  return _couples;
}

/**
 * Card summary for couples.
 */
- (void) setCouples: (FSRESERVATIONV1TripCardSummary *) newCouples
{
  [newCouples retain];
  [_couples release];
  _couples = newCouples;
}

- (void) dealloc
{
  [self setMales: nil];
  [self setFemales: nil];
  [self setCouples: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1TripSummary */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1TripSummary (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1TripSummary (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1TripSummary (JAXB)

/**
 * Read an instance of FSRESERVATIONV1TripSummary from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1TripSummary defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1TripSummary *_fSRESERVATIONV1TripSummary = [[FSRESERVATIONV1TripSummary alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1TripSummary initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1TripSummary dealloc];
    _fSRESERVATIONV1TripSummary = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1TripSummary autorelease];
  return _fSRESERVATIONV1TripSummary;
}

/**
 * Initialize this instance of FSRESERVATIONV1TripSummary according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1TripSummary to the writer.
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
    && xmlStrcmp(BAD_CAST "males", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}males of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif
    __child = [FSRESERVATIONV1TripCardSummary readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}males of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif

    [self setMales: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "females", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}females of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif
    __child = [FSRESERVATIONV1TripCardSummary readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}females of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif

    [self setFemales: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "couples", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}couples of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif
    __child = [FSRESERVATIONV1TripCardSummary readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}couples of type {http://api.familysearch.org/reservation/v1}tripCardSummary.");
#endif

    [self setCouples: __child];
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

  if ([self males]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "males", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}males."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}males...");
#endif
    [[self males] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}males...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}males."];
    }
  }
  if ([self females]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "females", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}females."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}females...");
#endif
    [[self females] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}females...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}females."];
    }
  }
  if ([self couples]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "couples", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}couples."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}couples...");
#endif
    [[self couples] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}couples...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}couples."];
    }
  }
}
@end /* implementation FSRESERVATIONV1TripSummary (JAXB) */

/**
 *  A way to represent a notification that the 3rd party client should communicate to their users.

 @author Tim Adair (timadair@ldschurch.org) Date: Mar 2, 2009 Time: 9:18:59 AM

 */
@implementation FSRESERVATIONV1UserNotification

/**
 * Gets the level of importance, [required|optional]. "required" notifications must be shown to the user for certification. "optional" notifications may be
displayed at the developer's discretion.
 */
- (enum FSRESERVATIONV1NotificationLevel *) level
{
  return _level;
}

/**
 * Gets the level of importance, [required|optional]. "required" notifications must be shown to the user for certification. "optional" notifications may be
displayed at the developer's discretion.
 */
- (void) setLevel: (enum FSRESERVATIONV1NotificationLevel *) newLevel
{
  if (_level != NULL) {
    free(_level);
  }
  _level = newLevel;
}

/**
 * the code
 */
- (enum FSRESERVATIONV1NotificationCode *) code
{
  return _code;
}

/**
 * the code
 */
- (void) setCode: (enum FSRESERVATIONV1NotificationCode *) newCode
{
  if (_code != NULL) {
    free(_code);
  }
  _code = newCode;
}

/**
 * the String message
 */
- (NSString *) message
{
  return _message;
}

/**
 * the String message
 */
- (void) setMessage: (NSString *) newMessage
{
  [newMessage retain];
  [_message release];
  _message = newMessage;
}

/**
 * a list of persons.
 */
- (NSArray *) personas
{
  return _personas;
}

/**
 * a list of persons.
 */
- (void) setPersonas: (NSArray *) newPersonas
{
  [newPersonas retain];
  [_personas release];
  _personas = newPersonas;
}

- (void) dealloc
{
  [self setLevel: NULL];
  [self setCode: NULL];
  [self setMessage: nil];
  [self setPersonas: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1UserNotification */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1UserNotification (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1UserNotification (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1UserNotification (JAXB)

/**
 * Read an instance of FSRESERVATIONV1UserNotification from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1UserNotification defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1UserNotification *_fSRESERVATIONV1UserNotification = [[FSRESERVATIONV1UserNotification alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1UserNotification initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1UserNotification dealloc];
    _fSRESERVATIONV1UserNotification = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1UserNotification autorelease];
  return _fSRESERVATIONV1UserNotification;
}

/**
 * Initialize this instance of FSRESERVATIONV1UserNotification according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1UserNotification to the writer.
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
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1NotificationLevelType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}level."];
    }
    [self setLevel: ((enum FSRESERVATIONV1NotificationLevel*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}level...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "code", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}code...");
#endif
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1NotificationCodeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}code."];
    }
    [self setCode: ((enum FSRESERVATIONV1NotificationCode*) _child_accessor)];
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}message of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setMessage: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "persona", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}persona of type {http://api.familysearch.org/reservation/v1}persona.");
#endif

    __child = [FSRESERVATIONV1Persona readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}persona of type {http://api.familysearch.org/reservation/v1}persona.");
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

  if ([self level] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "level", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}level."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}level...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1NotificationLevelType(writer, [self level]);
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
  if ([self code] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "code", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}code."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}code...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1NotificationCodeType(writer, [self code]);
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "message", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}message."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}message...");
#endif
    [[self message] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}message...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}message."];
    }
  }
  if ([self personas]) {
    __enumerator = [[self personas] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "persona", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}persona."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}persona...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}persona...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}persona."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1UserNotification (JAXB) */

/**
 *  A trip to the temple.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1Trips

/**
 * The trips.
 */
- (NSArray *) tripItems
{
  return _tripItems;
}

/**
 * The trips.
 */
- (void) setTripItems: (NSArray *) newTripItems
{
  [newTripItems retain];
  [_tripItems release];
  _tripItems = newTripItems;
}

- (void) dealloc
{
  [self setTripItems: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Trips */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Trips (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Trips (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Trips (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Trips from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Trips defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Trips *_fSRESERVATIONV1Trips = [[FSRESERVATIONV1Trips alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Trips initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Trips dealloc];
    _fSRESERVATIONV1Trips = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Trips autorelease];
  return _fSRESERVATIONV1Trips;
}

/**
 * Initialize this instance of FSRESERVATIONV1Trips according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Trips to the writer.
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
    && xmlStrcmp(BAD_CAST "trip", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}trip of type {http://api.familysearch.org/reservation/v1}trip.");
#endif

    __child = [FSRESERVATIONV1Trip readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}trip of type {http://api.familysearch.org/reservation/v1}trip.");
#endif

    if ([self tripItems]) {
      [self setTripItems: [[self tripItems] arrayByAddingObject: __child]];
    }
    else {
      [self setTripItems: [NSArray arrayWithObject: __child]];
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

  if ([self tripItems]) {
    __enumerator = [[self tripItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "trip", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}trip."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}trip...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}trip...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}trip."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1Trips (JAXB) */

/**
 *  A collection of user notifications

 @author Tim Adair (timadair@ldschurch.org) Date: Mar 2, 2009 Time: 9:19:19 AM

 */
@implementation FSRESERVATIONV1UserNotifications

/**
 * The user notifications.
 */
- (NSArray *) userNotificationItems
{
  return _userNotificationItems;
}

/**
 * The user notifications.
 */
- (void) setUserNotificationItems: (NSArray *) newUserNotificationItems
{
  [newUserNotificationItems retain];
  [_userNotificationItems release];
  _userNotificationItems = newUserNotificationItems;
}

- (void) dealloc
{
  [self setUserNotificationItems: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1UserNotifications */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1UserNotifications (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1UserNotifications (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1UserNotifications (JAXB)

/**
 * Read an instance of FSRESERVATIONV1UserNotifications from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1UserNotifications defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1UserNotifications *_fSRESERVATIONV1UserNotifications = [[FSRESERVATIONV1UserNotifications alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1UserNotifications initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1UserNotifications dealloc];
    _fSRESERVATIONV1UserNotifications = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1UserNotifications autorelease];
  return _fSRESERVATIONV1UserNotifications;
}

/**
 * Initialize this instance of FSRESERVATIONV1UserNotifications according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1UserNotifications to the writer.
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
    && xmlStrcmp(BAD_CAST "userNotification", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}userNotification of type {http://api.familysearch.org/reservation/v1}userNotification.");
#endif

    __child = [FSRESERVATIONV1UserNotification readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}userNotification of type {http://api.familysearch.org/reservation/v1}userNotification.");
#endif

    if ([self userNotificationItems]) {
      [self setUserNotificationItems: [[self userNotificationItems] arrayByAddingObject: __child]];
    }
    else {
      [self setUserNotificationItems: [NSArray arrayWithObject: __child]];
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

  if ([self userNotificationItems]) {
    __enumerator = [[self userNotificationItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "userNotification", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}userNotification."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}userNotification...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}userNotification...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}userNotification."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1UserNotifications (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSRESERVATIONV1TripCardSummary

/**
 * The count.
 */
- (int) count
{
  return _count;
}

/**
 * The count.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

- (void) dealloc
{
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1TripCardSummary */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1TripCardSummary (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1TripCardSummary (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1TripCardSummary (JAXB)

/**
 * Read an instance of FSRESERVATIONV1TripCardSummary from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1TripCardSummary defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1TripCardSummary *_fSRESERVATIONV1TripCardSummary = [[FSRESERVATIONV1TripCardSummary alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1TripCardSummary initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1TripCardSummary dealloc];
    _fSRESERVATIONV1TripCardSummary = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1TripCardSummary autorelease];
  return _fSRESERVATIONV1TripCardSummary;
}

/**
 * Initialize this instance of FSRESERVATIONV1TripCardSummary according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1TripCardSummary to the writer.
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

}
@end /* implementation FSRESERVATIONV1TripCardSummary (JAXB) */

/**
 *  A reference to a temple.

 @author Eric Pabst

 */
@implementation FSRESERVATIONV1Temple

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

- (void) dealloc
{
  [self setCode: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Temple */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Temple (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Temple (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Temple (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Temple from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Temple defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Temple *_fSRESERVATIONV1Temple = [[FSRESERVATIONV1Temple alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Temple initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Temple dealloc];
    _fSRESERVATIONV1Temple = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Temple autorelease];
  return _fSRESERVATIONV1Temple;
}

/**
 * Initialize this instance of FSRESERVATIONV1Temple according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Temple to the writer.
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

}
@end /* implementation FSRESERVATIONV1Temple (JAXB) */

/**
 *  Text for a normalized place.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1NormalizedPlace

/**
 * The place authority id.
 */
- (NSString *) placeId
{
  return _placeId;
}

/**
 * The place authority id.
 */
- (void) setPlaceId: (NSString *) newPlaceId
{
  [newPlaceId retain];
  [_placeId release];
  _placeId = newPlaceId;
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
  [self setPlaceId: nil];
  [self setValue: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1NormalizedPlace */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1NormalizedPlace (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1NormalizedPlace (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1NormalizedPlace (JAXB)

/**
 * Read an instance of FSRESERVATIONV1NormalizedPlace from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1NormalizedPlace defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1NormalizedPlace *_fSRESERVATIONV1NormalizedPlace = [[FSRESERVATIONV1NormalizedPlace alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1NormalizedPlace initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1NormalizedPlace dealloc];
    _fSRESERVATIONV1NormalizedPlace = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1NormalizedPlace autorelease];
  return _fSRESERVATIONV1NormalizedPlace;
}

/**
 * Initialize this instance of FSRESERVATIONV1NormalizedPlace according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1NormalizedPlace to the writer.
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

  if ((xmlStrcmp(BAD_CAST "placeId", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}placeId...");
#endif
    [self setPlaceId: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}placeId...");
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

  if ([self placeId]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "placeId", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}placeId."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}placeId...");
#endif
    [[self placeId] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}placeId...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}placeId."];
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
@end /* implementation FSRESERVATIONV1NormalizedPlace (JAXB) */

/**
 *  Families class that holds a list of Family.

 @author: Sreenivas Boralingiah User: boralingiahsr

 */
@implementation FSRESERVATIONV1Families

/**
 * the number of persons.
 */
- (int) count
{
  return _count;
}

/**
 * the number of persons.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * a list of persons.
 */
- (NSArray *) familyItems
{
  return _familyItems;
}

/**
 * a list of persons.
 */
- (void) setFamilyItems: (NSArray *) newFamilyItems
{
  [newFamilyItems retain];
  [_familyItems release];
  _familyItems = newFamilyItems;
}

- (void) dealloc
{
  [self setFamilyItems: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Families */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Families (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Families (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Families (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Families from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Families defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Families *_fSRESERVATIONV1Families = [[FSRESERVATIONV1Families alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Families initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Families dealloc];
    _fSRESERVATIONV1Families = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Families autorelease];
  return _fSRESERVATIONV1Families;
}

/**
 * Initialize this instance of FSRESERVATIONV1Families according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Families to the writer.
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
    && xmlStrcmp(BAD_CAST "family", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}family of type {http://api.familysearch.org/reservation/v1}family.");
#endif

    __child = [FSRESERVATIONV1Family readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}family of type {http://api.familysearch.org/reservation/v1}family.");
#endif

    if ([self familyItems]) {
      [self setFamilyItems: [[self familyItems] arrayByAddingObject: __child]];
    }
    else {
      [self setFamilyItems: [NSArray arrayWithObject: __child]];
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

  if ([self familyItems]) {
    __enumerator = [[self familyItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "family", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}family."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}family...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}family...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}family."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSRESERVATIONV1Families (JAXB) */

/**
 *  A temple card.

 @author Ryan Heaton

 */
@implementation FSRESERVATIONV1Card

/**
 * The card id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * The card id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * The card type
 */
- (enum FSRESERVATIONV1CardType *) type
{
  return _type;
}

/**
 * The card type
 */
- (void) setType: (enum FSRESERVATIONV1CardType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * The temp id.
 */
- (NSString *) tempId
{
  return _tempId;
}

/**
 * The temp id.
 */
- (void) setTempId: (NSString *) newTempId
{
  [newTempId retain];
  [_tempId release];
  _tempId = newTempId;
}

/**
 * The card details.
 */
- (FSRESERVATIONV1Person *) person
{
  return _person;
}

/**
 * The card details.
 */
- (void) setPerson: (FSRESERVATIONV1Person *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

- (void) dealloc
{
  [self setId: nil];
  [self setType: NULL];
  [self setTempId: nil];
  [self setPerson: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Card */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Card (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Card (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Card (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Card from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Card defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Card *_fSRESERVATIONV1Card = [[FSRESERVATIONV1Card alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Card initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Card dealloc];
    _fSRESERVATIONV1Card = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Card autorelease];
  return _fSRESERVATIONV1Card;
}

/**
 * Initialize this instance of FSRESERVATIONV1Card according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Card to the writer.
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
    _child_accessor = xmlTextReaderReadFSRESERVATIONV1CardTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSRESERVATIONV1CardType*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif
    __child = [FSRESERVATIONV1Person readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}person.");
#endif

    [self setPerson: __child];
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
    status = xmlTextWriterWriteFSRESERVATIONV1CardTypeType(writer, [self type]);
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}person."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Card (JAXB) */


/**
 * Reads a EventType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The EventType, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1EventType *xmlTextReaderReadFSRESERVATIONV1EventTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1EventType *value = calloc(1, sizeof(enum FSRESERVATIONV1EventType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Adoption") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ADOPTION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Adult Christening") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ADULT_CHRISTENING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Baptism") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BAPTISM;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Confirmation") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_CONFIRMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Bar Mitzvah") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BAR_MITZVAH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Bas Mitzvah") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BAS_MITZVAH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Birth") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BIRTH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Blessing") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BLESSING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Burial") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_BURIAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Christening") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_CHRISTENING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cremation") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_CREMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Death") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_DEATH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Graduation") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_GRADUATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Immigration") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_IMMIGRATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Military Service") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MILITARY_SERVICE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Mission") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MISSION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Move") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MOVE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Naturalization") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_NATURALIZATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Probate") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_PROBATE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Retirement") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_RETIREMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Will") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_WILL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Annulment") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ANNULMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Divorce") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_DIVORCE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Divorce Filing") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_DIVORCE_FILING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Engagement") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ENGAGEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Banns") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_BANNS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Contract") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_CONTRACT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage License") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_LICENSE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_OTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Census") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_CENSUS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Circumcision") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_CIRCUMCISION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Emigration") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_EMIGRATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Excommunication") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_EXCOMMUNICATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "First Communion") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_FIRST_COMMUNION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "First Known Child") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_FIRST_KNOWN_CHILD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Funeral") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_FUNERAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Hospitalization") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_HOSPITALIZATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Illness") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ILLNESS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Naming") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_NAMING;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Marriage Settlement") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_SETTLEMENT;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Miscarriage") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_MISCARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ordination") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_ORDINATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Separation") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_SEPARATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Time Only Marriage") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_TIME_ONLY_MARRIAGE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Residence") == 0) {
      *value = RESERVATION_RESERVATION_V1_EVENTTYPE_RESIDENCE;
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
static int xmlTextWriterWriteFSRESERVATIONV1EventTypeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1EventType *_eventType)
{
  switch (*_eventType) {
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ADOPTION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adoption");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ADULT_CHRISTENING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Adult Christening");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BAPTISM:
      return xmlTextWriterWriteString(writer, BAD_CAST "Baptism");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_CONFIRMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Confirmation");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BAR_MITZVAH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Bar Mitzvah");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BAS_MITZVAH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Bas Mitzvah");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BIRTH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Birth");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BLESSING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Blessing");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_BURIAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Burial");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_CHRISTENING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Christening");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_CREMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cremation");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_DEATH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Death");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_GRADUATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Graduation");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_IMMIGRATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Immigration");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MILITARY_SERVICE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Military Service");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MISSION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Mission");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MOVE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Move");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_NATURALIZATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Naturalization");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_PROBATE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Probate");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_RETIREMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Retirement");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_WILL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Will");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ANNULMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Annulment");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_DIVORCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Divorce");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_DIVORCE_FILING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Divorce Filing");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ENGAGEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Engagement");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_BANNS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Banns");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_CONTRACT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Contract");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_LICENSE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage License");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_CENSUS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Census");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_CIRCUMCISION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Circumcision");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_EMIGRATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Emigration");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_EXCOMMUNICATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Excommunication");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_FIRST_COMMUNION:
      return xmlTextWriterWriteString(writer, BAD_CAST "First Communion");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_FIRST_KNOWN_CHILD:
      return xmlTextWriterWriteString(writer, BAD_CAST "First Known Child");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_FUNERAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Funeral");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_HOSPITALIZATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Hospitalization");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ILLNESS:
      return xmlTextWriterWriteString(writer, BAD_CAST "Illness");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_NAMING:
      return xmlTextWriterWriteString(writer, BAD_CAST "Naming");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MARRIAGE_SETTLEMENT:
      return xmlTextWriterWriteString(writer, BAD_CAST "Marriage Settlement");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_MISCARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Miscarriage");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_ORDINATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ordination");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_SEPARATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Separation");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_TIME_ONLY_MARRIAGE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Time Only Marriage");
    case RESERVATION_RESERVATION_V1_EVENTTYPE_RESIDENCE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Residence");
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
static enum FSRESERVATIONV1NameFormScript *xmlTextReaderReadFSRESERVATIONV1NameFormScriptType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1NameFormScript *value = calloc(1, sizeof(enum FSRESERVATIONV1NameFormScript));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Spanish") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_SPANISH;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Portuguese") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_PORTUGUESE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Chinese") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_CHINESE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Kana") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_KANA;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Hangul") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_HANGUL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Cyrillic") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_CYRILLIC;
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
static int xmlTextWriterWriteFSRESERVATIONV1NameFormScriptType(xmlTextWriterPtr writer, enum FSRESERVATIONV1NameFormScript *_nameFormScript)
{
  switch (*_nameFormScript) {
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_SPANISH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Spanish");
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_PORTUGUESE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Portuguese");
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_CHINESE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Chinese");
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_KANA:
      return xmlTextWriterWriteString(writer, BAD_CAST "Kana");
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_HANGUL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Hangul");
    case RESERVATION_RESERVATION_V1_NAMEFORMSCRIPT_CYRILLIC:
      return xmlTextWriterWriteString(writer, BAD_CAST "Cyrillic");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  qualification data for an ordinance.

 @author PabstEC

 */
@implementation FSRESERVATIONV1Qualification

/**
 * The person gender.
 */
- (enum FSRESERVATIONV1GenderType *) gender
{
  return _gender;
}

/**
 * The person gender.
 */
- (void) setGender: (enum FSRESERVATIONV1GenderType *) newGender
{
  if (_gender != NULL) {
    free(_gender);
  }
  _gender = newGender;
}

/**
 * The person events.
 */
- (NSArray *) events
{
  return _events;
}

/**
 * The person events.
 */
- (void) setEvents: (NSArray *) newEvents
{
  [newEvents retain];
  [_events release];
  _events = newEvents;
}

- (void) dealloc
{
  [self setGender: NULL];
  [self setEvents: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1Qualification */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1Qualification (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1Qualification (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1Qualification (JAXB)

/**
 * Read an instance of FSRESERVATIONV1Qualification from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1Qualification defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1Qualification *_fSRESERVATIONV1Qualification = [[FSRESERVATIONV1Qualification alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1Qualification initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1Qualification dealloc];
    _fSRESERVATIONV1Qualification = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1Qualification autorelease];
  return _fSRESERVATIONV1Qualification;
}

/**
 * Initialize this instance of FSRESERVATIONV1Qualification according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1Qualification to the writer.
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
    && xmlStrcmp(BAD_CAST "gender", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadFSRESERVATIONV1GenderTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setGender: ((enum FSRESERVATIONV1GenderType*) _child_accessor)];
    return YES;
  }
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "events", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/reservation/v1}events...");
#endif
      //start wrapper element "{http://api.familysearch.org/reservation/v1}events"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}event of type {http://api.familysearch.org/reservation/v1}event.");
#endif

    __child = [FSRESERVATIONV1Event readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}event of type {http://api.familysearch.org/reservation/v1}event.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/reservation/v1}events...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/reservation/v1}events"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setEvents: (NSArray*) __child];
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

  if ([self gender] != NULL) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "gender", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}gender."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}gender...");
#endif
    status = xmlTextWriterWriteFSRESERVATIONV1GenderTypeType(writer, [self gender]);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}gender...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/reservation/v1}gender."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}gender."];
    }
  }
  if ([self events]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "events", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/reservation/v1}events."];
    }
    __enumerator = [[self events] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "event", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}event."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/reservation/v1}event...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}event...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}event."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/reservation/v1}events."];
    }
  }
}
@end /* implementation FSRESERVATIONV1Qualification (JAXB) */

/**
 * Reads a OrdinanceStatus from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The OrdinanceStatus, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1OrdinanceStatus *xmlTextReaderReadFSRESERVATIONV1OrdinanceStatusType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1OrdinanceStatus *value = calloc(1, sizeof(enum FSRESERVATIONV1OrdinanceStatus));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Not Needed") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_NEEDED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Reserved") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_RESERVED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ready") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_READY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Not Ready") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_READY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Completed") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_COMPLETED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Not Available") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_AVAILABLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Need More Information") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NEED_MORE_INFORMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "In Progress") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_IN_PROGRESS;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "On Hold") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_ON_HOLD;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Canceled") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_CANCELED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Deleted") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_DELETED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Invalid") == 0) {
      *value = RESERVATION_RESERVATION_V1_ORDINANCESTATUS_INVALID;
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
 * Writes a OrdinanceStatus to XML.
 *
 * @param writer The XML writer.
 * @param _ordinanceStatus The OrdinanceStatus to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1OrdinanceStatusType(xmlTextWriterPtr writer, enum FSRESERVATIONV1OrdinanceStatus *_ordinanceStatus)
{
  switch (*_ordinanceStatus) {
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_NEEDED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Not Needed");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_RESERVED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Reserved");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_READY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ready");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_READY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Not Ready");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_COMPLETED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Completed");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NOT_AVAILABLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Not Available");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_NEED_MORE_INFORMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Need More Information");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_IN_PROGRESS:
      return xmlTextWriterWriteString(writer, BAD_CAST "In Progress");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_ON_HOLD:
      return xmlTextWriterWriteString(writer, BAD_CAST "On Hold");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_CANCELED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Canceled");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_DELETED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Deleted");
    case RESERVATION_RESERVATION_V1_ORDINANCESTATUS_INVALID:
      return xmlTextWriterWriteString(writer, BAD_CAST "Invalid");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NotificationCode from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NotificationCode, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1NotificationCode *xmlTextReaderReadFSRESERVATIONV1NotificationCodeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1NotificationCode *value = calloc(1, sizeof(enum FSRESERVATIONV1NotificationCode));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Destroy Cards Duplicated By Trip") == 0) {
      *value = RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_DESTROY_CARDS_DUPLICATED_BY_TRIP;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Destroy Unreserved Cards For Person") == 0) {
      *value = RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_DESTROY_UNRESERVED_CARDS_FOR_PERSON;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ordinances Already Completed") == 0) {
      *value = RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_ORDINANCES_ALREADY_COMPLETED;
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
 * Writes a NotificationCode to XML.
 *
 * @param writer The XML writer.
 * @param _notificationCode The NotificationCode to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1NotificationCodeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1NotificationCode *_notificationCode)
{
  switch (*_notificationCode) {
    case RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_DESTROY_CARDS_DUPLICATED_BY_TRIP:
      return xmlTextWriterWriteString(writer, BAD_CAST "Destroy Cards Duplicated By Trip");
    case RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_DESTROY_UNRESERVED_CARDS_FOR_PERSON:
      return xmlTextWriterWriteString(writer, BAD_CAST "Destroy Unreserved Cards For Person");
    case RESERVATION_RESERVATION_V1_NOTIFICATIONCODE_ORDINANCES_ALREADY_COMPLETED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ordinances Already Completed");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NotificationLevel from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NotificationLevel, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1NotificationLevel *xmlTextReaderReadFSRESERVATIONV1NotificationLevelType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1NotificationLevel *value = calloc(1, sizeof(enum FSRESERVATIONV1NotificationLevel));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "required") == 0) {
      *value = RESERVATION_RESERVATION_V1_NOTIFICATIONLEVEL_REQUIRED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "optional") == 0) {
      *value = RESERVATION_RESERVATION_V1_NOTIFICATIONLEVEL_OPTIONAL;
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
 * Writes a NotificationLevel to XML.
 *
 * @param writer The XML writer.
 * @param _notificationLevel The NotificationLevel to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1NotificationLevelType(xmlTextWriterPtr writer, enum FSRESERVATIONV1NotificationLevel *_notificationLevel)
{
  switch (*_notificationLevel) {
    case RESERVATION_RESERVATION_V1_NOTIFICATIONLEVEL_REQUIRED:
      return xmlTextWriterWriteString(writer, BAD_CAST "required");
    case RESERVATION_RESERVATION_V1_NOTIFICATIONLEVEL_OPTIONAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "optional");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a RollupStatus from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The RollupStatus, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1RollupStatus *xmlTextReaderReadFSRESERVATIONV1RollupStatusType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1RollupStatus *value = calloc(1, sizeof(enum FSRESERVATIONV1RollupStatus));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Completed") == 0) {
      *value = RESERVATION_RESERVATION_V1_ROLLUPSTATUS_COMPLETED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Need More Information") == 0) {
      *value = RESERVATION_RESERVATION_V1_ROLLUPSTATUS_NEED_MORE_INFORMATION;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Reserved") == 0) {
      *value = RESERVATION_RESERVATION_V1_ROLLUPSTATUS_RESERVED;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Ready") == 0) {
      *value = RESERVATION_RESERVATION_V1_ROLLUPSTATUS_READY;
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
 * Writes a RollupStatus to XML.
 *
 * @param writer The XML writer.
 * @param _rollupStatus The RollupStatus to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1RollupStatusType(xmlTextWriterPtr writer, enum FSRESERVATIONV1RollupStatus *_rollupStatus)
{
  switch (*_rollupStatus) {
    case RESERVATION_RESERVATION_V1_ROLLUPSTATUS_COMPLETED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Completed");
    case RESERVATION_RESERVATION_V1_ROLLUPSTATUS_NEED_MORE_INFORMATION:
      return xmlTextWriterWriteString(writer, BAD_CAST "Need More Information");
    case RESERVATION_RESERVATION_V1_ROLLUPSTATUS_RESERVED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Reserved");
    case RESERVATION_RESERVATION_V1_ROLLUPSTATUS_READY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Ready");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a Scope from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The Scope, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1Scope *xmlTextReaderReadFSRESERVATIONV1ScopeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1Scope *value = calloc(1, sizeof(enum FSRESERVATIONV1Scope));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "person") == 0) {
      *value = RESERVATION_RESERVATION_V1_SCOPE_PERSON;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "couple") == 0) {
      *value = RESERVATION_RESERVATION_V1_SCOPE_COUPLE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "parent-child") == 0) {
      *value = RESERVATION_RESERVATION_V1_SCOPE_PARENTCHILD;
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
 * Writes a Scope to XML.
 *
 * @param writer The XML writer.
 * @param _scope The Scope to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1ScopeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1Scope *_scope)
{
  switch (*_scope) {
    case RESERVATION_RESERVATION_V1_SCOPE_PERSON:
      return xmlTextWriterWriteString(writer, BAD_CAST "person");
    case RESERVATION_RESERVATION_V1_SCOPE_COUPLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "couple");
    case RESERVATION_RESERVATION_V1_SCOPE_PARENTCHILD:
      return xmlTextWriterWriteString(writer, BAD_CAST "parent-child");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a ParentRole from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The ParentRole, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1ParentRole *xmlTextReaderReadFSRESERVATIONV1ParentRoleType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1ParentRole *value = calloc(1, sizeof(enum FSRESERVATIONV1ParentRole));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Father") == 0) {
      *value = RESERVATION_RESERVATION_V1_PARENTROLE_FATHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Mother") == 0) {
      *value = RESERVATION_RESERVATION_V1_PARENTROLE_MOTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unknown") == 0) {
      *value = RESERVATION_RESERVATION_V1_PARENTROLE_UNKNOWN;
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
 * Writes a ParentRole to XML.
 *
 * @param writer The XML writer.
 * @param _parentRole The ParentRole to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1ParentRoleType(xmlTextWriterPtr writer, enum FSRESERVATIONV1ParentRole *_parentRole)
{
  switch (*_parentRole) {
    case RESERVATION_RESERVATION_V1_PARENTROLE_FATHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Father");
    case RESERVATION_RESERVATION_V1_PARENTROLE_MOTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Mother");
    case RESERVATION_RESERVATION_V1_PARENTROLE_UNKNOWN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unknown");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NamePieceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NamePieceType, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1NamePieceType *xmlTextReaderReadFSRESERVATIONV1NamePieceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1NamePieceType *value = calloc(1, sizeof(enum FSRESERVATIONV1NamePieceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Prefix") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEPIECETYPE_PREFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Suffix") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEPIECETYPE_SUFFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Given") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEPIECETYPE_GIVEN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEPIECETYPE_FAMILY;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = RESERVATION_RESERVATION_V1_NAMEPIECETYPE_OTHER;
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
static int xmlTextWriterWriteFSRESERVATIONV1NamePieceTypeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1NamePieceType *_namePieceType)
{
  switch (*_namePieceType) {
    case RESERVATION_RESERVATION_V1_NAMEPIECETYPE_PREFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Prefix");
    case RESERVATION_RESERVATION_V1_NAMEPIECETYPE_SUFFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Suffix");
    case RESERVATION_RESERVATION_V1_NAMEPIECETYPE_GIVEN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Given");
    case RESERVATION_RESERVATION_V1_NAMEPIECETYPE_FAMILY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family");
    case RESERVATION_RESERVATION_V1_NAMEPIECETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a InventoryType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The InventoryType, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1InventoryType *xmlTextReaderReadFSRESERVATIONV1InventoryTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1InventoryType *value = calloc(1, sizeof(enum FSRESERVATIONV1InventoryType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Personal") == 0) {
      *value = RESERVATION_RESERVATION_V1_INVENTORYTYPE_PERSONAL;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Church") == 0) {
      *value = RESERVATION_RESERVATION_V1_INVENTORYTYPE_CHURCH;
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
 * Writes a InventoryType to XML.
 *
 * @param writer The XML writer.
 * @param _inventoryType The InventoryType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1InventoryTypeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1InventoryType *_inventoryType)
{
  switch (*_inventoryType) {
    case RESERVATION_RESERVATION_V1_INVENTORYTYPE_PERSONAL:
      return xmlTextWriterWriteString(writer, BAD_CAST "Personal");
    case RESERVATION_RESERVATION_V1_INVENTORYTYPE_CHURCH:
      return xmlTextWriterWriteString(writer, BAD_CAST "Church");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a GenderType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The GenderType, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1GenderType *xmlTextReaderReadFSRESERVATIONV1GenderTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1GenderType *value = calloc(1, sizeof(enum FSRESERVATIONV1GenderType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Male") == 0) {
      *value = RESERVATION_RESERVATION_V1_GENDERTYPE_MALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Female") == 0) {
      *value = RESERVATION_RESERVATION_V1_GENDERTYPE_FEMALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unknown") == 0) {
      *value = RESERVATION_RESERVATION_V1_GENDERTYPE_UNKNOWN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Unspecified") == 0) {
      *value = RESERVATION_RESERVATION_V1_GENDERTYPE_UNSPECIFIED;
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
static int xmlTextWriterWriteFSRESERVATIONV1GenderTypeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1GenderType *_genderType)
{
  switch (*_genderType) {
    case RESERVATION_RESERVATION_V1_GENDERTYPE_MALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Male");
    case RESERVATION_RESERVATION_V1_GENDERTYPE_FEMALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "Female");
    case RESERVATION_RESERVATION_V1_GENDERTYPE_UNKNOWN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unknown");
    case RESERVATION_RESERVATION_V1_GENDERTYPE_UNSPECIFIED:
      return xmlTextWriterWriteString(writer, BAD_CAST "Unspecified");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a CardType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The CardType, or NULL if unable to be read.
 */
static enum FSRESERVATIONV1CardType *xmlTextReaderReadFSRESERVATIONV1CardTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSRESERVATIONV1CardType *value = calloc(1, sizeof(enum FSRESERVATIONV1CardType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "male") == 0) {
      *value = RESERVATION_RESERVATION_V1_CARDTYPE_MALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "female") == 0) {
      *value = RESERVATION_RESERVATION_V1_CARDTYPE_FEMALE;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "couple") == 0) {
      *value = RESERVATION_RESERVATION_V1_CARDTYPE_COUPLE;
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
 * Writes a CardType to XML.
 *
 * @param writer The XML writer.
 * @param _cardType The CardType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSRESERVATIONV1CardTypeType(xmlTextWriterPtr writer, enum FSRESERVATIONV1CardType *_cardType)
{
  switch (*_cardType) {
    case RESERVATION_RESERVATION_V1_CARDTYPE_MALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "male");
    case RESERVATION_RESERVATION_V1_CARDTYPE_FEMALE:
      return xmlTextWriterWriteString(writer, BAD_CAST "female");
    case RESERVATION_RESERVATION_V1_CARDTYPE_COUPLE:
      return xmlTextWriterWriteString(writer, BAD_CAST "couple");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}


/**
 *  @author Rob Lyon

 */
@implementation FSRESERVATIONV1ReservationRootElement

/**
 * The persons.
 */
- (FSRESERVATIONV1Persons *) persons
{
  return _persons;
}

/**
 * The persons.
 */
- (void) setPersons: (FSRESERVATIONV1Persons *) newPersons
{
  [newPersons retain];
  [_persons release];
  _persons = newPersons;
}

/**
 * The families.
 */
- (FSRESERVATIONV1Families *) families
{
  return _families;
}

/**
 * The families.
 */
- (void) setFamilies: (FSRESERVATIONV1Families *) newFamilies
{
  [newFamilies retain];
  [_families release];
  _families = newFamilies;
}

/**
 * The trips.
 */
- (FSRESERVATIONV1Trips *) trips
{
  return _trips;
}

/**
 * The trips.
 */
- (void) setTrips: (FSRESERVATIONV1Trips *) newTrips
{
  [newTrips retain];
  [_trips release];
  _trips = newTrips;
}

/**
 * The cards.
 */
- (FSRESERVATIONV1Cards *) cards
{
  return _cards;
}

/**
 * The cards.
 */
- (void) setCards: (FSRESERVATIONV1Cards *) newCards
{
  [newCards retain];
  [_cards release];
  _cards = newCards;
}

- (void) dealloc
{
  [self setPersons: nil];
  [self setFamilies: nil];
  [self setTrips: nil];
  [self setCards: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSRESERVATIONV1ReservationRootElement *_fSRESERVATIONV1ReservationRootElement;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSRESERVATIONV1ReservationRootElement = (FSRESERVATIONV1ReservationRootElement *) [FSRESERVATIONV1ReservationRootElement readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSRESERVATIONV1ReservationRootElement;
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
@end /* implementation FSRESERVATIONV1ReservationRootElement */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1ReservationRootElement (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSRESERVATIONV1ReservationRootElement (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1ReservationRootElement (JAXB)

/**
 * Read an instance of FSRESERVATIONV1ReservationRootElement from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1ReservationRootElement defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1ReservationRootElement *_fSRESERVATIONV1ReservationRootElement = [[FSRESERVATIONV1ReservationRootElement alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1ReservationRootElement initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1ReservationRootElement dealloc];
    _fSRESERVATIONV1ReservationRootElement = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1ReservationRootElement autorelease];
  return _fSRESERVATIONV1ReservationRootElement;
}

/**
 * Initialize this instance of FSRESERVATIONV1ReservationRootElement according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1ReservationRootElement to the writer.
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
 * Reads a FSRESERVATIONV1ReservationRootElement from an XML reader. The element to be read is
 * "{http://api.familysearch.org/reservation/v1}reservation".
 *
 * @param reader The XML reader.
 * @return The FSRESERVATIONV1ReservationRootElement.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSRESERVATIONV1ReservationRootElement *_reservationRootElement = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/reservation/v1}reservation."];
    }
  }

  if (xmlStrcmp(BAD_CAST "reservation", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/reservation/v1}reservation.");
#endif
    _reservationRootElement = (FSRESERVATIONV1ReservationRootElement *)[FSRESERVATIONV1ReservationRootElement readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/reservation/v1}reservation.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSRESERVATIONV1ReservationRootElement. Expected element {http://api.familysearch.org/reservation/v1}reservation. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSRESERVATIONV1ReservationRootElement. Expected element {http://api.familysearch.org/reservation/v1}reservation. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _reservationRootElement;
}

/**
 * Writes this FSRESERVATIONV1ReservationRootElement to XML under element name "{http://api.familysearch.org/reservation/v1}reservation".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _reservationRootElement The ReservationRootElement to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSRESERVATIONV1ReservationRootElement to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "reservation", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/reservation/v1}reservation. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/reservation/v1}reservation...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:fsapi_v1", BAD_CAST "http://api.familysearch.org/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:fsapi_v1' on '{http://api.familysearch.org/reservation/v1}reservation'. XML writer status: %i\n", rc];
    }

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:reservation_v1", BAD_CAST "http://api.familysearch.org/reservation/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:reservation_v1' on '{http://api.familysearch.org/reservation/v1}reservation'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/reservation/v1}reservation...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/reservation/v1}reservationRootElement for root element {http://api.familysearch.org/reservation/v1}reservation...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/reservation/v1}reservationRootElement for root element {http://api.familysearch.org/reservation/v1}reservation...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/reservation/v1}reservation. XML writer status: %i\n", rc];
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
    && xmlStrcmp(BAD_CAST "persons", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}persons of type {http://api.familysearch.org/reservation/v1}persons.");
#endif
    __child = [FSRESERVATIONV1Persons readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}persons of type {http://api.familysearch.org/reservation/v1}persons.");
#endif

    [self setPersons: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "families", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}families of type {http://api.familysearch.org/reservation/v1}families.");
#endif
    __child = [FSRESERVATIONV1Families readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}families of type {http://api.familysearch.org/reservation/v1}families.");
#endif

    [self setFamilies: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "trips", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}trips of type {http://api.familysearch.org/reservation/v1}trips.");
#endif
    __child = [FSRESERVATIONV1Trips readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}trips of type {http://api.familysearch.org/reservation/v1}trips.");
#endif

    [self setTrips: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "cards", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}cards of type {http://api.familysearch.org/reservation/v1}cards.");
#endif
    __child = [FSRESERVATIONV1Cards readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}cards of type {http://api.familysearch.org/reservation/v1}cards.");
#endif

    [self setCards: __child];
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

  if ([self persons]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "persons", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}persons."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}persons...");
#endif
    [[self persons] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}persons...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}persons."];
    }
  }
  if ([self families]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "families", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}families."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}families...");
#endif
    [[self families] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}families...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}families."];
    }
  }
  if ([self trips]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "trips", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}trips."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}trips...");
#endif
    [[self trips] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}trips...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}trips."];
    }
  }
  if ([self cards]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "cards", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}cards."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}cards...");
#endif
    [[self cards] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}cards...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}cards."];
    }
  }
}
@end /* implementation FSRESERVATIONV1ReservationRootElement (JAXB) */

/**
 *  @author Ryan Heaton

 */
@implementation FSRESERVATIONV1ReservationError

/**
 * The trip to which this error refers.
 */
- (FSRESERVATIONV1ErrorReference *) trip
{
  return _trip;
}

/**
 * The trip to which this error refers.
 */
- (void) setTrip: (FSRESERVATIONV1ErrorReference *) newTrip
{
  [newTrip retain];
  [_trip release];
  _trip = newTrip;
}

/**
 * The person to which this error refers.
 */
- (FSRESERVATIONV1ErrorReference *) person
{
  return _person;
}

/**
 * The person to which this error refers.
 */
- (void) setPerson: (FSRESERVATIONV1ErrorReference *) newPerson
{
  [newPerson retain];
  [_person release];
  _person = newPerson;
}

/**
 * The card to which this error refers.
 */
- (FSRESERVATIONV1ErrorReference *) card
{
  return _card;
}

/**
 * The card to which this error refers.
 */
- (void) setCard: (FSRESERVATIONV1ErrorReference *) newCard
{
  [newCard retain];
  [_card release];
  _card = newCard;
}

/**
 * The reference to the baptism.
 */
- (FSRESERVATIONV1OrdinanceReference *) baptism
{
  return _baptism;
}

/**
 * The reference to the baptism.
 */
- (void) setBaptism: (FSRESERVATIONV1OrdinanceReference *) newBaptism
{
  [newBaptism retain];
  [_baptism release];
  _baptism = newBaptism;
}

/**
 * The reference to the confirmation.
 */
- (FSRESERVATIONV1OrdinanceReference *) confirmation
{
  return _confirmation;
}

/**
 * The reference to the confirmation.
 */
- (void) setConfirmation: (FSRESERVATIONV1OrdinanceReference *) newConfirmation
{
  [newConfirmation retain];
  [_confirmation release];
  _confirmation = newConfirmation;
}

/**
 * The reference to the initiatory.
 */
- (FSRESERVATIONV1OrdinanceReference *) initiatory
{
  return _initiatory;
}

/**
 * The reference to the initiatory.
 */
- (void) setInitiatory: (FSRESERVATIONV1OrdinanceReference *) newInitiatory
{
  [newInitiatory retain];
  [_initiatory release];
  _initiatory = newInitiatory;
}

/**
 * The reference to the endowment.
 */
- (FSRESERVATIONV1OrdinanceReference *) endowment
{
  return _endowment;
}

/**
 * The reference to the endowment.
 */
- (void) setEndowment: (FSRESERVATIONV1OrdinanceReference *) newEndowment
{
  [newEndowment retain];
  [_endowment release];
  _endowment = newEndowment;
}

/**
 * The reference to the sealing-to-spouse.
 */
- (FSRESERVATIONV1OrdinanceReference *) sealingToSpouse
{
  return _sealingToSpouse;
}

/**
 * The reference to the sealing-to-spouse.
 */
- (void) setSealingToSpouse: (FSRESERVATIONV1OrdinanceReference *) newSealingToSpouse
{
  [newSealingToSpouse retain];
  [_sealingToSpouse release];
  _sealingToSpouse = newSealingToSpouse;
}

/**
 * The reference to the sealing-to-parents.
 */
- (FSRESERVATIONV1OrdinanceReference *) sealingToParents
{
  return _sealingToParents;
}

/**
 * The reference to the sealing-to-parents.
 */
- (void) setSealingToParents: (FSRESERVATIONV1OrdinanceReference *) newSealingToParents
{
  [newSealingToParents retain];
  [_sealingToParents release];
  _sealingToParents = newSealingToParents;
}

- (void) dealloc
{
  [self setTrip: nil];
  [self setPerson: nil];
  [self setCard: nil];
  [self setBaptism: nil];
  [self setConfirmation: nil];
  [self setInitiatory: nil];
  [self setEndowment: nil];
  [self setSealingToSpouse: nil];
  [self setSealingToParents: nil];
  [super dealloc];
}
@end /* implementation FSRESERVATIONV1ReservationError */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSRESERVATIONV1ReservationError (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSRESERVATIONV1ReservationError (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSRESERVATIONV1ReservationError (JAXB)

/**
 * Read an instance of FSRESERVATIONV1ReservationError from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSRESERVATIONV1ReservationError defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSRESERVATIONV1ReservationError *_fSRESERVATIONV1ReservationError = [[FSRESERVATIONV1ReservationError alloc] init];
  NS_DURING
  {
    [_fSRESERVATIONV1ReservationError initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSRESERVATIONV1ReservationError dealloc];
    _fSRESERVATIONV1ReservationError = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSRESERVATIONV1ReservationError autorelease];
  return _fSRESERVATIONV1ReservationError;
}

/**
 * Initialize this instance of FSRESERVATIONV1ReservationError according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSRESERVATIONV1ReservationError to the writer.
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
    && xmlStrcmp(BAD_CAST "trip", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}trip of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif
    __child = [FSRESERVATIONV1ErrorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}trip of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif

    [self setTrip: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "person", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif
    __child = [FSRESERVATIONV1ErrorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}person of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif

    [self setPerson: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "card", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif
    __child = [FSRESERVATIONV1ErrorReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}card of type {http://api.familysearch.org/reservation/v1}errorReference.");
#endif

    [self setCard: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "baptism", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}baptism of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}baptism of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setBaptism: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "confirmation", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}confirmation of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}confirmation of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setConfirmation: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "initiatory", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}initiatory of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}initiatory of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setInitiatory: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "endowment", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}endowment of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}endowment of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setEndowment: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "sealingToSpouse", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}sealingToSpouse of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}sealingToSpouse of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setSealingToSpouse: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "sealingToParents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/reservation/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/reservation/v1}sealingToParents of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif
    __child = [FSRESERVATIONV1OrdinanceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/reservation/v1}sealingToParents of type {http://api.familysearch.org/reservation/v1}ordinanceReference.");
#endif

    [self setSealingToParents: __child];
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

  if ([self trip]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "trip", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}trip."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}trip...");
#endif
    [[self trip] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}trip...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}trip."];
    }
  }
  if ([self person]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "person", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}person."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}person...");
#endif
    [[self person] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}person...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}person."];
    }
  }
  if ([self card]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "card", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}card."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}card...");
#endif
    [[self card] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}card...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}card."];
    }
  }
  if ([self baptism]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "baptism", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}baptism."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}baptism...");
#endif
    [[self baptism] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}baptism...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}baptism."];
    }
  }
  if ([self confirmation]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "confirmation", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}confirmation."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}confirmation...");
#endif
    [[self confirmation] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}confirmation...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}confirmation."];
    }
  }
  if ([self initiatory]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "initiatory", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}initiatory."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}initiatory...");
#endif
    [[self initiatory] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}initiatory...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}initiatory."];
    }
  }
  if ([self endowment]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "endowment", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}endowment."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}endowment...");
#endif
    [[self endowment] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}endowment...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}endowment."];
    }
  }
  if ([self sealingToSpouse]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "sealingToSpouse", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}sealingToSpouse."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}sealingToSpouse...");
#endif
    [[self sealingToSpouse] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}sealingToSpouse...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}sealingToSpouse."];
    }
  }
  if ([self sealingToParents]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "reservation_v1", BAD_CAST "sealingToParents", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/reservation/v1}sealingToParents."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/reservation/v1}sealingToParents...");
#endif
    [[self sealingToParents] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/reservation/v1}sealingToParents...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/reservation/v1}sealingToParents."];
    }
  }
}
@end /* implementation FSRESERVATIONV1ReservationError (JAXB) */
