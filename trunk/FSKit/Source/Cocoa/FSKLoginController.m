//
//  FSKLoginController.m
//  FSKit
//
//  Created by Logan Allred on 1/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

// The controller can either limit it's scope to providing a username/password credential, or it
// can handle the entier authentication challenge. We'll see if it can handle both

#import "FSKLoginController.h"
#import "FSKConnection.h"

#define LoginPanelNibName @"LoginPanel"


static NSString *ERR_LOGIN_AUTHENTICATION = @"Invalid sign-in name or password";
static NSString *ERR_LOGIN_OTHER = @"Login Error.";
static NSString *ERR_LOGIN_NO_CREDENTIALS_SPECIFIED = @"Sign-in name or password not specified";

//static NSString *kUSERNAME_DEFAULTS_KEY = @"username";
//static NSString *kPASSWORD_DEFAULTS_KEY = @"password";
//static NSString *kAPI_URL_DEFAULTS_KEY = @"apiurl";
//static NSString *kAUTOLOGIN_DEFAULTS_KEY = @"autologin";
static NSString *kREGISTRATION_URL = @"https://new.familysearch.org/";  // TODO, fix this once registration is available

static NSString *kDEFAULT_SECURITY_DOMAIN = @"FamilySearch API, Version 1.0"; // TODO get this from the challenge


@implementation FSKLoginController
- (id)init
{
    self = [super initWithWindowNibName:@"LoginDialog"];
    
    if ( self ) {
//		_request = [request retain];
//		loginProperties = [[NSMutableDictionary alloc] init];
	}
    return self;
}

- (void)dealloc
{
//	[loginProperties release];
//	[_request release];
    [super dealloc];
}

//- (IBAction)login:(id)sender {
//	NSURLCredential *credential = [NSURLCredential credentialWithUser:[signInNameField stringValue] password:[passwordField stringValue] persistence:nil];
//	//[NSApp endSheet:[self window]];
//}

- (IBAction)cancel:(id)sender {
    // This is required because the body of this method is going to
    // remove all of the panel's remaining refs, which can cause a
    // crash later when finishing button hit tracking.  So we make
    // sure it lives on a bit longer.
    [[loginPanel retain] autorelease];
    
    // This is required as a workaround for AppKit issue 4118422
    [[self retain] autorelease];

    [loginPanel close];
    if (usingSheet) {
        [[NSApplication sharedApplication] endSheet:loginPanel returnCode:1];
    } else {
        [[NSApplication sharedApplication] stopModalWithCode:1];
    }

}
    /*
- (void) login {
    NSDictionary *values = [[NSUserDefaultsController sharedUserDefaultsController] values];
    NSString *user = [values valueForKey: kUSERNAME_DEFAULTS_KEY];
    NSString *apiURLString = [values valueForKey: kAPI_URL_DEFAULTS_KEY];
	NSURL *apiURL = [NSURL URLWithString: FSAPIServerUrlString];
	NSError *loginError;

	BOOL autologin = NO;//[[values valueForKey: kAUTOLOGIN_DEFAULTS_KEY] boolValue];

	if (user) {
//		[loginProperties setObject: user forKey: kUSERNAME_DEFAULTS_KEY];

		NSString *password = [SFHFKeychainUtils getWebPasswordForUser: user URL: apiURL domain: kDEFAULT_SECURITY_DOMAIN itemReference: NULL];
				
		if (password) {
			if (autologin) {
				if ([self loginWithUsername: user password: password APIURL: apiURL error: &loginError])
					return;
				else if([loginError code] == -1012)
					[loginErrorText setStringValue: ERR_LOGIN_AUTHENTICATION];
				else 
					[loginErrorText setStringValue: ERR_LOGIN_OTHER];
			}
//			[loginProperties setObject: password forKey: kPASSWORD_DEFAULTS_KEY];
		}
	}
	
//	[loginProperties setObject: [NSNumber numberWithBool: autologin] forKey: @"autologin"];
	
	NSLog(@"main window: %@", [NSApp mainWindow]);
	NSLog(@"self window: %@", [self window]);
	NSLog(@"login panel: %@", loginPanel);
	[NSApp beginSheet:[self window]
		modalForWindow:nil
		 modalDelegate:self
		didEndSelector:@selector(loginSheetFinished:)
		 contextInfo:nil];
//	[loginPanel makeKeyAndOrderFront: self];
}
*/

