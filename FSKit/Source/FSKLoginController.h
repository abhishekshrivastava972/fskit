//
//  FSKLoginController.h
//  FSKit
//
//  Created by Logan Allred on 1/24/08.
//  Copyright 2008 Logan Allred. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FSKLoginController : NSWindowController {
	IBOutlet NSTextField *signInNameField;
	IBOutlet NSTextField *passwordField;
	IBOutlet NSProgressIndicator *spinner;
//	IBOutlet NSTextField *statusLabel;
	
    IBOutlet NSPanel *loginPanel;
//	IBOutlet NSProgressIndicator *loginSpinner;
	IBOutlet NSTextField *loginErrorText;
//	IBOutlet NSController *loginController;
//	NSMutableDictionary *currentPostProperties;
//	NSMutableDictionary *loginProperties;
	
//	IBOutlet id mainLabel;
//    IBOutlet id panel;
//    IBOutlet id password;
//    IBOutlet id smallLabel;
//    IBOutlet id username;
    IBOutlet id imageView;
    IBOutlet id remember;
    BOOL nibLoaded;
    BOOL usingSheet;
//    id callback;
//    SEL selector;
    NSURLAuthenticationChallenge *_challenge;

//	FSKRequest *_request;
}
- (id)init;

- (IBAction)cancel:(id)sender;
//- (IBAction)login:(id)sender;

//- (void) login;
//- (BOOL) loginWithUsername: (NSString *) username password: (NSString *) password APIURL: (NSURL *) APIURL error: (NSError **) error;

- (IBAction) loginFromPanel: (id) sender;
- (IBAction) cancelLogin: (id) sender;
- (IBAction) openRegistrationURL: (id) sender;

//from webkit panel
//-(id)initWithCallback:(id)cb selector:(SEL)sel;

- (BOOL)loadNib;

- (void)runAsModalDialogWithChallenge:(NSURLAuthenticationChallenge *)chall;
- (void)runAsSheetOnWindow:(NSWindow *)window withChallenge:(NSURLAuthenticationChallenge *)chall;

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void  *)contextInfo;

// from webkit handler
- (void)startAuthentication:(NSURLAuthenticationChallenge *)challenge window:(NSWindow *)w;
- (void)cancelAuthentication:(NSURLAuthenticationChallenge *)challenge;

//- (void)credential

@end
