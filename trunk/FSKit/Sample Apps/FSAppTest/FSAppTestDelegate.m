#import "FSAppTestDelegate.h"
#import "FSKSharedDefines.h"

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
	NSLog(@"%s %@ %d", _cmd, [radio selectedCell], [[radio selectedCell] tag]);

	switch ([[radio selectedCell] tag]) {
		case 0: // panel
	[identityService login];
			break;
		case 1: // default credential
			[connection setCredential:[NSURLCredential credentialWithUser:@"api-user-1009" password:@"f8cc" persistence:NSURLCredentialPersistenceForSession]];
			NSLog(@"credential: %@", [connection credential]);
			[connection setDelegate:self];
			break;
		case 2: // username/password
			[connection setCredential:[NSURLCredential credentialWithUser:[username stringValue] password:[password stringValue] persistence:NSURLCredentialPersistenceForSession]];
			NSLog(@"credential: %@", [connection credential]);
			[connection setDelegate:self];
//			[identityService login];
			break;
}

- (IBAction)logout:(id)sender
{
	NSLog(@"%s", _cmd);
	[connection signOut];
	//[identityService logout];
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

- (void)authenticationDidSucceedWithToken:(NSString *)token
{
	sessionId = [token retain];
	[identityService pingSession];
}

- (void)authenticationDidFailWithError:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

@end

@implementation FSAppTestDelegate (PrivateMethods)
-(void) requestFinished:(FSKResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	[[[myResults textStorage] mutableString] appendString: [response description]];
//	results = [response retain];
	if ([response isKindOfClass:[FSKPersonResponse class]])
	{
		[[[myResults textStorage] mutableString] appendString: [response personSummary]];
}
}

-(void) requestFailed:(NSError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	[[[loginResults textStorage] mutableString] appendString: [error localizedDescription]];
}

- (void)request:(FSKRequest *)request didReturnResponse:(FSKIdentityResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	[self requestFinished:response];
}

- (void)request:(FSKRequest *)request didFailWithError:(FSKError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	[self requestFailed:error];
}

@end
