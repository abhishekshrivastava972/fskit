#import "FSAppTestDelegate.h"
#import "FSKSharedDefines.h"

#define DEFAULT_CALLBACK_HANDLER YES

@implementation FSAppTestDelegate
- (id)init {
	self = [super init];
	connection  = [[[FSKConnection alloc] init] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	[connection setUserAgentString:@"FSAppTest/1.0" override:NO];
	
	personService = [[FSKPersonService personServiceWithConnection:connection delegate:self] retain];
	identityService = [[FSKIdentityService identityServiceWithConnection:connection delegate:self] retain];
	return self;
}

- (void)dealloc {
	[connection release];
	[personService release];
	[identityService release];
	[super dealloc];
}

- (void)awakeFromNib
{
//	[connection ];
	[identityService fetchProperties];
}


- (IBAction)login:(id)sender
{
	NSLog(@"%s", _cmd);

	[identityService login];
}

- (IBAction)logout:(id)sender
{
	NSLog(@"%s", _cmd);
	
	[identityService logout];
}

- (IBAction)fetchMe:(id)sender
{
	NSLog(@"%s", _cmd);

	[personService readPerson:@""];
	[personService readPersons:[NSSet setWithObjects:@"MMMM-MMD",@"KW3B-NK3",@"KW3B-NKH",@"KW3B-NK7",@"ZZZZ-ZZZ",@"ABCD-EFG",nil]];
	[personService readPerson:@"ZZZZ-ZZZ"];
	[personService readPerson:@"ABCD-EFG"];
}

- (NSURL *)callbackURL
{
	if ([customURLCheckbox state] == NSOnState)
	{
		return [NSURL URLWithString:@"x-com-mpoauth-mobile://result"];
	}
	else {
		return nil;
	}
}

- (void)authenticationDidSuceedWithToken:(NSString *)token
{
	sessionId = [token retain];
	[connection setSessionId:sessionId];
	[connection setNeedsAuthentication:NO];
	[identityService pingSession];
}

@end

@implementation FSAppTestDelegate (PrivateMethods)
-(void) requestFinished:(id<EnunciateXML> )response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	[[[myResults textStorage] mutableString] appendString: [response description]];
//	results = [response retain];
	[self setTheDocument:response];
}

-(void) requestFailed:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	[[[loginResults textStorage] mutableString] appendString: [error localizedDescription]];
}

- (void)request:(FSKRequest *)request didReturnResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	[self requestFinished:[response xmlDocument]];
}

- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	[self requestFailed:error];
}

@end
