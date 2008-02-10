//
//  FamilySearchConnection.m
//  FSKit
//
//  Created by Logan Allred on 6/9/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKConnection.h"

//NSString *FSAPIServerUrlString = @"https://api.familysearch.org/";  // Production
NSString *FSAPIServerUrlString = @"https://apibeta.familysearch.org/";  // Beta
//NSString *FSAPIServerUrlString = @"http://www.dev.usys.org/";  // Development
NSString *FSAPIVersion = @"v1";


@implementation FSKConnection
NSString *userAgentString = @"test";

- (id)init {
	self = [super init]; 

	[self setConnectionTimeoutInterval:5.0];
	userAgentString = [[NSString stringWithFormat:@"%@/%@", FSKitAgent, FSKitVersion] retain];
	responseDataCache = [[[NSMutableDictionary alloc] init] retain];
	return self;
}

- (void) dealloc
{
	[credential release];
	[userAgentString release];
	[responseDataCache release];
	[super dealloc];
}


/*!
    @method     
    @abstract   Makes a request to a FamilySearch REST API with the provided parameters
    @discussion Uses a URL of the following format <baseURL>/<endpoint>/<version>/<module>/<path>?<parameter1=value1>&<parameter2=value2>
	where the parameters and values are key-value pairs in the provided parameter dictionary
*/
//-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
//							 WithIds:(NSSet *)idList
//						  parameters:(NSDictionary *)dict
//{
//	NSLog(@"%s %@ %@ %@", __PRETTY_FUNCTION__, endpoint, idList, dict);
//	if (!dict)
//	{
//		dict = [[[NSMutableDictionary alloc] init] autorelease];
//	}
//	[dict setValue:[self sessionId] forKey:@"sessionId"];
//	NSString *queryString = @"";
//	if (dict && [dict count] > 0)
//	{
//		queryString = [NSString stringWithFormat:@"?%@", [dict webFormEncoded]];
//	}
//	NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@%@", FSAPIServerUrlString, endpoint, [[idList allObjects] componentsJoinedByString:@","], queryString];
//	
//	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString] 
//											 cachePolicy:NSURLRequestReloadIgnoringCacheData 
//										 timeoutInterval:[self connectionTimeoutInterval]];
//	
//	[responseDataCache setObject:[[NSMutableData alloc] init] forKey:[[NSURLConnection connectionWithRequest:request
//								  delegate:self] description]];
//}


//	return [self fetchFamilySearchData:[NSURL URLWithString:urlString]];
//}

//-(id)fetchFamilySearchData:(NSURL *)theURL
//{
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, theURL);
//	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:theURL 
//												cachePolicy:NSURLRequestReloadIgnoringCacheData
//											timeoutInterval:[self connectionTimeoutInterval]];
//	[urlRequest addValue:[self userAgentString]	forHTTPHeaderField:@"User-Agent"];
//	NSHTTPURLResponse *xmlResponse;  //not used right now
//	NSError *fetchError; //also not used
//	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
//												 returningResponse:&xmlResponse
//															 error:&fetchError];
//	NSLog(@"\nresponse(%d): %@\nheaders:%@\nerror: %@\ndata:%@", [xmlResponse statusCode], [xmlResponse URL], [xmlResponse allHeaderFields], fetchError, [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
//	NSXMLDocument *returnXML = [[NSXMLDocument alloc] initWithData:responseData
//														   options:nil
//															 error:nil];
//	return [returnXML autorelease];
//	
//	
//}

//-(id)postFamilySearchData:(NSURL *)theURL withData:(NSData *)theData ofType:(NSString *)contentType
//{
//	NSLog(@"%s, %@", __PRETTY_FUNCTION__, theURL);
//	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:theURL 
//												cachePolicy:NSURLRequestReloadIgnoringCacheData
//											timeoutInterval:[self connectionTimeoutInterval]];
//	[urlRequest setHTTPMethod:@"POST"];
//	[urlRequest setHTTPBody:theData];
//	[urlRequest addValue:[self userAgentString]	forHTTPHeaderField:@"User-Agent"];
//	if (contentType) {
//		[urlRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
//	}
//	NSLog(@"request headers: %@", [urlRequest allHTTPHeaderFields]);
//	NSHTTPURLResponse *xmlResponse;  //not used right now
//	NSError *fetchError; //also not used
//	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
//												 returningResponse:&xmlResponse
//															 error:&fetchError];
//	NSLog(@"\nresponse(%d): %@\nheaders:%@\nerror: %@\ndata:%@", [xmlResponse statusCode], [xmlResponse URL], [xmlResponse allHeaderFields], fetchError, [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
//	NSXMLDocument *returnXML = [[NSXMLDocument alloc] initWithData:responseData
//														   options:nil
//															 error:nil];
//	return [returnXML autorelease];
//}

- (NSURLCredential *)credential {
    return [[credential retain] autorelease];
}

