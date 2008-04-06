#import "BasicAppDelegate.h"
#import "FSKSharedDefines.h"

@implementation BasicAppDelegate
- (id)init
{
    if ((self = [super init]))
	{
        // your initialization code goes here
    }
    return self;
}

- (void)dealloc
{
	[personService release];
	[connection release];
	[super dealloc];
}

- (void)awakeFromNib
{	

	// Create a connection
	connection  = [[[FSKConnection alloc] init] retain];
//	[connection setBaseURLString:@"http://localhost/~logan/"];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
//	[connection setBaseURLString:kFSAPIProductionBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	NSLog(@"key: %@", kFSK_DEVELOPER_KEY);
	[connection setUserAgentString:@"FSKit BasicApp/1.0" override:NO];
	// Make a request
	personService = [[FSKPersonService
		personServiceWithConnection:connection 
		delegate:self] retain];
	[personService readPerson:@"me"];

//	[FSKPersonSearchRequest 
//		fetchSearchResultsWithCriteria:[NSDictionary dictionaryWithObjectsAndKeys:@"Smith", @"familyName", @"William", "givenNames", nil] 
//		connection:connection 
//		delegate:self 
//		selector:@selector(request:didReturnResponse:)];
}

	// Handle the response by overriding these 2 methods in your delegate
- (void)request:(FSKRequest *)request 
    didReturnResponse:(FSKResponse *)response
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}
	
- (void)request:(FSKRequest *)request 
    didFailWithError:(FSKError *)error
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
