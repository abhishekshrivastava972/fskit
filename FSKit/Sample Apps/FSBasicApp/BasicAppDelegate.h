#import <Cocoa/Cocoa.h>
#import <FSKit/FSKit.h>

@interface BasicAppDelegate : NSObject {
	FSKConnection *connection;
	FSKPersonService *personService;
	
	FSKPersonResponse *lastResponse;
	FSKError *lastError;
}

- (void)request:(FSKRequest *)request 
    didReturnResponse:(FSKResponse *)response;
- (void)request:(FSKRequest *)request 
    didFailWithError:(FSKError *)error;

@end