- (void)setCredential:(NSURLCredential *)value {
    if (credential != value) {
        [credential release];
        credential = [value copy];
    }
}

- (NSString *)developerKey {
    return [[developerKey retain] autorelease];
}

- (void)setDeveloperKey:(NSString *)value {
    if (developerKey != value) {
        [developerKey release];
        developerKey = [value copy];
    }
}

- (NSString *)sessionId {
    return [[_sessionId retain] autorelease];
}

- (void)setSessionId:(NSString *)value {
    if (_sessionId != value) {
        [_sessionId release];
        _sessionId = [value copy];
    }
}

- (BOOL)hasSessionId
{
	return (_sessionId && [_sessionId length] > 0);
}

- (BOOL)needsAuthentication
{
    return needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)value
{
    if (needsAuthentication != value)
	{
        needsAuthentication = value;
    }
}

-(void)setConnectionTimeoutInterval:(double)aConnectionTimeoutInterval
{
	connectionTimeoutInterval = aConnectionTimeoutInterval;
}

-(NSTimeInterval)connectionTimeoutInterval
{
	return connectionTimeoutInterval;
}

- (void)setUserAgentString:(NSString *)newAgentString override:(BOOL)override {
	if (newAgentString == nil) {
		newAgentString = @"";
	}
	if (override) {
		userAgentString = [@"" stringByAppendingString:newAgentString];
	} else {
		userAgentString = [[newAgentString stringByAppendingFormat:@" %@/%@", FSKitAgent, FSKitVersion] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
}

- (NSString *)userAgentString {
	return userAgentString;
}

- (id)delegate {
    return [[_delegate retain] autorelease];
}

- (void)setDelegate:(id)value {
	_delegate = value;
}


@end

@implementation FSKConnection(PrivateMethods)

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, data);
	[[responseDataCache objectForKey:[connection description]] appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{	
	NSLog(@"%s %@", __PRETTY_FUNCTION__, connection);
	NSXMLDocument *returnXML = [[NSXMLDocument alloc] initWithData:[responseDataCache objectForKey:[connection description]]
														   options:nil
															 error:nil];
    SEL _selector = @selector(requestFinished:);																	
	if([_delegate respondsToSelector:_selector])
		[_delegate performSelector:_selector withObject:returnXML];

   [self release];
}

//0.6 suggestion to pass connection error.  Thanks Adam.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	if([_delegate respondsToSelector:@selector(asyncRequestFailed:)])
		[_delegate performSelector:@selector(asyncRequestFailed:) withObject:error];
}



@end

@implementation NSString(NSStringExtras)
/*
	Encode a string legally so it can be turned into an NSURL
	Original Source: <http://cocoa.karelia.com/Foundation_Categories/NSString/Encode_a_string_leg.m>
	(See copyright notice at <http://cocoa.karelia.com>)
	 */

/*"	Fix a URL-encoded string that may have some characters that makes NSURL barf.
It basicaly re-encodes the string, but ignores escape characters + and %, and also #.
"*/
- (NSString *) encodeURLLegally
{
	NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef) self, (CFStringRef) @"%+#", NULL,
																			CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
	return result;
}
@end

@implementation NSDictionary(webFormEncoded)
/*
Return the key-value pairs in the dictionary, with the keys and values encoded as query parameters, 
paired by =, and delimited with &. This is the format for a full set of named parameters in a 
URL-coded query.
Original Source: <http://www.mactech.com/articles/mactech/Vol.19/19.03/HTTPMessages/index.html>
modified to handle multi-valued keys like view=summary&view=values....
*/
- (NSString *) webFormEncoded
{
	NSEnumerator *      keys = [self keyEnumerator];
	NSString *            currKey;
	NSString *            currObject;
	NSMutableString *   retval = [NSMutableString
								  stringWithCapacity: 256];
	BOOL                     started = NO;
	while ((currKey = [keys nextObject]) != nil)
	{
		//   Chain the key-value pairs, properly escaped, in one string.
		if (started)
			[retval appendString: @"&"];
		else
			started = YES;
		
		currKey = [currKey encodeURLLegally];
		
		// modified to handle multi-valued keys as arrays of NSString
		if ( [[self objectForKey: currKey] isKindOfClass:[NSArray class]] )
		{
			NSArray *currList = [self objectForKey: currKey];
			int i = 0;
			for ( i = 0 ; i < [currList count] ; i++ )
			{
				if (i > 0) [retval appendString:@"&"];
				currObject = [[currList objectAtIndex:i] encodeURLLegally];
				[retval appendString: [NSString stringWithFormat:@"%@=%@", currKey, currObject]];
			}
		}
		else
		{
			currObject = [[self objectForKey: currKey] encodeURLLegally];
			[retval appendString: [NSString stringWithFormat:@"%@=%@", currKey, currObject]];
		}
	}
	return retval;
}
@end
