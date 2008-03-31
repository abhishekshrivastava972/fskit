#import <Cocoa/Cocoa.h>
#import <FSKit/FSKit.h>

@interface BasicAppDelegate : NSObject {
	FSKConnection *connection;
	FSKPersonService *personService;
}

- (void)request:(FSKRequest *)request 
    didReturnResponse:(FSKResponse *)response;
- (void)request:(FSKRequest *)request 
    didFailWithError:(FSKError *)error;

@end
