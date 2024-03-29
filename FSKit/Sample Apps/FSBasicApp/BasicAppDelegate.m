#import "BasicAppDelegate.h"
#import "FSKSharedDefines.h"
//#import "FSKUserRepository.h"

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
	[self setValue:[[[FSKConnection alloc] init] retain] forKey:@"connection"];
//	[connection setBaseURLString:@"http://localhost/~logan/"];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
//	[connection setBaseURLString:kFSAPIProductionBaseURLString];
//	[connection setBaseURLString:kFSAPIBetaBaseURLString];
//	[connection setBaseURLString:@"http://10.72.36.32:8080"];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	NSLog(@"key: %@", kFSK_DEVELOPER_KEY);
	[connection setUserAgentString:@"FSKit BasicApp/1.0" override:NO];
	
	// get the me user from the user repository
	[self setValue:[[[FSKContributorRepository instanceWithConnection:connection] userForId:@""] retain] forKey:@"meUser"];
	
	// Make a request
	personService = [[FSKPersonService
		personServiceWithConnection:connection 
		delegate:self] retain];
	[personService readPedigree:@"" ancestorGenerations:4 descendantGenerations:2];
//	[personService readPerson:@""];
	
//	[personService readPerson:@"KW31-V8M"];

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
	[self setValue:[response retain] forKey:@"lastResponse"];
	NSLog(@" summ: %@", [self valueForKeyPath:@"lastResponse.summary.name"]);
	if ([lastResponse errors])
	{
		[self setValue:[lastResponse errors] forKey:@"lastError"];
	}
}
	
- (void)request:(FSKRequest *)request 
    didFailWithError:(FSKError *)error
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	[self setValue:[error retain] forKey:@"lastError"];
}

@end
