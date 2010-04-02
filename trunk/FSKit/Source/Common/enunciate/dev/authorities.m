#import "authorities.h"


/**
 *  An authority date.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1DateData

/**
 * true if the date is valid.
 */
- (BOOL *) valid
{
  return _valid;
}

/**
 * true if the date is valid.
 */
- (void) setValid: (BOOL *) newValid
{
  if (_valid != NULL) {
    free(_valid);
  }
  _valid = newValid;
}

/**
 * the date requested.
 */
- (NSString *) requested
{
  return _requested;
}

/**
 * the date requested.
 */
- (void) setRequested: (NSString *) newRequested
{
  [newRequested retain];
  [_requested release];
  _requested = newRequested;
}

/**
 * the date original.
 */
- (NSString *) original
{
  return _original;
}

/**
 * the date original.
 */
- (void) setOriginal: (NSString *) newOriginal
{
  [newOriginal retain];
  [_original release];
  _original = newOriginal;
}

/**
 * true if the date is ambiguous.
 */
- (BOOL *) ambiguous
{
  return _ambiguous;
}

/**
 * true if the date is ambiguous.
 */
- (void) setAmbiguous: (BOOL *) newAmbiguous
{
  if (_ambiguous != NULL) {
    free(_ambiguous);
  }
  _ambiguous = newAmbiguous;
}

/**
 * the date normalization.
 */
- (NSString *) normalized
{
  return _normalized;
}

/**
 * the date normalization.
 */
- (void) setNormalized: (NSString *) newNormalized
{
  [newNormalized retain];
  [_normalized release];
  _normalized = newNormalized;
}

/**
 * the date numeric.
 */
- (NSString *) numeric
{
  return _numeric;
}

/**
 * the date numeric.
 */
- (void) setNumeric: (NSString *) newNumeric
{
  [newNumeric retain];
  [_numeric release];
  _numeric = newNumeric;
}

/**
 * the astro day.
 */
- (NSString *) astro
{
  return _astro;
}

/**
 * the astro day.
 */
- (void) setAstro: (NSString *) newAstro
{
  [newAstro retain];
  [_astro release];
  _astro = newAstro;
}

/**
 * the earliest date.
 */
- (FSAUTHORITIESV1DateData *) earliest
{
  return _earliest;
}

/**
 * the earliest date.
 */
- (void) setEarliest: (FSAUTHORITIESV1DateData *) newEarliest
{
  [newEarliest retain];
  [_earliest release];
  _earliest = newEarliest;
}

/**
 * the latest date.
 */
- (FSAUTHORITIESV1DateData *) latest
{
  return _latest;
}

/**
 * the latest date.
 */
- (void) setLatest: (FSAUTHORITIESV1DateData *) newLatest
{
  [newLatest retain];
  [_latest release];
  _latest = newLatest;
}

