#import "DDXMLDocument.h"
#import "NSStringAdditions.h"
#import "DDXMLPrivate.h"


@implementation DDXMLDocument

+ (id)nodeWithPrimitive:(xmlKindPtr)nodePtr
{
	return [[[DDXMLDocument alloc] initWithPrimitive:nodePtr] autorelease];
}

- (id)initWithPrimitive:(xmlKindPtr)nodePtr
{
	if(nodePtr == NULL || nodePtr->type != XML_DOCUMENT_NODE)
	{
		[super dealloc];
		return nil;
	}
	
	self = [super initWithPrimitive:nodePtr];
	return self;
}

/**
 * Initializes and returns a DDXMLDocument object created from an NSData object.
 * 
 * Returns an initialized DDXMLDocument object, or nil if initialization fails
 * because of parsing errors or other reasons.
**/
- (id)initWithXMLString:(NSString *)string options:(NSUInteger)mask error:(NSError **)error
{
	return [self initWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:mask error:error];
}

/**
 * Initializes and returns a DDXMLDocument object created from an NSData object.
 * 
 * Returns an initialized DDXMLDocument object, or nil if initialization fails
 * because of parsing errors or other reasons.
**/
- (id)initWithData:(NSData *)data options:(NSUInteger)mask error:(NSError **)error
{
	if(data == nil || [data length] == 0)
	{
		if(error) *error = [NSError errorWithDomain:@"DDXMLErrorDomain" code:0 userInfo:nil];
		
		[super dealloc];
		return nil;
	}
	
	// added to strip the default namespace so xpath queries will work against the default namespace nodes in libxml2
	NSString *fixedString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
	fixedString = [fixedString stringByReplacingOccurrencesOfRegex:@"xmlns=\"http://api.familysearch.org/\\w*/\\w*\"" withString:@""];
	data = [fixedString dataUsingEncoding:NSUTF8StringEncoding];

	xmlDocPtr doc = xmlParseMemory([data bytes], [data length]);
	if(doc == NULL)
	{
		if(error) *error = [NSError errorWithDomain:@"DDXMLErrorDomain" code:1 userInfo:nil];
		
		[super dealloc];
		return nil;
	}
	
	return [self initWithPrimitive:(xmlKindPtr)doc];
}

/**
 * Returns the root element of the receiver.
**/
- (DDXMLElement *)rootElement
{
	xmlDocPtr docPtr = (xmlDocPtr)genericPtr;
	
	if(docPtr->children == NULL)
		return nil;
	else
		return [DDXMLElement nodeWithPrimitive:(xmlKindPtr)(docPtr->children)];
}

- (NSData *)XMLData
{
	return [[self XMLString] dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)XMLDataWithOptions:(NSUInteger)options
{
	return [[self XMLStringWithOptions:options] dataUsingEncoding:NSUTF8StringEncoding];
}

@end