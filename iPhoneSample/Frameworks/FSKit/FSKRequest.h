//
//  FSKRequest.h
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSKConnection.h"
#import "FSKResponse.h"
#import "FSKError.h"

/*!
    @brief    Base class for all FamilySearch Request types
    @details  Provides common functionality for all FamilySearch request types
	including handling the NSURLRequest and constructing the base response. While
	can be used directly, it is typically more convenient to use one of the subclasses
	for the specific type of request you need.
	
	A FamilySearch request consists of:
	  [baseURL]/[endpoint]/[resource id(s)]?[parameters]
	The baseURL is retrieved from the FSKConnection.
	The endpoint consists of:
	  [module]/[version]/[request]
	  
	The resource ids and parameters are not needed for some requests
	
*/
@interface FSKRequest : NSObject
{
	FSKConnection *familySearchConnection;
	id _delegate;
	SEL _selector;
	int _responseCode;
	NSMutableData *responseData;

	NSString *_endpoint;
	NSSet *_idList;
	NSDictionary *_parameters;
}

-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
									 delegate:(id)aDelegate 
									 selector:(SEL)aSelector;

+(void)fetchFamilySearchData:(NSString *)endpoint WithIds:(NSSet *)idList parameters:(NSDictionary *)parameters connection:aFamilySearchConnection delegate:(id)aDelegate selector:(SEL)aSelector;

-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
							 WithIds:(NSSet *)idList
						  parameters:(NSDictionary *)parameters;
						  
- (void)reissueRequest;						  
								 
-(NSURL *)generateFamilySearchURLAtEndpoint:(NSString *)endpoint 
								    WithIds:(NSSet *)idList
                                 parameters:(NSDictionary *)parameters;
								 
- (FSKResponse *)responseWithData:(NSData *)data;								 

//#pragma mark Request Methods

	//synchronous requests
//-(id)fetchFamilySearchData:(NSURL *)theURL;
//-(id)postFamilySearchData:(NSURL *)theURL withData:(NSData *)theData ofType:(NSString *)contentType;
//
//-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
//							   WithIds:(NSSet *)idList
//						    parameters:(NSDictionary *)dict;
								 
#pragma mark Accessors
- (id)delegate;
- (void)setDelegate:(id)value;

@end

#pragma mark -
#pragma mark Delegate Methods

/*!
    @category NSObject(FSKRequestDelegate)

    The FSKRequestDelegate category on NSObject defines
    FSKRequest delegate methods that can be implemented by
    objects to receive informational callbacks about the asynchronous
    load of a FamilySearch API request.

    <p>Note that all these will be called on the thread that started
    the asynchronous load operation on the associated FSKRequest
    object.
    <p>The following contract governs the delivery of the callbacks
    defined in this interface:
    <ul>
    <li>Before receiving a response or processing a redirect,
    <tt>request:didReceiveAuthenticationChallenge:</tt> may be
    received if authentication is required.
    <li>Unless a FSKRequest receives a <tt>-cancel</tt> message,
    the delegate will receive one and only one of
    <tt>-request:didReturnResponse:</tt>, or
    <tt>-request:didFailWithError:</tt> message, but never
    both. In addition, once either of these callbacks is sent, the
    delegate will receive no further callbacks of any kind for the
    given FSKRequest. 
    </ul>
*/
@interface NSObject (FSKRequestDelegate)

/*! 
    @brief This method is called when an FSKRequest has
    finished loading successfully.
    @details See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param request an FSKRequest that has finished loading
    successfully.
	@param response an FSKResponse that contains the
*/
- (void)request:(FSKRequest *)request didReturnResponse:(FSKResponse *)response;

/*! 
    @brief This method is called when an FSKRequest has
    failed to load successfully.
    @details See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param request an FSKRequest that has failed to load.
    @param error The error that encapsulates information about what
    caused the load to fail.
*/
- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error;

@end

/*!
    @brief    <#(brief description)#>
    @details  <#(comprehensive description)#>
*/
@interface NSString (StringExtras)
- (NSString *) encodeURLLegally;
@end

/*!
    @brief    <#(brief description)#>
    @details  <#(comprehensive description)#>
*/
@interface NSDictionary (webFormEncoded)
/*
 Return the key-value pairs in the dictionary, with the keys and values encoded as query parameters, 
 paired by =, and delimited with &. This is the format for a full set of named parameters in a 
 URL-coded query.
 Original Source: <http://www.mactech.com/articles/mactech/Vol.19/19.03/HTTPMessages/index.html>
 */
- (NSString *) webFormEncoded;
@end
