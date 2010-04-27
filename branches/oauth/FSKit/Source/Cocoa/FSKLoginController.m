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


static NSString *ERR_LOGIN_OTHER = @"Login Error.";
static NSString *kREGISTRATION_URL = @"https://new.familysearch.org/";  // TODO, fix this once registration is available

@implementation FSKLoginController
- (id) initWithDelegate:(id)delegate
{
    self = [super initWithWindowNibName:@"LoginDialog"];
    
    if ( self ) {
		_delegate = delegate;
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

	NSError *loginError;
	
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

	[_delegate authenticate];
//    NSDictionary *values = [[NSUserDefaultsController sharedUserDefaultsController] values];	
//    NSString *apiURLString = [values valueForKey: kAPI_URL_DEFAULTS_KEY];
//	NSURL *apiURL = [NSURL URLWithString: FSAPIServerUrlString];	
	
	/* If we're supposed to autologin, remember that */
//	[defaults setObject: [NSNumber numberWithBool: autologin] forKey: kAUTOLOGIN_DEFAULTS_KEY];
		
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


-(void)startAuthenticationForWindow:(NSWindow *)w
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
                                                                    
//    [self startAuthentication:challenge window:(window == WebModalDialogPretendWindow ? nil : window)];
    //[challenge release];


    id window = w;// ? (id)w : (id)WebModalDialogPretendWindow;

    // In this case, we have an attached sheet that's not one of our
    // authentication panels, so enqueing is not an option. Just
    // cancel authentication instead, since this case is fairly
    // unlikely (how would you be loading a page if you had an error
    // sheet up?)
    if ([w attachedSheet] != nil) {
//        [[challenge sender] cancelAuthenticationChallenge:challenge];
        return;
    }

    
    if (window) {
        [self runAsSheetOnWindow:window];
    } else {
        [self runAsModalDialog];
    }
}

-(void)cancelAuthentication
{
	[loginPanel cancelOperation:self];
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

-(void)setUpForAuthentication
{
    [self loadNib];

 //   NSString *realm = [space realm];
    NSString *message = @"";

//    if ([chall previousFailureCount] > 0) {
//            message = @"The sign-in name or password was incorrect. Please try again.";
//    }

    [loginErrorText setStringValue:message];
    //[mainLabel sizeToFitAndAdjustWindowHeight];

}

- (void)runAsModalDialog
{
    [self setUpForAuthentication];
    usingSheet = FALSE;

    if ([[NSApplication sharedApplication] runModalForWindow:loginPanel] == 0) {
//        credential = [NSURLCredential credentialWithUser:[signInNameField stringValue] password:[passwordField stringValue] persistence:([remember state] == NSOnState) ? NSURLCredentialPersistenceForSession : NSURLCredentialPersistenceForSession];
    }
	else
	{
//		[[chall sender] cancelAuthenticationChallenge:chall];		
	}

//	[[chall sender] useCredential:credential forAuthenticationChallenge:chall];
//    [callback performSelector:selector withObject:chall withObject:credential];
}

- (void)runAsSheetOnWindow:(NSWindow *)window
{
    //ASSERT(!usingSheet);

    [self setUpForAuthentication];

    usingSheet = TRUE;
    
    [[NSApplication sharedApplication] beginSheet:loginPanel modalForWindow:window modalDelegate:self didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:) contextInfo:NULL];
}

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void  *)contextInfo
{
    if (returnCode == 0) {
//        [[_challenge sender] useCredential:[NSURLCredential credentialWithUser:[signInNameField stringValue] password:[passwordField stringValue] persistence:([remember state] == NSOnState) ? NSURLCredentialPersistenceForSession : NSURLCredentialPersistenceForSession] forAuthenticationChallenge:_challenge];
    }
	else
	{
//		[[_challenge sender] cancelAuthenticationChallenge:_challenge];
	}

//    [_challenge release];
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