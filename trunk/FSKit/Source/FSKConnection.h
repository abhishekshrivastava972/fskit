//
//  FamilySearchConnection.h
//  FamilySearchKit
//
//  Created by Logan Allred on 6/9/07.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
    @brief    FSKRequest brief
    @details  FSKRequest details
*/

@class FSKRequest;

/*!
    @brief   <#(description)#>
    @details <#(description)#>
*/
#define FSKitVersion @"0.1"

/*!
    @brief   <#(description)#>
    @details <#(description)#>
*/
#define FSKitAgent @"FSKit"

/*!
    @brief   <#(description)#>
    @details <#(description)#>
*/
extern NSString *kFSAPIProductionBaseURLString;  // Production
extern NSString *kFSAPIBetaBaseURLString;  // Beta
extern NSString *kFSAPIDevBaseURLString;  // Development

/*!
    @brief   <#(description)#>
    @details <#(description)#>
*/
extern NSString *FSAPIVersion;

/*!
    @class	FSKConnection
    @brief    Stores details needed to make connections to the FamilySearch web services, including authentication
	@details  (comprehensive description)
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
	@brief   (brief description)
	@details (comprehensive description)
*/
- (id)init;

#pragma mark Accessors

- (NSString *)baseURLString;
- (void)setBaseURLString:(NSString *)value;

/*!
    @brief   <#(brief description)#>
    @details <#(comprehensive description)#>
*/
- (NSURLCredential *)credential;
- (void)setCredential:(NSURLCredential *)value;

/**
 * Stores the developer key for this session, only used for login requests, but is required
 */
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
    @brief Start authentication for a given challenge
    @details Call useCredential:forAuthenticationChallenge:,
    continueWithoutCredentialForAuthenticationChallenge: or cancelAuthenticationChallenge: on
    the challenge sender when done.
    @param request the request for which authentication is needed
    @param challenge The NSURLAuthenticationChallenge to start authentication for
*/
- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
    @brief   Provides the window to attach the authentication sheet to
    @details If you implement this delegate method, you can choose which window will have
	the authentication sheet attached to it during an authentication challenge. If you do not
	implement this method, by default the sheet will attempt to attach to [NSApp mainWindow].
	If you return nil, the authentication will be performed with an application modal dialog
	instead of a sheet.
*/
- (NSWindow *)windowForAuthenticationSheet:(FSKRequest *)request;

/*!
    @brief Cancel authentication for a given request
    @param request the request for which authentication was cancelled
    @param challenge The NSURLAuthenticationChallenge for which to cancel authentication
*/
- (void)request:(FSKRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

@end
