//
//  FSKRequest.m
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKRequest.h"
#import "identity.h"

@implementation FSKRequest

-(id) initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
					   delegate:(id)aDelegate 
					   selector:(SEL)aSelector
{
	if ((self = [super init]))
	{ 
		familySearchConnection = [aFamilySearchConnection retain];
		_delegate = aDelegate;// ? aDelegate : self;
		_selector = aSelector? aSelector : @selector(request:didReturnResponse:);
		responseData = [[[NSMutableData alloc] init] retain];
		_idList = [[NSSet set] retain];
		_endpoint = @"";
		_parameters = [[NSDictionary dictionary] retain];
	}
	return self;
}

-(void)dealloc
{
	[familySearchConnection release];
	[responseData release];
	[_endpoint release];
	[_idList release];
	[_parameters release];
	[super dealloc];
}

/*!
    @brief   Makes a request to a FamilySearch REST API with the provided parameters
    @details Uses a URL of the following format @code <baseURL>/<endpoint>/<version>/<module>/<path>?<parameter1=value1>&<parameter2=value2> @endcode
	where the parameters and values are key-value pairs in the provided parameter dictionary
*/
-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
							 WithIds:(NSSet *)idList
						  parameters:(NSDictionary *)parameters
{
	NSLog(@"%s %@ %@ %@", __PRETTY_FUNCTION__, endpoint, idList, parameters);
	_endpoint = [endpoint retain];
	_idList = [idList retain];
	_parameters = [parameters retain];
	
	NSURL *theURL = [self generateFamilySearchURLAtEndpoint:_endpoint WithIds:_idList parameters:_parameters];
	
	NSMutableURLRequest *urlRequest = [[NSMutableURLRequest requestWithURL:theURL 
											 cachePolicy:NSURLRequestReloadIgnoringCacheData 
														   timeoutInterval:[familySearchConnection connectionTimeoutInterval]] retain];
	
	[urlRequest addValue:[familySearchConnection userAgentString] forHTTPHeaderField:@"User-Agent"];
	
	NSURLConnection *urlConnection = [[NSURLConnection connectionWithRequest:urlRequest
																	   delegate:self] retain];
	
	NSArray *oldCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:[familySearchConnection baseURLString]]];
	NSLog(@"allcookies count: %d, cookiesforURL:%@", [[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies] count], oldCookies);
    // Now we can print all of the cookies we have:
    for (NSHTTPCookie *cookie in oldCookies)
        NSLog(@"Name: %@ : Value: %@, Expires: %@", cookie.name, cookie.value, cookie.expiresDate); 
    NSArray * availableCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:[familySearchConnection baseURLString]]];
    NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:availableCookies];
	NSLog(@"cookie headers: %@ HTTPShouldHandleCookies:%d", headers, [urlRequest HTTPShouldHandleCookies]);
	NSString *cookieHeader = [headers objectForKey:@"Cookie"]; // key used in header dictionary
	if (cookieHeader) {
        [urlRequest addValue:cookieHeader forHTTPHeaderField:@"Cookie"]; // header name
}


	NSLog(@"connection: %@ headers: %@", urlConnection, [urlRequest allHTTPHeaderFields]);
}


+(void)fetchFamilySearchData:(NSString *)endpoint WithIds:(NSSet *)idList parameters:(NSDictionary *)parameters connection:aFamilySearchConnection delegate:(id)aDelegate selector:(SEL)aSelector
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKRequest *fsRequest = [[[FSKRequest alloc] initWithFamilySearchConnection:aFamilySearchConnection
													 delegate:aDelegate
													 selector:aSelector] retain];

	[fsRequest fetchFamilySearchDataAtEndpoint:endpoint
									   WithIds:idList
									parameters:parameters];
}

