//
//  FamilySearchConnection.h
//  FamilySearchKit
//
//  Created by Logan Allred on 6/9/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
    @defined 
    @abstract   <#(description)#>
    @discussion <#(description)#>
*/
#define FSKitVersion @"0.1"

/*!
    @defined 
    @abstract   <#(description)#>
    @discussion <#(description)#>
*/
#define FSKitAgent @"FSKit"

/*!
    @const 
    @abstract   <#(description)#>
    @discussion <#(description)#>
*/
extern NSString *FSAPIServerUrlString;

/*!
    @const 
    @abstract   <#(description)#>
    @discussion <#(description)#>
*/
extern NSString *FSAPIVersion;

/*!
    @class	FSKConnection
    @abstract    Manages connections to the FamilySearch web services, including authentication
	@discussion  (comprehensive description)
*/
@interface FSKConnection : NSObject {

	NSURLCredential *credential;

	NSString *developerKey;
	NSString *_sessionId;
	BOOL needsAuthentication;
	NSTimeInterval connectionTimeoutInterval;
	id _delegate;	
	NSMutableDictionary *responseDataCache;
}

/*!
	@method     init
	@abstract   (brief description)
	@discussion (comprehensive description)
*/
- (id)init;


//#pragma mark Request Methods

	//synchronous requests
//-(id)fetchFamilySearchData:(NSURL *)theURL;
//-(id)postFamilySearchData:(NSURL *)theURL withData:(NSData *)theData ofType:(NSString *)contentType;
//
//-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
//							   WithIds:(NSSet *)idList
//						    parameters:(NSDictionary *)dict;

#pragma mark Accessors

/*!
    @method     credential
    @abstract   <#(brief description)#>
    @discussion <#(comprehensive description)#>
*/
- (NSURLCredential *)credential;
- (void)setCredential:(NSURLCredential *)value;

- (NSString *)developerKey;
- (void)setDeveloperKey:(NSString *)value;

- (NSString *)sessionId;
- (void)setSessionId:(NSString *)value;
- (BOOL)hasSessionId;

- (BOOL)needsAuthentication;
- (void)setNeedsAuthentication:(BOOL)value;

- (NSString *)userAgentString;
- (void)setUserAgentString:(NSString *)newAgentString override:(BOOL)override;

-(void)setConnectionTimeoutInterval:(double)aConnectionTimeoutInterval;
-(NSTimeInterval)connectionTimeoutInterval;

- (id)delegate;
- (void)setDelegate:(id)value;

@end

#pragma mark -
#pragma mark Delegate Methods

/*!
    @category NSObject(FSKConnectionDelegate)

    The FSKConnectionDelegate category on NSObject defines
    FSKConnection delegate methods that can be implemented by
    objects to receive informational callbacks about the asynchronous
    load of a URL request. Other delegate methods provide hooks that
    allow the delegate to customize the process of performing an
    asynchronous URL load.

    <p>Note that all these will be called on the thread that started
    the asynchronous load operation on the associated FSKConnection
    object.
    <p>The following contract governs the delivery of the callbacks
    defined in this interface:
    <ul>
    <li>Zero or more <tt>-connection:willSendRequest:redirectResponse:</tt> 
    messages will be sent to the delegate before any other messages in this
    list are sent.
    <li>Before receiving a response or processing a redirect,
    <tt>connection:didReceiveAuthenticationChallenge:</tt> may be
    received if authentication is required.
    <li>Zero or more <tt>connection:didReceiveResponse:</tt> messages
    will be sent to the delegate before receiving a
    <tt>-connection:didReceiveData:</tt> message. In rare cases, as will
    occur in an HTTP load where the content type of the load data is
    multipart/x-mixed-replace, the delegate will receive more than one
    <tt>connection:didReceiveResponse:</tt> message. In the event this
    occurs, delegates should discard all data previously delivered by
    way of the <tt>-connection:didReceiveData:</tt>, and should be
    prepared to handle the, potentially different, MIME type reported by
    the NSURLResponse. Note that the only case where a response is not
    sent to a delegate is when the protocol implemenation encounters an
    error before a response could be created.
    <li>Zero or more <tt>connection:didReceiveData:</tt> messages will
    be sent before and of the following messages are sent to the
    delegate:
        <ul>
        <li><tt>connection:willCacheResponse:</tt>
        <li><tt>-connectionDidFinishLoading:</tt>
        <li><tt>-connection:didFailWithError:</tt>
        </ul>
    <li>Zero or one <tt>connection:willCacheResponse:</tt> messages will
    be sent to the delegate after <tt>connection:didReceiveData:</tt>
    are sent but before a <tt>-connectionDidFinishLoading:</tt> message
    is sent.
    <li>Unless a FSKConnection receives a <tt>-cancel</tt> message,
    the delegate will receive one and only one of
    <tt>-connectionDidFinishLoading:</tt>, or
    <tt>-connection:didFailWithError:</tt> message, but never
    both. In addition, once either of these callbacks is sent, the
    delegate will receive no further callbacks of any kind for the
    given FSKConnection. 
    </ul>
*/
@interface NSObject (FSKConnectionDelegate)

/*!
    @method connection:didReceiveAuthenticationChallenge:
    @abstract Start authentication for a given challenge
    @discussion Call useCredential:forAuthenticationChallenge:,
    continueWithoutCredentialForAuthenticationChallenge: or cancelAuthenticationChallenge: on
    the challenge sender when done.
    @param connection the connection for which authentication is needed
    @param challenge The NSURLAuthenticationChallenge to start authentication for
*/
- (void)connection:(FSKConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
    @method connection:didCancelAuthenticationChallenge:
    @abstract Cancel authentication for a given request
    @param connection the connection for which authentication was cancelled
    @param challenge The NSURLAuthenticationChallenge for which to cancel authentication
*/
- (void)connection:(FSKConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*! 
    @method connection:didReceiveResponse:   
    @abstract This method is called when the URL loading system has
    received sufficient load data to construct a NSURLResponse object.
    @discussion The given NSURLResponse is immutable and
    will not be modified by the URL loading system once it is
    presented to the FSKConnectionDelegate by this method.
    <p>See the category description for information regarding
    the contract associated with the delivery of this delegate 
    callback.
    @param connection an FSKConnection instance for which the
    NSURLResponse is now available.
    @param response the NSURLResponse object for the given
    FSKConnection.
*/
- (void)connection:(FSKConnection *)connection didReceiveResponse:(NSURLResponse *)response;

/*! 
    @method connectionDidFinishLoading:   
    @abstract This method is called when an FSKConnection has
    finished loading successfully.
    @discussion See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param connection an FSKConnection that has finished loading
    successfully.
*/
- (void)connectionDidFinishLoading:(FSKConnection *)connection;

/*! 
    @method connection:didFailWithError:   
    @abstract This method is called when an FSKConnection has
    failed to load successfully.
    @discussion See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param connection an FSKConnection that has failed to load.
    @param error The error that encapsulates information about what
    caused the load to fail.
*/
- (void)connection:(FSKConnection *)connection didFailWithError:(NSError *)error;

@end



@interface NSString (StringExtras)
- (NSString *) encodeURLLegally;
@end

@interface NSDictionary (webFormEncoded)
/*
Return the key-value pairs in the dictionary, with the keys and values encoded as query parameters, 
paired by =, and delimited with &. This is the format for a full set of named parameters in a 
URL-coded query.
Original Source: <http://www.mactech.com/articles/mactech/Vol.19/19.03/HTTPMessages/index.html>
*/
- (NSString *) webFormEncoded;
@end
