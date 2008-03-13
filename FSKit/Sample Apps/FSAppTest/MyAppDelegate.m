#import "MyAppDelegate.h"


@implementation MyAppDelegate
- (id)init {
	self = [super init];
	connection  = [[[FSKConnection alloc] init] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	
	personService = [[FSKPersonService personServiceWithConnection:connection delegate:self] retain];
	identityService = [[FSKIdentityService identityServiceWithConnection:connection delegate:self] retain];
	return self;
}

- (void)dealloc {
	[connection release];
	[personService release];
	[super dealloc];
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
}

- (IBAction)fetchMe:(id)sender
{
	NSLog(@"%s", _cmd);

	[personService readPerson:@"me"];
	[personService readPersons:[NSSet setWithObjects:@"MMMM-MMD",@"me",@"KW3B-NK3",@"KW3B-NKH",@"KW3B-NK7",@"ZZZZ-ZZZ",@"ABCD-EFG",nil]];
	[personService readPerson:@"ZZZZ-ZZZ"];
	[personService readPerson:@"ABCD-EFG"];
}

- (NSXMLDocument *)theDocument
{
    return [[theDocument retain] autorelease];
}
 
- (void)setTheDocument:(NSXMLDocument *)newTheDocument
{
    if (theDocument != newTheDocument)
    {
        [newTheDocument retain];
        [theDocument release];
        theDocument = newTheDocument;
    }
}
@end

@implementation MyAppDelegate (PrivateMethods)
-(void) requestFinished:(NSXMLDocument *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	[[[myResults textStorage] mutableString] appendString: [response XMLStringWithOptions:NSXMLNodePrettyPrint]];
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

@implementation NSXMLNode (NSXMLNodeAdditions)
 
- (NSString *)displayName {
 
    NSString *displayName = [self name];
    if (!displayName) {
        displayName = [self stringValue];
    }
    return displayName;
}
 
- (BOOL)isLeaf {
 
    return [self kind] == NSXMLTextKind ? YES : NO;
}
 @end