/*!
    @brief   Makes a request to a FamilySearch REST API with the provided parameters
    @details Uses a URL of the following format @code <baseURL>/<endpoint>/<version>/<module>/<path>?<parameter1=value1>&<parameter2=value2> @endcode
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
//	id<EnunciateXML> returnXML = [[NSXMLDocument alloc] initWithData:responseData
//														   options:0
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
//	id<EnunciateXML> returnXML = [[NSXMLDocument alloc] initWithData:responseData
//														   options:0
//															 error:nil];
//	return [returnXML autorelease];
//}



-(NSURL *)generateFamilySearchURLAtEndpoint:(NSString *)endpoint 
								    WithIds:(NSSet *)idList
                                 parameters:(NSDictionary *)parameters
{
	NSLog(@"%s", __PRETTY_FUNCTION__);

	NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:parameters];

	if ([familySearchConnection sessionId])
	{
		[mutableDictionary setValue:[familySearchConnection sessionId] forKey:@"sessionId"];
	}
	
	NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@/%@", [familySearchConnection baseURLString], endpoint];
	if (idList && [idList count] > 0)
	{
		[urlString appendFormat:@"/%@", [[idList allObjects] componentsJoinedByString:@","]];
	}
	if ([mutableDictionary count] > 0)
	{
		[urlString appendFormat:@"?%@", [mutableDictionary webFormEncoded]];
	}

	return [NSURL URLWithString:[[urlString encodeURLLegally] autorelease]];
}

- (FSKResponse *)responseWithData:(NSData *)data;
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKResponse *response = [[FSKResponse alloc] initWithData:data];
	return [response autorelease];
}

- (void)reissueRequest
{
//	[responseData release];
//	responseData = [[[NSMutableData alloc] init] retain];
	[responseData setLength:0];
	[self fetchFamilySearchDataAtEndpoint:_endpoint WithIds:_idList parameters:_parameters];
}

#pragma mark Accessors
- (id)delegate
{
    return _delegate;
}

- (void)setDelegate:(id)value
{
    if (_delegate != value)
	{
        _delegate = value;
    }
}

@end

#pragma mark -
#pragma mark Delegate Methods

@implementation NSObject (FSKRequestDelegate)

- (void)request:(FSKRequest *)request didReturnResponse:(FSKResponse *)response;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, response);
}

- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error;
{
	NSLog(@"FSKRequest %s %@ %@", __PRETTY_FUNCTION__, error, [request valueForKey:@"_endpoint"]);
}

@end

#pragma mark -
@implementation FSKRequest(PrivateMethods)
- (void)handleLogin:(id)obj
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, obj);
}

#pragma mark NSURLConnection delegate methods
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"%s %@ %d %@ headers:\n%@", __PRETTY_FUNCTION__, response, [(NSHTTPURLResponse*)response statusCode], [NSHTTPURLResponse localizedStringForStatusCode:[(NSHTTPURLResponse*)response statusCode]], [(NSHTTPURLResponse*)response allHeaderFields]);
	NSArray *oldCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:[familySearchConnection baseURLString]]];
	NSLog(@"allcookies count: %d, cookiesforURL:%@", [[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies] count], oldCookies);
    // Now we can print all of the cookies we have:
    for (NSHTTPCookie *cookie in oldCookies)
        NSLog(@"Name: %@ : Value: %@, Expires: %@", cookie.name, cookie.value, cookie.expiresDate); 
	
	// If you want to get all of the cookies:
    NSArray * all = [NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:nil];
    NSLog(@"How many Cookies: %d", all.count);
    // Store the cookies:
    // NSHTTPCookieStorage is a Singleton.
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:all forURL:[NSURL URLWithString:[familySearchConnection baseURLString]] mainDocumentURL:nil];
	
    // Now we can print all of the cookies we have:
    for (NSHTTPCookie *cookie in all)
        NSLog(@"Name: %@ : Value: %@, Expires: %@", cookie.name, cookie.value, cookie.expiresDate); 
	
	NSLog(@"length:%d", [response expectedContentLength]);
	_responseCode = [(NSHTTPURLResponse*)response statusCode];
	if (_responseCode == 401)
	{
		[familySearchConnection setNeedsAuthentication:YES];
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, data);
	[responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{	
	NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, connection, self);
	if (_responseCode == 401)
	{
		[familySearchConnection handleAuthenticationForRequest:self];
	}
	NSError *error = nil;
	FSKResponse *response = [self responseWithData:responseData];
	if ([response respondsToSelector:@selector(setRequestedIds:)])
	{
		[response setValue:_idList forKey:@"requestedIds"];
	}
	
	// need to authenticate
	if ([response statusCode] == 401)
	{
		[familySearchConnection handleAuthenticationForRequest:self];
	}

	else if([_delegate respondsToSelector:_selector])
	{
		[_delegate performSelector:_selector withObject:response];
	}

	[connection autorelease];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	if([_delegate respondsToSelector:@selector(request:didFailWithError:)])
	{
		[_delegate request:self didFailWithError:[[FSKError alloc] initWithError:error]];
	}
	[connection autorelease];
}

-(void)connection:(NSURLConnection *)connection
       didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	// Should only occur on login requests, all others will receive a 401
	//
	// there are several ways to handle authentication from least to most involvement;
	// 1. use the default keychain (we would never get here)
	// 2. use our own custom keychain (consider implementing later)
	// 3. use the provided credentials in the connection
	// 4. have the request delegate handle the authentication event directly
	// 5. have the connection delegate handle the authentication event directly
	// 6. pop up a dialog/sheet and ask the user for credentials
	// 
	// in the end we need the challenge either cancelled or provided with credentials  
	
	// 3. use provided credential
	if ([familySearchConnection credential])
	{
		[[challenge sender] useCredential:[familySearchConnection credential] forAuthenticationChallenge:challenge];
		return;
	}

	// 4. have the request delegate handle it
    if ([_delegate respondsToSelector:@selector(request:didReceiveAuthenticationChallenge:)])
	{
		[_delegate request:self didReceiveAuthenticationChallenge:challenge];
		return;
    }
	
	// 5. have the connection delegate handle it
    if ([[familySearchConnection delegate] respondsToSelector:@selector(request:didReceiveAuthenticationChallenge:)])
	{
		[[familySearchConnection delegate] request:self didReceiveAuthenticationChallenge:challenge];
		return;
    }

	// 6. do it ourselves
	// until I know what to do, just cancel
	[[challenge sender] cancelAuthenticationChallenge:challenge];
//	[self handleAuthenticationChallenge:challenge];
}


- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, challenge);
}
@end

#pragma mark -

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


