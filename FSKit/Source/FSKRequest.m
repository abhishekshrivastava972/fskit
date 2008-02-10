//
//  FSKRequest.m
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import "FSKRequest.h"

@implementation FSKRequest
-(id) initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
					   delegate:(id)aDelegate 
					   selector:(SEL)aSelector
{
	self = [super init];
	familySearchConnection = aFamilySearchConnection;
	_delegate = aDelegate;// ? aDelegate : self;
	_selector = aSelector? aSelector : @selector(request:didReturnResponse:);
	responseData = [[NSMutableData alloc] init];
	return self;
}

-(void)dealloc
{
	[responseData release];
	[super dealloc];
}

/*!
    @method     
    @abstract   Makes a request to a FamilySearch REST API with the provided parameters
    @discussion Uses a URL of the following format <baseURL>/<endpoint>/<version>/<module>/<path>?<parameter1=value1>&<parameter2=value2>
	where the parameters and values are key-value pairs in the provided parameter dictionary
*/
-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
							 WithIds:(NSSet *)idList
						  parameters:(NSDictionary *)parameters
{
	NSLog(@"%s %@ %@ %@", __PRETTY_FUNCTION__, endpoint, idList, parameters);

	NSURL *theURL = [self generateFamilySearchURLAtEndpoint:endpoint WithIds:idList parameters:parameters];
	
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:theURL 
											 cachePolicy:NSURLRequestReloadIgnoringCacheData 
										 timeoutInterval:0.1];//[aFamilySearchConnection connectionTimeoutInterval]];
	
	NSLog(@"connection: %@", [NSURLConnection connectionWithRequest:urlRequest
								  delegate:self]);
}


+(void)fetchFamilySearchData:(NSString *)endpoint WithIds:(NSSet *)idList parameters:(NSDictionary *)parameters connection:aFamilySearchConnection delegate:(id)aDelegate selector:(SEL)aSelector
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	FSKRequest *fsRequest = [[FSKRequest alloc] initWithFamilySearchConnection:aFamilySearchConnection
													 delegate:aDelegate
													 selector:aSelector];

	[fsRequest fetchFamilySearchDataAtEndpoint:endpoint
									   WithIds:idList
									parameters:parameters];
}

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
	
	NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@", FSAPIServerUrlString, endpoint];
	if ([idList count] > 0)
	{
		[urlString appendFormat:@"/%@", [[idList allObjects] componentsJoinedByString:@","]];
	}
	if ([mutableDictionary count] > 0)
	{
		[urlString appendFormat:@"?%@", [mutableDictionary webFormEncoded]];
	}

	return [NSURL URLWithString:[[urlString encodeURLLegally] autorelease]];
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

#pragma mark NSURLConnection delegate methods
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"%s %@ %d %@ headers:\n%@", __PRETTY_FUNCTION__, response, [(NSHTTPURLResponse*)response statusCode], [NSHTTPURLResponse localizedStringForStatusCode:[(NSHTTPURLResponse*)response statusCode]], [(NSHTTPURLResponse*)response allHeaderFields]);
	if ([(NSHTTPURLResponse*)response statusCode] == 401)
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
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSError *error = nil;
	NSXMLDocument *returnXML = [[NSXMLDocument alloc] initWithData:responseData
														   options:nil
															 error:&error];

	if (returnXML == nil || error != nil)
	{
		NSLog(@"Error parsing XML: %@", error);
	}

	if([_delegate respondsToSelector:_selector])
	{
		[_delegate performSelector:_selector withObject:returnXML];
	}

   [self release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	if([_delegate respondsToSelector:@selector(request:didFailWithError:)])
	{
		[_delegate request:self didFailWithError:[[FSKError alloc] initWithError:error]];
	}
}

-(void)connection:(NSURLConnection *)connection
       didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	// Should only occur on login requests, all others will receive a 401
	//
	// there are several ways to handle authentication from least to most involvement;
	// 1. use the default keychain (we would never get here)
	// 2. use our own custom keychain (not worry about it now)
	// 3. use the provided credentials in the connection
	// 4. have the app delegate handle the authentication event directly
	// 5. pop up a dialog/sheet and ask the user for credentials
	// 
	// in the end we need the challenge cancelled or provided with credentials  
	
	// 3. use provided credential
	if ([familySearchConnection credential])
	{
		[[challenge sender] useCredential:[familySearchConnection credential] forAuthenticationChallenge:challenge];
		return;
	}

	// 4. have the app delegate handle it
    if ([_delegate respondsToSelector:@selector(request:didReceiveAuthenticationChallenge:)])
	{
		[_delegate request:self didReceiveAuthenticationChallenge:challenge];
		return;
    }
	
	// 5. do it ourselves
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
#pragma mark Delegate Methods

@implementation NSObject (FSKRequestDelegate)

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, challenge);
//	[self handleAuthenticationChallenge:challenge];
}

- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, request);
	return [NSApp mainWindow];
}

- (void)request:(FSKRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, challenge);
}

- (void)request:(FSKRequest *)request didReturnResponse:(FSKResponse *)response;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, response);
}

- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error;
{
	NSLog(@"FSKRequest %s %@", __PRETTY_FUNCTION__, error);
}

@end