- (void) dealloc
{
  [self setValid: NULL];
  [self setRequested: nil];
  [self setOriginal: nil];
  [self setAmbiguous: NULL];
  [self setNormalized: nil];
  [self setNumeric: nil];
  [self setAstro: nil];
  [self setEarliest: nil];
  [self setLatest: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1DateData */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1DateData (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1DateData (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1DateData (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1DateData from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1DateData defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1DateData *_fSAUTHORITIESV1DateData = [[FSAUTHORITIESV1DateData alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1DateData initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1DateData dealloc];
    _fSAUTHORITIESV1DateData = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1DateData autorelease];
  return _fSAUTHORITIESV1DateData;
}

/**
 * Initialize this instance of FSAUTHORITIESV1DateData according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1DateData to the writer.
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

  if ((xmlStrcmp(BAD_CAST "valid", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}valid...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}valid."];
    }
    [self setValid: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}valid...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "requested", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}requested...");
#endif
    [self setRequested: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}requested...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}original...");
#endif
    [self setOriginal: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}original...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "ambiguous", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}ambiguous...");
#endif
    _child_accessor = xmlTextReaderReadBooleanType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}ambiguous."];
    }
    [self setAmbiguous: ((BOOL*) _child_accessor)];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}ambiguous...");
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
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}normalized of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setNormalized: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "numeric", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}numeric of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}numeric of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setNumeric: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "astro", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}astro of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}astro of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setAstro: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "earliest", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}earliest of type {http://api.familysearch.org/authorities/v1}date.");
#endif
    __child = [FSAUTHORITIESV1DateData readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}earliest of type {http://api.familysearch.org/authorities/v1}date.");
#endif

    [self setEarliest: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "latest", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}latest of type {http://api.familysearch.org/authorities/v1}date.");
#endif
    __child = [FSAUTHORITIESV1DateData readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}latest of type {http://api.familysearch.org/authorities/v1}date.");
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

  if ([self valid] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "valid", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}valid."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}valid...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self valid]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}valid."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}valid...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}valid."];
    }
  }
  if ([self requested]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "requested", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}requested."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}requested...");
#endif
    [[self requested] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}requested...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}requested."];
    }
  }
  if ([self original]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}original...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}original."];
    }
  }
  if ([self ambiguous] != NULL) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "ambiguous", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}ambiguous."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}ambiguous...");
#endif
    status = xmlTextWriterWriteBooleanType(writer, [self ambiguous]);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}ambiguous."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}ambiguous...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}ambiguous."];
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

  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}normalized."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}normalized...");
#endif
    [[self normalized] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}normalized...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}normalized."];
    }
  }
  if ([self numeric]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "numeric", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}numeric."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}numeric...");
#endif
    [[self numeric] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}numeric...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}numeric."];
    }
  }
  if ([self astro]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "astro", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}astro."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}astro...");
#endif
    [[self astro] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}astro...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}astro."];
    }
  }
  if ([self earliest]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "earliest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}earliest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}earliest...");
#endif
    [[self earliest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}earliest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}earliest."];
    }
  }
  if ([self latest]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "latest", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}latest."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}latest...");
#endif
    [[self latest] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}latest...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}latest."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1DateData (JAXB) */

/**
 *  A name authority name piece group.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1NameEncodings

/**
 * the name piece soundex code.
 */
- (NSString *) soundex
{
  return _soundex;
}

/**
 * the name piece soundex code.
 */
- (void) setSoundex: (NSString *) newSoundex
{
  [newSoundex retain];
  [_soundex release];
  _soundex = newSoundex;
}

/**
 * the name piece phondex code.
 */
- (NSString *) phondex
{
  return _phondex;
}

/**
 * the name piece phondex code.
 */
- (void) setPhondex: (NSString *) newPhondex
{
  [newPhondex retain];
  [_phondex release];
  _phondex = newPhondex;
}

/**
 * the name piece NYSIIS code.
 */
- (NSString *) nysiis
{
  return _nysiis;
}

/**
 * the name piece NYSIIS code.
 */
- (void) setNysiis: (NSString *) newNysiis
{
  [newNysiis retain];
  [_nysiis release];
  _nysiis = newNysiis;
}

- (void) dealloc
{
  [self setSoundex: nil];
  [self setPhondex: nil];
  [self setNysiis: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1NameEncodings */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1NameEncodings (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1NameEncodings (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1NameEncodings (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1NameEncodings from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1NameEncodings defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1NameEncodings *_fSAUTHORITIESV1NameEncodings = [[FSAUTHORITIESV1NameEncodings alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1NameEncodings initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1NameEncodings dealloc];
    _fSAUTHORITIESV1NameEncodings = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1NameEncodings autorelease];
  return _fSAUTHORITIESV1NameEncodings;
}

/**
 * Initialize this instance of FSAUTHORITIESV1NameEncodings according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1NameEncodings to the writer.
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
    && xmlStrcmp(BAD_CAST "soundex", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}soundex of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}soundex of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setSoundex: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "phondex", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}phondex of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}phondex of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPhondex: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "nysiis", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}nysiis of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}nysiis of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setNysiis: __child];
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

  if ([self soundex]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "soundex", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}soundex."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}soundex...");
#endif
    [[self soundex] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}soundex...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}soundex."];
    }
  }
  if ([self phondex]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "phondex", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}phondex."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}phondex...");
#endif
    [[self phondex] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}phondex...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}phondex."];
    }
  }
  if ([self nysiis]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "nysiis", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}nysiis."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}nysiis...");
#endif
    [[self nysiis] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}nysiis...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}nysiis."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1NameEncodings (JAXB) */

/**
 *  A name authority name.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Name

/**
 * the name original.
 */
- (NSString *) original
{
  return _original;
}

/**
 * the name original.
 */
- (void) setOriginal: (NSString *) newOriginal
{
  [newOriginal retain];
  [_original release];
  _original = newOriginal;
}

/**
 * a collection of name authority name pieces.
 */
- (NSArray *) pieces
{
  return _pieces;
}

/**
 * a collection of name authority name pieces.
 */
- (void) setPieces: (NSArray *) newPieces
{
  [newPieces retain];
  [_pieces release];
  _pieces = newPieces;
}

/**
 * a collection of name authority name fields.
 */
- (NSArray *) fields
{
  return _fields;
}

/**
 * a collection of name authority name fields.
 */
- (void) setFields: (NSArray *) newFields
{
  [newFields retain];
  [_fields release];
  _fields = newFields;
}

- (void) dealloc
{
  [self setOriginal: nil];
  [self setPieces: nil];
  [self setFields: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1Name */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Name (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Name (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Name (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Name from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Name defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Name *_fSAUTHORITIESV1Name = [[FSAUTHORITIESV1Name alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Name initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Name dealloc];
    _fSAUTHORITIESV1Name = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Name autorelease];
  return _fSAUTHORITIESV1Name;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Name according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Name to the writer.
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

  if ((xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}original...");
#endif
    [self setOriginal: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}original...");
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
    && xmlStrcmp(BAD_CAST "pieces", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}pieces...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}pieces"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}piece of type {http://api.familysearch.org/authorities/v1}namePiece.");
#endif

    __child = [FSAUTHORITIESV1NamePiece readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}piece of type {http://api.familysearch.org/authorities/v1}namePiece.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}pieces...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}pieces"
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
    && xmlStrcmp(BAD_CAST "fields", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}fields...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}fields"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}field of type {http://api.familysearch.org/authorities/v1}nameField.");
#endif

    __child = [FSAUTHORITIESV1NameField readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}field of type {http://api.familysearch.org/authorities/v1}nameField.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}fields...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}fields"
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

  if ([self original]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}original...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}original."];
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

  if ([self pieces]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "pieces", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}pieces."];
    }
    __enumerator = [[self pieces] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "piece", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}piece."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}piece...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}piece...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}piece."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}pieces."];
    }
  }
  if ([self fields]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "fields", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}fields."];
    }
    __enumerator = [[self fields] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "field", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}field."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}field...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}field...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}field."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}fields."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1Name (JAXB) */

/**
 *  A list of authority dates.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Dates

/**
 * the number of authority date interpretations.
 */
- (int) count
{
  return _count;
}

/**
 * the number of authority date interpretations.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * the date authority version.
 */
- (NSString *) version
{
  return _version;
}

/**
 * the date authority version.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * a list of authority date interpretations.
 */
- (NSArray *) dateItems
{
  return _dateItems;
}

/**
 * a list of authority date interpretations.
 */
- (void) setDateItems: (NSArray *) newDateItems
{
  [newDateItems retain];
  [_dateItems release];
  _dateItems = newDateItems;
}

- (void) dealloc
{
  [self setVersion: nil];
  [self setDateItems: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1Dates */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Dates (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Dates (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Dates (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Dates from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Dates defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Dates *_fSAUTHORITIESV1Dates = [[FSAUTHORITIESV1Dates alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Dates initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Dates dealloc];
    _fSAUTHORITIESV1Dates = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Dates autorelease];
  return _fSAUTHORITIESV1Dates;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Dates according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Dates to the writer.
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
    && xmlStrcmp(BAD_CAST "date", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}date of type {http://api.familysearch.org/authorities/v1}date.");
#endif

    __child = [FSAUTHORITIESV1DateData readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}date of type {http://api.familysearch.org/authorities/v1}date.");
#endif

    if ([self dateItems]) {
      [self setDateItems: [[self dateItems] arrayByAddingObject: __child]];
    }
    else {
      [self setDateItems: [NSArray arrayWithObject: __child]];
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

  if ([self dateItems]) {
    __enumerator = [[self dateItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "date", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}date."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}date...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}date...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}date."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSAUTHORITIESV1Dates (JAXB) */

/**
 *  A name authority name field.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1NameField

/**
 * the name field text.
 */
- (NSString *) text
{
  return _text;
}

/**
 * the name field text.
 */
- (void) setText: (NSString *) newText
{
  [newText retain];
  [_text release];
  _text = newText;
}

/**
 * the name field type.
 */
- (enum FSAUTHORITIESV1NameFieldType *) type
{
  return _type;
}

/**
 * the name field type.
 */
- (void) setType: (enum FSAUTHORITIESV1NameFieldType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

- (void) dealloc
{
  [self setText: nil];
  [self setType: NULL];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1NameField */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1NameField (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1NameField (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1NameField (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1NameField from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1NameField defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1NameField *_fSAUTHORITIESV1NameField = [[FSAUTHORITIESV1NameField alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1NameField initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1NameField dealloc];
    _fSAUTHORITIESV1NameField = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1NameField autorelease];
  return _fSAUTHORITIESV1NameField;
}

/**
 * Initialize this instance of FSAUTHORITIESV1NameField according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1NameField to the writer.
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

  if ((xmlStrcmp(BAD_CAST "text", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}text...");
#endif
    [self setText: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}text...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSAUTHORITIESV1NameFieldTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSAUTHORITIESV1NameFieldType*) _child_accessor)];
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

  if ([self text]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "text", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}text."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}text...");
#endif
    [[self text] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}text...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}text."];
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
    status = xmlTextWriterWriteFSAUTHORITIESV1NameFieldTypeType(writer, [self type]);
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
@end /* implementation FSAUTHORITIESV1NameField (JAXB) */

/**
 *  A name authority name piece or segment.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1NamePiece

/**
 * the name piece text.
 */
- (NSString *) text
{
  return _text;
}

/**
 * the name piece text.
 */
- (void) setText: (NSString *) newText
{
  [newText retain];
  [_text release];
  _text = newText;
}

/**
 * the name piece type.
 */
- (enum FSAUTHORITIESV1NamePieceType *) type
{
  return _type;
}

/**
 * the name piece type.
 */
- (void) setType: (enum FSAUTHORITIESV1NamePieceType *) newType
{
  if (_type != NULL) {
    free(_type);
  }
  _type = newType;
}

/**
 * the name piece predelimiters text.
 */
- (NSString *) predelimiters
{
  return _predelimiters;
}

/**
 * the name piece predelimiters text.
 */
- (void) setPredelimiters: (NSString *) newPredelimiters
{
  [newPredelimiters retain];
  [_predelimiters release];
  _predelimiters = newPredelimiters;
}

/**
 * the name piece value.
 */
- (NSString *) value
{
  return _value;
}

/**
 * the name piece value.
 */
- (void) setValue: (NSString *) newValue
{
  [newValue retain];
  [_value release];
  _value = newValue;
}

/**
 * the name piece postdelimiters text.
 */
- (NSString *) postdelimiters
{
  return _postdelimiters;
}

/**
 * the name piece postdelimiters text.
 */
- (void) setPostdelimiters: (NSString *) newPostdelimiters
{
  [newPostdelimiters retain];
  [_postdelimiters release];
  _postdelimiters = newPostdelimiters;
}

/**
 * the name piece encodings.
 */
- (FSAUTHORITIESV1NameEncodings *) encodings
{
  return _encodings;
}

/**
 * the name piece encodings.
 */
- (void) setEncodings: (FSAUTHORITIESV1NameEncodings *) newEncodings
{
  [newEncodings retain];
  [_encodings release];
  _encodings = newEncodings;
}

/**
 * the name piece variants.
 */
- (NSArray *) variants
{
  return _variants;
}

/**
 * the name piece variants.
 */
- (void) setVariants: (NSArray *) newVariants
{
  [newVariants retain];
  [_variants release];
  _variants = newVariants;
}

- (void) dealloc
{
  [self setText: nil];
  [self setType: NULL];
  [self setPredelimiters: nil];
  [self setValue: nil];
  [self setPostdelimiters: nil];
  [self setEncodings: nil];
  [self setVariants: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1NamePiece */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1NamePiece (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1NamePiece (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1NamePiece (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1NamePiece from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1NamePiece defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1NamePiece *_fSAUTHORITIESV1NamePiece = [[FSAUTHORITIESV1NamePiece alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1NamePiece initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1NamePiece dealloc];
    _fSAUTHORITIESV1NamePiece = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1NamePiece autorelease];
  return _fSAUTHORITIESV1NamePiece;
}

/**
 * Initialize this instance of FSAUTHORITIESV1NamePiece according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1NamePiece to the writer.
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

  if ((xmlStrcmp(BAD_CAST "text", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}text...");
#endif
    [self setText: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}text...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    _child_accessor = xmlTextReaderReadFSAUTHORITIESV1NamePieceTypeType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}type."];
    }
    [self setType: ((enum FSAUTHORITIESV1NamePieceType*) _child_accessor)];
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}predelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPredelimiters: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "value", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}value of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setValue: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "postdelimiters", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}postdelimiters of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setPostdelimiters: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "encodings", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}encodings of type {http://api.familysearch.org/authorities/v1}nameEncodings.");
#endif
    __child = [FSAUTHORITIESV1NameEncodings readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}encodings of type {http://api.familysearch.org/authorities/v1}nameEncodings.");
#endif

    [self setEncodings: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "variants", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}variants of type {http://api.familysearch.org/authorities/v1}nameVariants.");
#endif

    __child = [FSAUTHORITIESV1NameVariants readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}variants of type {http://api.familysearch.org/authorities/v1}nameVariants.");
#endif

    if ([self variants]) {
      [self setVariants: [[self variants] arrayByAddingObject: __child]];
    }
    else {
      [self setVariants: [NSArray arrayWithObject: __child]];
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

  if ([self text]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "text", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}text."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}text...");
#endif
    [[self text] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}text...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}text."];
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
    status = xmlTextWriterWriteFSAUTHORITIESV1NamePieceTypeType(writer, [self type]);
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
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "predelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}predelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}predelimiters...");
#endif
    [[self predelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}predelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}predelimiters."];
    }
  }
  if ([self value]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "value", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}value."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}value...");
#endif
    [[self value] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}value...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}value."];
    }
  }
  if ([self postdelimiters]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "postdelimiters", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}postdelimiters."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}postdelimiters...");
#endif
    [[self postdelimiters] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}postdelimiters...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}postdelimiters."];
    }
  }
  if ([self encodings]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "encodings", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}encodings."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}encodings...");
#endif
    [[self encodings] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}encodings...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}encodings."];
    }
  }
  if ([self variants]) {
    __enumerator = [[self variants] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "variants", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}variants."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}variants...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}variants...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}variants."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSAUTHORITIESV1NamePiece (JAXB) */

/**
 *  A authority name piece variants.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1NameVariants

/**
 * the name piece variants id.
 */
- (int) id
{
  return _id;
}

/**
 * the name piece variants id.
 */
- (void) setId: (int) newId
{
  _id = newId;
}

/**
 * the name piece variants culture id.
 */
- (unsigned char) culture
{
  return _culture;
}

/**
 * the name piece variants culture id.
 */
- (void) setCulture: (unsigned char) newCulture
{
  _culture = newCulture;
}

/**
 * a collection of the name piece variants.
 */
- (NSArray *) variants
{
  return _variants;
}

/**
 * a collection of the name piece variants.
 */
- (void) setVariants: (NSArray *) newVariants
{
  [newVariants retain];
  [_variants release];
  _variants = newVariants;
}

- (void) dealloc
{
  [self setVariants: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1NameVariants */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1NameVariants (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1NameVariants (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1NameVariants (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1NameVariants from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1NameVariants defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1NameVariants *_fSAUTHORITIESV1NameVariants = [[FSAUTHORITIESV1NameVariants alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1NameVariants initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1NameVariants dealloc];
    _fSAUTHORITIESV1NameVariants = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1NameVariants autorelease];
  return _fSAUTHORITIESV1NameVariants;
}

/**
 * Initialize this instance of FSAUTHORITIESV1NameVariants according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1NameVariants to the writer.
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
    _child_accessor = xmlTextReaderReadIntType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}id."];
    }
    [self setId: *((int*) _child_accessor)];
    free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}id...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "culture", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}culture...");
#endif
    _child_accessor = xmlTextReaderReadByteType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to read the attribute value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading attribute {}culture."];
    }
    [self setCulture: *((unsigned char*) _child_accessor)];
    free(_child_accessor);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}culture...");
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
    && xmlStrcmp(BAD_CAST "variant", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}variant of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}variant of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    if ([self variants]) {
      [self setVariants: [[self variants] arrayByAddingObject: __child]];
    }
    else {
      [self setVariants: [NSArray arrayWithObject: __child]];
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

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "id", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}id."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}id...");
#endif
    status = xmlTextWriterWriteIntType(writer, &_id);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}id."];
    }
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

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "culture", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}culture."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}culture...");
#endif
    status = xmlTextWriterWriteByteType(writer, &_culture);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute {}culture."];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}culture...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}culture."];
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

  if ([self variants]) {
    __enumerator = [[self variants] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "variant", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}variant."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}variant...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}variant...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}variant."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSAUTHORITIESV1NameVariants (JAXB) */

/**
 *  A place authority place.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Place

/**
 * the id of the place.
 */
- (NSString *) id
{
  return _id;
}

/**
 * the id of the place.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * the ISO code.
 */
- (NSString *) iso
{
  return _iso;
}

/**
 * the ISO code.
 */
- (void) setIso: (NSString *) newIso
{
  [newIso retain];
  [_iso release];
  _iso = newIso;
}

/**
 * the place original.
 */
- (NSString *) original
{
  return _original;
}

/**
 * the place original.
 */
- (void) setOriginal: (NSString *) newOriginal
{
  [newOriginal retain];
  [_original release];
  _original = newOriginal;
}

/**
 * the place type.
 */
- (NSString *) type
{
  return _type;
}

/**
 * the place type.
 */
- (void) setType: (NSString *) newType
{
  [newType retain];
  [_type release];
  _type = newType;
}

/**
 * the place culture id.
 */
- (NSString *) culture
{
  return _culture;
}

/**
 * the place culture id.
 */
- (void) setCulture: (NSString *) newCulture
{
  [newCulture retain];
  [_culture release];
  _culture = newCulture;
}

/**
 * a collection of normalized standard names of the place.
 */
- (NSArray *) normalized
{
  return _normalized;
}

/**
 * a collection of normalized standard names of the place.
 */
- (void) setNormalized: (NSArray *) newNormalized
{
  [newNormalized retain];
  [_normalized release];
  _normalized = newNormalized;
}

/**
 * the official name of the place.
 */
- (NSString *) official
{
  return _official;
}

/**
 * the official name of the place.
 */
- (void) setOfficial: (NSString *) newOfficial
{
  [newOfficial retain];
  [_official release];
  _official = newOfficial;
}

/**
 * the place location.
 */
- (FSAUTHORITIESV1PlaceLocation *) location
{
  return _location;
}

/**
 * the place location.
 */
- (void) setLocation: (FSAUTHORITIESV1PlaceLocation *) newLocation
{
  [newLocation retain];
  [_location release];
  _location = newLocation;
}

/**
 * A collection of the parent places.
 */
- (NSArray *) parents
{
  return _parents;
}

/**
 * A collection of the parent places.
 */
- (void) setParents: (NSArray *) newParents
{
  [newParents retain];
  [_parents release];
  _parents = newParents;
}

/**
 * a collection of the child places.
 */
- (NSArray *) children
{
  return _children;
}

/**
 * a collection of the child places.
 */
- (void) setChildren: (NSArray *) newChildren
{
  [newChildren retain];
  [_children release];
  _children = newChildren;
}

/**
 * a collection of the variant names.
 */
- (NSArray *) variants
{
  return _variants;
}

/**
 * a collection of the variant names.
 */
- (void) setVariants: (NSArray *) newVariants
{
  [newVariants retain];
  [_variants release];
  _variants = newVariants;
}

- (void) dealloc
{
  [self setId: nil];
  [self setIso: nil];
  [self setOriginal: nil];
  [self setType: nil];
  [self setCulture: nil];
  [self setNormalized: nil];
  [self setOfficial: nil];
  [self setLocation: nil];
  [self setParents: nil];
  [self setChildren: nil];
  [self setVariants: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1Place */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Place (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Place (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Place (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Place from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Place defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Place *_fSAUTHORITIESV1Place = [[FSAUTHORITIESV1Place alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Place initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Place dealloc];
    _fSAUTHORITIESV1Place = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Place autorelease];
  return _fSAUTHORITIESV1Place;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Place according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Place to the writer.
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

  if ((xmlStrcmp(BAD_CAST "iso", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}iso...");
#endif
    [self setIso: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}iso...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "original", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}original...");
#endif
    [self setOriginal: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}original...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "type", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}type...");
#endif
    [self setType: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}type...");
#endif
    return YES;
  }

  if ((xmlStrcmp(BAD_CAST "culture", xmlTextReaderConstLocalName(reader)) == 0) && (xmlTextReaderConstNamespaceUri(reader) == NULL)) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read attribute {}culture...");
#endif
    [self setCulture: (NSString*) [NSString readXMLType: reader]];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read attribute {}culture...");
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
    && xmlStrcmp(BAD_CAST "normalized", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}normalized...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}normalized"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}form of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}form of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    if ([self normalized]) {
      [self setNormalized: [[self normalized] arrayByAddingObject: __child]];
    }
    else {
      [self setNormalized: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}normalized...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}normalized"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setNormalized: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "official", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}official of type {http://www.w3.org/2001/XMLSchema}string.");
#endif
    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}official of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    [self setOfficial: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "location", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}location of type {http://api.familysearch.org/authorities/v1}placeLocation.");
#endif
    __child = [FSAUTHORITIESV1PlaceLocation readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}location of type {http://api.familysearch.org/authorities/v1}placeLocation.");
#endif

    [self setLocation: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "parents", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}parents...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}parents"
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
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}placeReference.");
#endif

    __child = [FSAUTHORITIESV1PlaceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}placeReference.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}parents...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}parents"
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
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}children...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}children"
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
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}placeReference.");
#endif

    __child = [FSAUTHORITIESV1PlaceReference readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}placeReference.");
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
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}children...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}children"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setChildren: (NSArray*) __child];
    }

    return YES;
  } // end "if wrapper element" clause
  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "variants", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}variants...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}variants"
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
    && xmlStrcmp(BAD_CAST "variant", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}variant of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    __child = [NSString readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}variant of type {http://www.w3.org/2001/XMLSchema}string.");
#endif

    if ([self variants]) {
      [self setVariants: [[self variants] arrayByAddingObject: __child]];
    }
    else {
      [self setVariants: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}variants...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}variants"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setVariants: (NSArray*) __child];
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
  if ([self iso]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "iso", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}iso."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}iso...");
#endif
    [[self iso] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}iso...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}iso."];
    }
  }
  if ([self original]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "original", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}original."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}original...");
#endif
    [[self original] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}original...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}original."];
    }
  }
  if ([self type]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "type", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}type."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}type...");
#endif
    [[self type] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}type...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}type."];
    }
  }
  if ([self culture]) {

    status = xmlTextWriterStartAttributeNS(writer, NULL, BAD_CAST "culture", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start attribute {}culture."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing attribute {}culture...");
#endif
    [[self culture] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote attribute {}culture...");
#endif

    status = xmlTextWriterEndAttribute(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end attribute {}culture."];
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

  if ([self normalized]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "normalized", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}normalized."];
    }
    __enumerator = [[self normalized] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "form", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}form."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}form...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}form...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}form."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}normalized."];
    }
  }
  if ([self official]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "official", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}official."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}official...");
#endif
    [[self official] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}official...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}official."];
    }
  }
  if ([self location]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "location", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}location."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}location...");
