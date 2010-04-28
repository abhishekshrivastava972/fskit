/* MyAppDelegate */

#import <Foundation/Foundation.h>
#import <FSKit/FSKit.h>

@interface FSAppTestDelegate : NSObject
{
	FSKConnection *connection;
	FSKPersonService *personService;
	FSKIdentityService *identityService;

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
- (IBAction)logout:(id)sender;

@end