- (IBAction) loginFromPanel: (id) sender {
	[loginErrorText setStringValue: @""];
	[loginErrorText display];
	[spinner startAnimation: self];
	//[self commitEditing];

	NSString *username = [signInNameField stringValue];//[loginProperties objectForKey: kUSERNAME_DEFAULTS_KEY];
	NSString *password = [passwordField stringValue];//[loginProperties objectForKey: kPASSWORD_DEFAULTS_KEY];
//	BOOL autologin = [[loginProperties objectForKey: @"autologin"] boolValue];
	NSError *loginError;
	
	if (!username || !password || [username length] == 0 || [password length] == 0) {
		[loginErrorText setStringValue: ERR_LOGIN_NO_CREDENTIALS_SPECIFIED];
		[spinner stopAnimation: self];
		return;
	}
	
//from webkit
    // This is required because the body of this method is going to
    // remove all of the panel's remaining refs, which can cause a
    // crash later when finishing button hit tracking.  So we make
    // sure it lives on a bit longer.
    [[loginPanel retain] autorelease];

    [loginPanel close];
    if (usingSheet) {
        [[NSApplication sharedApplication] endSheet:loginPanel returnCode:0];
    } else {
        [[NSApplication sharedApplication] stopModalWithCode:0];
    }

//    NSDictionary *values = [[NSUserDefaultsController sharedUserDefaultsController] values];	
//    NSString *apiURLString = [values valueForKey: kAPI_URL_DEFAULTS_KEY];
//	NSURL *apiURL = [NSURL URLWithString: FSAPIServerUrlString];	
	
	/* Write username to defaults */
//	NSUserDefaults *defaults = [[NSUserDefaultsController sharedUserDefaultsController] defaults];
//	[defaults setObject: username forKey: kUSERNAME_DEFAULTS_KEY];
	
	/* If we're supposed to autologin, remember that */
//	[defaults setObject: [NSNumber numberWithBool: autologin] forKey: kAUTOLOGIN_DEFAULTS_KEY];
		
	/* Make sure the password gets updated in both the keychain and the shared NSURLCredentialStorage used by NSURLConnection */
//	NSURLCredential *credential = [NSURLCredential credentialWithUser: username password: password persistence: NSURLCredentialPersistenceForSession];
//	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc] initWithHost: [apiURL host] port: 0 protocol: [apiURL scheme] realm: kDEFAULT_SECURITY_DOMAIN authenticationMethod: NSURLAuthenticationMethodDefault];
//	NSLog(@"b4 def cred: %@", [[NSURLCredentialStorage sharedCredentialStorage] defaultCredentialForProtectionSpace: protectionSpace]);
//	NSLog(@"b4 all creds: %@", [[NSURLCredentialStorage sharedCredentialStorage] credentialsForProtectionSpace: protectionSpace]);
//	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential: credential forProtectionSpace: protectionSpace];
//	NSLog(@"af def cred: %@", [[NSURLCredentialStorage sharedCredentialStorage] defaultCredentialForProtectionSpace: protectionSpace]);
//	NSLog(@"af all creds: %@", [[NSURLCredentialStorage sharedCredentialStorage] credentialsForProtectionSpace: protectionSpace]);
	
//	if([self loginWithUsername: username password: password APIURL: apiURL error: &loginError]) {
//		[loginPanel close];
//	}
//	else {
//		if([loginError code] == -1012)
//			[loginErrorText setStringValue: ERR_LOGIN_AUTHENTICATION];
//		else
//			[loginErrorText setStringValue: ERR_LOGIN_OTHER];
//	}
	
	[spinner stopAnimation: self];
}

- (IBAction) cancelLogin: (id) sender {
    [[NSUserDefaultsController sharedUserDefaultsController] revert: self];
    [self cancel:sender];
}

- (IBAction) openRegistrationURL: (id) sender {
    [[NSWorkspace sharedWorkspace] openURL: [NSURL URLWithString: kREGISTRATION_URL]];
}


-(void)startAuthentication:(NSURLAuthenticationChallenge *)challenge window:(NSWindow *)w
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [challenge protectionSpace]);
	NSLog(@"%s host:%@ realm:%@", __PRETTY_FUNCTION__, [[challenge protectionSpace] host], [[challenge protectionSpace] realm]);
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [[NSURLCredentialStorage sharedCredentialStorage] credentialsForProtectionSpace:[challenge protectionSpace]]);
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [[NSURLCredentialStorage sharedCredentialStorage] defaultCredentialForProtectionSpace:[challenge protectionSpace]]);
                                                                    
	NSURLCredential *latestCredential = [[NSURLCredentialStorage sharedCredentialStorage] defaultCredentialForProtectionSpace:[challenge protectionSpace]];
	NSLog(@"latestCredential: %@ hasPwd: %d", latestCredential, [latestCredential hasPassword]);
	
    if ([latestCredential hasPassword]) {
        [[challenge sender] useCredential:latestCredential forAuthenticationChallenge:challenge];
        [challenge release];
        return;
    }
                                                                    
