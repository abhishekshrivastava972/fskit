/* MyAppDelegate */

#import <Cocoa/Cocoa.h>
#import <FSKit/FSKit.h>

@interface MyAppDelegate : NSObject
{
	FSKConnection *connection;
	FSKFamilyTreeService *ftService;
	FSKIdentityService *identityService;
	NSXMLDocument *theDocument;

    IBOutlet NSTextView *loginResults;
    IBOutlet NSTextView *myResults;
	IBOutlet NSTextField *welcomeMessage;
	IBOutlet NSTextField *sessionId;
	IBOutlet NSTextField *username;
	IBOutlet NSTextField *password;
	IBOutlet NSMatrix *radio;
}
- (IBAction)fetchMe:(id)sender;
- (IBAction)login:(id)sender;

- (NSXMLDocument *)theDocument;
- (void)setTheDocument:(NSXMLDocument *)newTheDocument;

@end
