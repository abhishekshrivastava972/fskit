//
//  FSKRequest.h
//  FSKit
//
//  Created by Logan Allred on 1/20/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FSKConnection.h"
#import "FSKResponse.h"
#import "FSKError.h"

/*!
    @class
    @abstract    <#(brief description)#>
    @discussion  <#(comprehensive description)#>
*/

@interface FSKRequest : NSObject {
	FSKConnection *familySearchConnection;
	id _delegate;
	SEL _selector;
	NSMutableData *responseData;

}

-(id)initWithFamilySearchConnection:(FSKConnection *)aFamilySearchConnection 
									 delegate:(id)aDelegate 
									 selector:(SEL)aSelector;

+(void)fetchFamilySearchData:(NSString *)endpoint WithIds:(NSSet *)idList parameters:(NSDictionary *)parameters connection:aFamilySearchConnection delegate:(id)aDelegate selector:(SEL)aSelector;

-(void)fetchFamilySearchDataAtEndpoint:(NSString *)endpoint 
							 WithIds:(NSSet *)idList
						  parameters:(NSDictionary *)parameters;
								 
-(NSURL *)generateFamilySearchURLAtEndpoint:(NSString *)endpoint 
								    WithIds:(NSSet *)idList
                                 parameters:(NSDictionary *)parameters;
								 
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
    @method request:didReceiveAuthenticationChallenge:
    @abstract Start authentication for a given challenge
    @discussion Call useCredential:forAuthenticationChallenge:,
    continueWithoutCredentialForAuthenticationChallenge: or cancelAuthenticationChallenge: on
    the challenge sender when done.
    @param request the request for which authentication is needed
    @param challenge The NSURLAuthenticationChallenge to start authentication for
*/
- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
    @method windowForAuthenticationSheet:    
    @abstract   Provides the window to attach the authentication sheet to
    @discussion If you implement this delegate method, you can choose which window will have
	the authentication sheet attached to it during an authentication challenge. If you do not
	implement this method, by default the sheet will attempt to attach to [NSApp mainWindow].
	If you return nil, the authentication will be performed with an application modal dialog
	instead of a sheet.
*/
- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request;

/*!
    @method request:didCancelAuthenticationChallenge:
    @abstract Cancel authentication for a given request
    @param request the request for which authentication was cancelled
    @param challenge The NSURLAuthenticationChallenge for which to cancel authentication
*/
- (void)request:(FSKRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*! 
    @method request:didReturnResponse:   
    @abstract This method is called when an FSKRequest has
    finished loading successfully.
    @discussion See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param request an FSKRequest that has finished loading
    successfully.
	@param responseXML an NSXMLDocument that contains the
*/
- (void)request:(FSKRequest *)request didReturnResponse:(FSKResponse *)response;

/*! 
    @method request:didFailWithError:   
    @abstract This method is called when an FSKRequest has
    failed to load successfully.
    @discussion See the category description for information regarding
    the contract associated with the delivery of this delegate
    callback.
    @param request an FSKRequest that has failed to load.
    @param error The error that encapsulates information about what
    caused the load to fail.
*/
- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error;

@end