//    [self startAuthentication:challenge window:(window == WebModalDialogPretendWindow ? nil : window)];
    //[challenge release];


    id window = w;// ? (id)w : (id)WebModalDialogPretendWindow;

    // In this case, we have an attached sheet that's not one of our
    // authentication panels, so enqueing is not an option. Just
    // cancel authentication instead, since this case is fairly
    // unlikely (how would you be loading a page if you had an error
    // sheet up?)
    if ([w attachedSheet] != nil) {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
        return;
    }

    
    if (window) {
        [self runAsSheetOnWindow:window withChallenge:challenge];
    } else {
        [self runAsModalDialogWithChallenge:challenge];
    }
}

-(void)cancelAuthentication:(NSURLAuthenticationChallenge *)challenge
{
	[loginPanel cancelOperation:self];
}

-(void)_authenticationDoneWithChallenge:(NSURLAuthenticationChallenge *)challenge result:(NSURLCredential *)credential
{
	NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, challenge, credential);

    if (credential == nil) {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    } else {
        [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
    }

}


- (BOOL)loadNib
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	
    if (!nibLoaded) {
        if ([NSBundle loadNibNamed:LoginPanelNibName owner:self]) {
            nibLoaded = YES;
            [imageView setImage:[NSImage imageNamed:@"NSApplicationIcon"]];
        } else {
           NSLog(@"couldn't load nib named '%@'", LoginPanelNibName);
            return FALSE;
        }
    }
    return TRUE;
}

// Methods related to displaying the panel

-(void)setUpForChallenge:(NSURLAuthenticationChallenge *)chall
{
    [self loadNib];

    NSURLProtectionSpace *space = [chall protectionSpace];

    NSString *host;
    if ([space port] == 0) {
        host = [space host];
    } else {
        host = [NSString stringWithFormat:@"%@:%u", [space host], [space port]];
    }

 //   NSString *realm = [space realm];
    NSString *message = @"";

    if ([chall previousFailureCount] > 0) {
            message = @"The sign-in name or password was incorrect. Please try again.";
    }

    [loginErrorText setStringValue:message];
    //[mainLabel sizeToFitAndAdjustWindowHeight];

//    if ([space receivesCredentialSecurely]) {
//        [smallLabel setStringValue:
//            @"Your log-in information will be sent securely."];
//    } else {
//        [smallLabel setStringValue:
//            @"Your password will be sent in the clear."];
//    }

    if ([[chall proposedCredential] user] != nil) {
        [signInNameField setStringValue:[[chall proposedCredential] user]];
        [loginPanel setInitialFirstResponder:passwordField];
    } else {
        [signInNameField setStringValue:@""];
        [passwordField setStringValue:@""];
        [loginPanel setInitialFirstResponder:signInNameField];
}
}

- (void)runAsModalDialogWithChallenge:(NSURLAuthenticationChallenge *)chall
{
    [self setUpForChallenge:chall];
    usingSheet = FALSE;
    NSURLCredential *credential = nil;

    if ([[NSApplication sharedApplication] runModalForWindow:loginPanel] == 0) {
        credential = [NSURLCredential credentialWithUser:[signInNameField stringValue] password:[passwordField stringValue] persistence:([remember state] == NSOnState) ? NSURLCredentialPersistenceForSession : NSURLCredentialPersistenceForSession];
    }
	else
	{
		[[chall sender] cancelAuthenticationChallenge:chall];		
	}

	[[chall sender] useCredential:credential forAuthenticationChallenge:chall];
//    [callback performSelector:selector withObject:chall withObject:credential];
}

- (void)runAsSheetOnWindow:(NSWindow *)window withChallenge:(NSURLAuthenticationChallenge *)chall
{
    //ASSERT(!usingSheet);

    [self setUpForChallenge:chall];

    usingSheet = TRUE;
    _challenge = [chall retain];
    
    [[NSApplication sharedApplication] beginSheet:loginPanel modalForWindow:window modalDelegate:self didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:) contextInfo:NULL];
}

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void  *)contextInfo
{
    if (returnCode == 0) {
        [[_challenge sender] useCredential:[NSURLCredential credentialWithUser:[signInNameField stringValue] password:[passwordField stringValue] persistence:([remember state] == NSOnState) ? NSURLCredentialPersistenceForSession : NSURLCredentialPersistenceForSession] forAuthenticationChallenge:_challenge];
    }
	else
	{
		[[_challenge sender] cancelAuthenticationChallenge:_challenge];
	}

    [_challenge release];
}

@end

/*
	NSProgressIndicator subclass that hides itself when it's empty (not indeterminate, and a value of 0.0)
	Original Source: <http://cocoa.karelia.com/AppKit_Classes/NSProgressIndicator_.m>
	(See copyright notice at <http://cocoa.karelia.com>)
*/
/*
@interface HidingProgress : NSProgressIndicator

- (void)drawRect:(NSRect)aRect;

@end

@implementation HidingProgress

- (void)drawRect:(NSRect)aRect
{
	if ([self isIndeterminate] || [self doubleValue] > 0.0)
	{
		[super drawRect:aRect];
	}
}

@end
*/