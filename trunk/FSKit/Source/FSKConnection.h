//
//  FamilySearchConnection.h
//  FamilySearchKit
//
//  Created by Logan Allred on 6/9/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
    @class
    @abstract    <#(brief description)#>
    @discussion  <#(comprehensive description)#>
*/

@class FSKRequest;

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
extern NSString *kFSAPIProductionBaseURLString;  // Production
extern NSString *kFSAPIBetaBaseURLString;  // Beta
extern NSString *kFSAPIDevBaseURLString;  // Development

/*!
    @const 
    @abstract   <#(description)#>
    @discussion <#(description)#>
*/
extern NSString *FSAPIVersion;

/*!
    @class	FSKConnection
    @abstract    Stores details needed to make connections to the FamilySearch web services, including authentication
	@discussion  (comprehensive description)
*/
@interface FSKConnection : NSObject {

	NSURLCredential *credential;
	
	NSString *baseURLString;

	NSString *developerKey;
	NSString *_sessionId;
	BOOL needsAuthentication;
	NSTimeInterval connectionTimeoutInterval;
	id _delegate;	
	NSMutableDictionary *responseDataCache;
	NSMutableArray *requestQueue;
}

/*!
	@method     init
	@abstract   (brief description)
	@discussion (comprehensive description)
*/
- (id)init;

#pragma mark Accessors

- (NSString *)baseURLString;
- (void)setBaseURLString:(NSString *)value;

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


- (void)handleAuthenticationForRequest:(FSKRequest *)request;
@end

#pragma mark -
#pragma mark Delegate Methods
/*!
    @category NSObject(FSKConnectionDelegate)

    The FSKConnectionDelegate category on NSObject defines
    FSKRequest delegate methods that can be implemented by
    objects to receive informational callbacks about the asynchronous
    load of a FamilySearch API request. For now it just allows a more
	centralized location to handle authentication events than with
	the FSKRequestDelegate. It may expand to serve as an alternate
	to the other FSKRequestDelegate methods as well

    <p>See FSKRequestDelegate for detailed documentation
*/
@interface NSObject (FSKConnectionDelegate)

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

@end