#endif
    [[self location] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}location...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}location."];
    }
  }
  if ([self parents]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "parents", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}parents."];
    }
    __enumerator = [[self parents] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "place", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}place."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}place...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}place...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}place."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}parents."];
    }
  }
  if ([self children]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "children", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}children."];
    }
    __enumerator = [[self children] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "place", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}place."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}place...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}place...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}place."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}children."];
    }
  }
  if ([self variants]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "variants", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}variants."];
    }
    __enumerator = [[self variants] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "variant", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}variant."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}variant...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}variant...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}variant."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}variants."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1Place (JAXB) */

/**
 *  A place authority place location.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1PlacePoint

/**
 * the latitude of the place.
 */
- (double) latitude
{
  return _latitude;
}

/**
 * the latitude of the place.
 */
- (void) setLatitude: (double) newLatitude
{
  _latitude = newLatitude;
}

/**
 * the longitude of the place.
 */
- (double) longitude
{
  return _longitude;
}

/**
 * the longitude of the place.
 */
- (void) setLongitude: (double) newLongitude
{
  _longitude = newLongitude;
}

- (void) dealloc
{
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1PlacePoint */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1PlacePoint (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1PlacePoint (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1PlacePoint (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1PlacePoint from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1PlacePoint defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1PlacePoint *_fSAUTHORITIESV1PlacePoint = [[FSAUTHORITIESV1PlacePoint alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1PlacePoint initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1PlacePoint dealloc];
    _fSAUTHORITIESV1PlacePoint = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1PlacePoint autorelease];
  return _fSAUTHORITIESV1PlacePoint;
}

/**
 * Initialize this instance of FSAUTHORITIESV1PlacePoint according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1PlacePoint to the writer.
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
    && xmlStrcmp(BAD_CAST "latitude", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadDoubleType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setLatitude: *((double*) _child_accessor)];
    free(_child_accessor);
    return YES;
  }

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "longitude", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    _child_accessor = xmlTextReaderReadDoubleType(reader);
    if (_child_accessor == NULL) {
      //panic: unable to return the value for some reason.
      [self dealloc];
      [NSException raise: @"XMLReadError"
                   format: @"Error reading element value."];
    }
    [self setLongitude: *((double*) _child_accessor)];
    free(_child_accessor);
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

  if (YES) { //always write the primitive element...
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "latitude", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}latitude."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}latitude...");
#endif
    status = xmlTextWriterWriteDoubleType(writer, &_latitude);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}latitude...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/authorities/v1}latitude."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}latitude."];
    }
  }
  if (YES) { //always write the primitive element...
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "longitude", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}longitude."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}longitude...");
#endif
    status = xmlTextWriterWriteDoubleType(writer, &_longitude);
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}longitude...");
#endif
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing child element {http://api.familysearch.org/authorities/v1}longitude."];
    }

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}longitude."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1PlacePoint (JAXB) */

/**
 *  A list of place authority places.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Places

/**
 * the number of authority places.
 */
- (int) count
{
  return _count;
}

/**
 * the number of authority places.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * the place authority version.
 */
- (NSString *) version
{
  return _version;
}

/**
 * the place authority version.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * a list of place authority places.
 */
- (NSArray *) placeItems
{
  return _placeItems;
}

/**
 * a list of place authority places.
 */
- (void) setPlaceItems: (NSArray *) newPlaceItems
{
  [newPlaceItems retain];
  [_placeItems release];
  _placeItems = newPlaceItems;
}

- (void) dealloc
{
  [self setVersion: nil];
  [self setPlaceItems: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1Places */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Places (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Places (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Places (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Places from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Places defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Places *_fSAUTHORITIESV1Places = [[FSAUTHORITIESV1Places alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Places initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Places dealloc];
    _fSAUTHORITIESV1Places = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Places autorelease];
  return _fSAUTHORITIESV1Places;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Places according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Places to the writer.
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
    && xmlStrcmp(BAD_CAST "place", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}place.");
#endif

    __child = [FSAUTHORITIESV1Place readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}place of type {http://api.familysearch.org/authorities/v1}place.");
#endif

    if ([self placeItems]) {
      [self setPlaceItems: [[self placeItems] arrayByAddingObject: __child]];
    }
    else {
      [self setPlaceItems: [NSArray arrayWithObject: __child]];
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

  if ([self placeItems]) {
    __enumerator = [[self placeItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "place", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}place."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}place...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}place...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}place."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSAUTHORITIESV1Places (JAXB) */

/**
 *  A place authority place reference.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1PlaceReference

/**
 * the place reference(id).
 */
- (NSString *) ref
{
  return _ref;
}

/**
 * the place reference(id).
 */
- (void) setRef: (NSString *) newRef
{
  [newRef retain];
  [_ref release];
  _ref = newRef;
}

/**
 * the standard place name.
 */
- (NSString *) name
{
  return _name;
}

/**
 * the standard place name.
 */
- (void) setName: (NSString *) newName
{
  [newName retain];
  [_name release];
  _name = newName;
}

- (void) dealloc
{
  [self setRef: nil];
  [self setName: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1PlaceReference */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1PlaceReference (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1PlaceReference (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1PlaceReference (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1PlaceReference from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1PlaceReference defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1PlaceReference *_fSAUTHORITIESV1PlaceReference = [[FSAUTHORITIESV1PlaceReference alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1PlaceReference initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1PlaceReference dealloc];
    _fSAUTHORITIESV1PlaceReference = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1PlaceReference autorelease];
  return _fSAUTHORITIESV1PlaceReference;
}

/**
 * Initialize this instance of FSAUTHORITIESV1PlaceReference according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1PlaceReference to the writer.
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
@end /* implementation FSAUTHORITIESV1PlaceReference (JAXB) */

/**
 *  A place authority place location.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1PlaceLocation

/**
 * the point of the place.
 */
- (FSAUTHORITIESV1PlacePoint *) point
{
  return _point;
}

/**
 * the point of the place.
 */
- (void) setPoint: (FSAUTHORITIESV1PlacePoint *) newPoint
{
  [newPoint retain];
  [_point release];
  _point = newPoint;
}

- (void) dealloc
{
  [self setPoint: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1PlaceLocation */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1PlaceLocation (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1PlaceLocation (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1PlaceLocation (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1PlaceLocation from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1PlaceLocation defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1PlaceLocation *_fSAUTHORITIESV1PlaceLocation = [[FSAUTHORITIESV1PlaceLocation alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1PlaceLocation initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1PlaceLocation dealloc];
    _fSAUTHORITIESV1PlaceLocation = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1PlaceLocation autorelease];
  return _fSAUTHORITIESV1PlaceLocation;
}

/**
 * Initialize this instance of FSAUTHORITIESV1PlaceLocation according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1PlaceLocation to the writer.
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
    && xmlStrcmp(BAD_CAST "point", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}point of type {http://api.familysearch.org/authorities/v1}placePoint.");
#endif
    __child = [FSAUTHORITIESV1PlacePoint readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}point of type {http://api.familysearch.org/authorities/v1}placePoint.");
#endif

    [self setPoint: __child];
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

  if ([self point]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "point", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}point."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}point...");
#endif
    [[self point] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}point...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}point."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1PlaceLocation (JAXB) */

/**
 *  A list of name authority names.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Names

/**
 * the number of authority names.
 */
- (int) count
{
  return _count;
}

/**
 * the number of authority names.
 */
- (void) setCount: (int) newCount
{
  _count = newCount;
}

/**
 * the name authority version.
 */
- (NSString *) version
{
  return _version;
}

/**
 * the name authority version.
 */
- (void) setVersion: (NSString *) newVersion
{
  [newVersion retain];
  [_version release];
  _version = newVersion;
}

/**
 * a list of name authority names.
 */
- (NSArray *) nameItems
{
  return _nameItems;
}

/**
 * a list of name authority names.
 */
- (void) setNameItems: (NSArray *) newNameItems
{
  [newNameItems retain];
  [_nameItems release];
  _nameItems = newNameItems;
}

- (void) dealloc
{
  [self setVersion: nil];
  [self setNameItems: nil];
  [super dealloc];
}
@end /* implementation FSAUTHORITIESV1Names */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Names (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Names (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Names (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Names from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Names defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Names *_fSAUTHORITIESV1Names = [[FSAUTHORITIESV1Names alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Names initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Names dealloc];
    _fSAUTHORITIESV1Names = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Names autorelease];
  return _fSAUTHORITIESV1Names;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Names according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Names to the writer.
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
    && xmlStrcmp(BAD_CAST "name", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}name of type {http://api.familysearch.org/authorities/v1}name.");
#endif

    __child = [FSAUTHORITIESV1Name readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}name of type {http://api.familysearch.org/authorities/v1}name.");
#endif

    if ([self nameItems]) {
      [self setNameItems: [[self nameItems] arrayByAddingObject: __child]];
    }
    else {
      [self setNameItems: [NSArray arrayWithObject: __child]];
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

  if ([self nameItems]) {
    __enumerator = [[self nameItems] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "name", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}name."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}name...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}name...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}name."];
      }
    } //end item iterator.
  }
}
@end /* implementation FSAUTHORITIESV1Names (JAXB) */

/**
 *  An authority culture.

 @author Rob Lyon

 */
@implementation FSAUTHORITIESV1Culture

/**
 * the authority culture id.
 */
- (NSString *) id
{
  return _id;
}

/**
 * the authority culture id.
 */
- (void) setId: (NSString *) newId
{
  [newId retain];
  [_id release];
  _id = newId;
}

/**
 * the authority culture name.
 */
- (NSString *) name
{
  return _name;
}

/**
 * the authority culture name.
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
@end /* implementation FSAUTHORITIESV1Culture */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Culture (JAXB) <JAXBReading, JAXBWriting, JAXBType>

@end /*interface FSAUTHORITIESV1Culture (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Culture (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Culture from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Culture defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Culture *_fSAUTHORITIESV1Culture = [[FSAUTHORITIESV1Culture alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Culture initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Culture dealloc];
    _fSAUTHORITIESV1Culture = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Culture autorelease];
  return _fSAUTHORITIESV1Culture;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Culture according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Culture to the writer.
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
@end /* implementation FSAUTHORITIESV1Culture (JAXB) */

/**
 * Reads a NamePieceType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NamePieceType, or NULL if unable to be read.
 */
static enum FSAUTHORITIESV1NamePieceType *xmlTextReaderReadFSAUTHORITIESV1NamePieceTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSAUTHORITIESV1NamePieceType *value = calloc(1, sizeof(enum FSAUTHORITIESV1NamePieceType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Given") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_GIVEN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Other") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_OTHER;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Prefix") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_PREFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Suffix") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_SUFFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_FAMILY;
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
static int xmlTextWriterWriteFSAUTHORITIESV1NamePieceTypeType(xmlTextWriterPtr writer, enum FSAUTHORITIESV1NamePieceType *_namePieceType)
{
  switch (*_namePieceType) {
    case AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_GIVEN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Given");
    case AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_OTHER:
      return xmlTextWriterWriteString(writer, BAD_CAST "Other");
    case AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_PREFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Prefix");
    case AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_SUFFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Suffix");
    case AUTHORITIES_AUTHORITIES_V1_NAMEPIECETYPE_FAMILY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 * Reads a NameFieldType from XML. The reader is assumed to be at the start element.
 *
 * @param reader The XML reader.
 * @return The NameFieldType, or NULL if unable to be read.
 */
static enum FSAUTHORITIESV1NameFieldType *xmlTextReaderReadFSAUTHORITIESV1NameFieldTypeType(xmlTextReaderPtr reader)
{
  xmlChar *enumValue = xmlTextReaderReadEntireNodeValue(reader);
  enum FSAUTHORITIESV1NameFieldType *value = calloc(1, sizeof(enum FSAUTHORITIESV1NameFieldType));
  if (enumValue != NULL) {
    if (xmlStrcmp(enumValue, BAD_CAST "Given") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_GIVEN;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Prefix") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_PREFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Suffix") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_SUFFIX;
      free(enumValue);
      return value;
    }
    if (xmlStrcmp(enumValue, BAD_CAST "Family") == 0) {
      *value = AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_FAMILY;
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
 * Writes a NameFieldType to XML.
 *
 * @param writer The XML writer.
 * @param _nameFieldType The NameFieldType to write.
 * @return The bytes written (may be 0 in case of buffering) or -1 in case of error.
 */
static int xmlTextWriterWriteFSAUTHORITIESV1NameFieldTypeType(xmlTextWriterPtr writer, enum FSAUTHORITIESV1NameFieldType *_nameFieldType)
{
  switch (*_nameFieldType) {
    case AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_GIVEN:
      return xmlTextWriterWriteString(writer, BAD_CAST "Given");
    case AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_PREFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Prefix");
    case AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_SUFFIX:
      return xmlTextWriterWriteString(writer, BAD_CAST "Suffix");
    case AUTHORITIES_AUTHORITIES_V1_NAMEFIELDTYPE_FAMILY:
      return xmlTextWriterWriteString(writer, BAD_CAST "Family");
  }

#if DEBUG_ENUNCIATE
  NSLog(@"Unable to write enum value (no valid value found).");
#endif
  return -1;
}

/**
 *  @author Ryan Heaton

 */
@implementation FSAUTHORITIESV1Authorities

/**
 * The authority places.
 */
- (FSAUTHORITIESV1Places *) places
{
  return _places;
}

/**
 * The authority places.
 */
- (void) setPlaces: (FSAUTHORITIESV1Places *) newPlaces
{
  [newPlaces retain];
  [_places release];
  _places = newPlaces;
}

/**
 * The authority names.
 */
- (FSAUTHORITIESV1Names *) names
{
  return _names;
}

/**
 * The authority names.
 */
- (void) setNames: (FSAUTHORITIESV1Names *) newNames
{
  [newNames retain];
  [_names release];
  _names = newNames;
}

/**
 * The authority dates.
 */
- (FSAUTHORITIESV1Dates *) dates
{
  return _dates;
}

/**
 * The authority dates.
 */
- (void) setDates: (FSAUTHORITIESV1Dates *) newDates
{
  [newDates retain];
  [_dates release];
  _dates = newDates;
}

/**
 * The authority cultures.
 */
- (NSArray *) cultures
{
  return _cultures;
}

/**
 * The authority cultures.
 */
- (void) setCultures: (NSArray *) newCultures
{
  [newCultures retain];
  [_cultures release];
  _cultures = newCultures;
}

- (void) dealloc
{
  [self setPlaces: nil];
  [self setNames: nil];
  [self setDates: nil];
  [self setCultures: nil];
  [super dealloc];
}

//documentation inherited.
+ (id<EnunciateXML>) readFromXML: (NSData *) xml
{
  FSAUTHORITIESV1Authorities *_fSAUTHORITIESV1Authorities;
  xmlTextReaderPtr reader = xmlReaderForMemory([xml bytes], [xml length], NULL, NULL, 0);
  if (reader == NULL) {
    [NSException raise: @"XMLReadError"
                 format: @"Error instantiating an XML reader."];
    return nil;
  }

  _fSAUTHORITIESV1Authorities = (FSAUTHORITIESV1Authorities *) [FSAUTHORITIESV1Authorities readXMLElement: reader];
  xmlFreeTextReader(reader); //free the reader
  return _fSAUTHORITIESV1Authorities;
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
@end /* implementation FSAUTHORITIESV1Authorities */

/**
 * Internal, private interface for JAXB reading and writing.
 */
@interface FSAUTHORITIESV1Authorities (JAXB) <JAXBReading, JAXBWriting, JAXBType, JAXBElement>

@end /*interface FSAUTHORITIESV1Authorities (JAXB)*/

/**
 * Internal, private implementation for JAXB reading and writing.
 */
@implementation FSAUTHORITIESV1Authorities (JAXB)

/**
 * Read an instance of FSAUTHORITIESV1Authorities from an XML reader.
 *
 * @param reader The reader.
 * @return An instance of FSAUTHORITIESV1Authorities defined by the XML reader.
 */
+ (id<JAXBType>) readXMLType: (xmlTextReaderPtr) reader
{
  FSAUTHORITIESV1Authorities *_fSAUTHORITIESV1Authorities = [[FSAUTHORITIESV1Authorities alloc] init];
  NS_DURING
  {
    [_fSAUTHORITIESV1Authorities initWithReader: reader];
  }
  NS_HANDLER
  {
    [_fSAUTHORITIESV1Authorities dealloc];
    _fSAUTHORITIESV1Authorities = nil;
    [localException raise];
  }
  NS_ENDHANDLER

  [_fSAUTHORITIESV1Authorities autorelease];
  return _fSAUTHORITIESV1Authorities;
}

/**
 * Initialize this instance of FSAUTHORITIESV1Authorities according to
 * the XML being read from the reader.
 *
 * @param reader The reader.
 */
- (id) initWithReader: (xmlTextReaderPtr) reader
{
  return [super initWithReader: reader];
}

/**
 * Write the XML for this instance of FSAUTHORITIESV1Authorities to the writer.
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
 * Reads a FSAUTHORITIESV1Authorities from an XML reader. The element to be read is
 * "{http://api.familysearch.org/authorities/v1}authorities".
 *
 * @param reader The XML reader.
 * @return The FSAUTHORITIESV1Authorities.
 */
+ (id<JAXBElement>) readXMLElement: (xmlTextReaderPtr) reader {
  int status;
  FSAUTHORITIESV1Authorities *_authorities = nil;

  if (xmlTextReaderNodeType(reader) != XML_READER_TYPE_ELEMENT) {
    status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
    if (status < 1) {
      [NSException raise: @"XMLReadError"
                   format: @"Error advancing the reader to start element {http://api.familysearch.org/authorities/v1}authorities."];
    }
  }

  if (xmlStrcmp(BAD_CAST "authorities", xmlTextReaderConstLocalName(reader)) == 0
      && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read root element {http://api.familysearch.org/authorities/v1}authorities.");
#endif
    _authorities = (FSAUTHORITIESV1Authorities *)[FSAUTHORITIESV1Authorities readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"Successfully read root element {http://api.familysearch.org/authorities/v1}authorities.");
#endif
  }
  else {
    if (xmlTextReaderConstNamespaceUri(reader) == NULL) {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSAUTHORITIESV1Authorities. Expected element {http://api.familysearch.org/authorities/v1}authorities. Current element: {}%s", xmlTextReaderConstLocalName(reader)];
    }
    else {
      [NSException raise: @"XMLReadError"
                   format: @"Unable to read FSAUTHORITIESV1Authorities. Expected element {http://api.familysearch.org/authorities/v1}authorities. Current element: {%s}%s\n", xmlTextReaderConstNamespaceUri(reader), xmlTextReaderConstLocalName(reader)];
    }
  }

  return _authorities;
}

/**
 * Writes this FSAUTHORITIESV1Authorities to XML under element name "{http://api.familysearch.org/authorities/v1}authorities".
 * The namespace declarations for the element will be written.
 *
 * @param writer The XML writer.
 * @param _authorities The Authorities to write.
 * @return 1 if successful, 0 otherwise.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer
{
  [self writeXMLElement: writer writeNamespaces: YES];
}

/**
 * Writes this FSAUTHORITIESV1Authorities to an XML writer.
 *
 * @param writer The writer.
 * @param writeNs Whether to write the namespaces for this element to the xml writer.
 */
- (void) writeXMLElement: (xmlTextWriterPtr) writer writeNamespaces: (BOOL) writeNs
{
  int rc = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "authorities", NULL);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing start element {http://api.familysearch.org/authorities/v1}authorities. XML writer status: %i\n", rc];
  }

  if (writeNs) {
#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing namespaces for start element {http://api.familysearch.org/authorities/v1}authorities...");
#endif

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:fsapi_v1", BAD_CAST "http://api.familysearch.org/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:fsapi_v1' on '{http://api.familysearch.org/authorities/v1}authorities'. XML writer status: %i\n", rc];
    }

    rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:authorities_v1", BAD_CAST "http://api.familysearch.org/authorities/v1");
    if (rc < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing attribute 'xmlns:authorities_v1' on '{http://api.familysearch.org/authorities/v1}authorities'. XML writer status: %i\n", rc];
    }
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote namespaces for start element {http://api.familysearch.org/authorities/v1}authorities...");
#endif
  }

#if DEBUG_ENUNCIATE > 1
  NSLog(@"writing type {http://api.familysearch.org/authorities/v1}authorities for root element {http://api.familysearch.org/authorities/v1}authorities...");
#endif
  [self writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
  NSLog(@"successfully wrote type {http://api.familysearch.org/authorities/v1}authorities for root element {http://api.familysearch.org/authorities/v1}authorities...");
#endif
  rc = xmlTextWriterEndElement(writer);
  if (rc < 0) {
    [NSException raise: @"XMLWriteError"
                 format: @"Error writing end element {http://api.familysearch.org/authorities/v1}authorities. XML writer status: %i\n", rc];
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
    && xmlStrcmp(BAD_CAST "places", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}places of type {http://api.familysearch.org/authorities/v1}places.");
#endif
    __child = [FSAUTHORITIESV1Places readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}places of type {http://api.familysearch.org/authorities/v1}places.");
#endif

    [self setPlaces: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "names", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}names of type {http://api.familysearch.org/authorities/v1}names.");
#endif
    __child = [FSAUTHORITIESV1Names readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}names of type {http://api.familysearch.org/authorities/v1}names.");
#endif

    [self setNames: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "dates", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}dates of type {http://api.familysearch.org/authorities/v1}dates.");
#endif
    __child = [FSAUTHORITIESV1Dates readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}dates of type {http://api.familysearch.org/authorities/v1}dates.");
#endif

    [self setDates: __child];
    return YES;
  } //end "if choice"

  if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT
    && xmlStrcmp(BAD_CAST "cultures", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

    if (xmlTextReaderIsEmptyElement(reader) == 0) {
#if DEBUG_ENUNCIATE > 1
      NSLog(@"Unwrapping wrapper element {http://api.familysearch.org/authorities/v1}cultures...");
#endif
      //start wrapper element "{http://api.familysearch.org/authorities/v1}cultures"
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
    && xmlStrcmp(BAD_CAST "culture", xmlTextReaderConstLocalName(reader)) == 0
    && xmlStrcmp(BAD_CAST "http://api.familysearch.org/authorities/v1", xmlTextReaderConstNamespaceUri(reader)) == 0) {

#if DEBUG_ENUNCIATE > 1
    NSLog(@"Attempting to read choice {http://api.familysearch.org/authorities/v1}culture of type {http://api.familysearch.org/authorities/v1}culture.");
#endif

    __child = [FSAUTHORITIESV1Culture readXMLType: reader];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully read choice {http://api.familysearch.org/authorities/v1}culture of type {http://api.familysearch.org/authorities/v1}culture.");
#endif

    if ([self cultures]) {
      [self setCultures: [[self cultures] arrayByAddingObject: __child]];
    }
    else {
      [self setCultures: [NSArray arrayWithObject: __child]];
    }
    continue; //continue "while in wrapper element" loop
  } //end "if choice"

        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
#if DEBUG_ENUNCIATE > 1
        NSLog(@"successfully unwrapped wrapper element {http://api.familysearch.org/authorities/v1}cultures...");
#endif
      } // end "while in wrapper element" loop

      if (status < 1) {
        //panic: XML read error.
        [self dealloc];
        [NSException raise: @"XMLReadError"
                     format: @"Failure to advance to end wrapper element."];
      }
      else {
        //end wrapper element "{http://api.familysearch.org/authorities/v1}cultures"
        status = xmlTextReaderAdvanceToNextStartOrEndElement(reader);
      }
    } //end "if empty element" clause
    else {
      __child = [NSArray array];
      [self setCultures: (NSArray*) __child];
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

  if ([self places]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "places", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}places."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}places...");
#endif
    [[self places] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}places...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}places."];
    }
  }
  if ([self names]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "names", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}names."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}names...");
#endif
    [[self names] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}names...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}names."];
    }
  }
  if ([self dates]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "dates", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}dates."];
    }

#if DEBUG_ENUNCIATE > 1
    NSLog(@"writing element {http://api.familysearch.org/authorities/v1}dates...");
#endif
    [[self dates] writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
    NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}dates...");
#endif

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}dates."];
    }
  }
  if ([self cultures]) {
    status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "cultures", NULL);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing start wrapper element {http://api.familysearch.org/authorities/v1}cultures."];
    }
    __enumerator = [[self cultures] objectEnumerator];

    while ( (__item = [__enumerator nextObject]) ) {
      status = xmlTextWriterStartElementNS(writer, BAD_CAST "authorities_v1", BAD_CAST "culture", NULL);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing start child element {http://api.familysearch.org/authorities/v1}culture."];
      }

#if DEBUG_ENUNCIATE > 1
      NSLog(@"writing element {http://api.familysearch.org/authorities/v1}culture...");
#endif
      [__item writeXMLType: writer];
#if DEBUG_ENUNCIATE > 1
      NSLog(@"successfully wrote element {http://api.familysearch.org/authorities/v1}culture...");
#endif

      status = xmlTextWriterEndElement(writer);
      if (status < 0) {
        [NSException raise: @"XMLWriteError"
                     format: @"Error writing end child element {http://api.familysearch.org/authorities/v1}culture."];
      }
    } //end item iterator.

    status = xmlTextWriterEndElement(writer);
    if (status < 0) {
      [NSException raise: @"XMLWriteError"
                   format: @"Error writing end wrapper element {http://api.familysearch.org/authorities/v1}cultures."];
    }
  }
}
@end /* implementation FSAUTHORITIESV1Authorities (JAXB) */
