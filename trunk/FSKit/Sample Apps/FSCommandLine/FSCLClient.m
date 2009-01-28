//
//  FSCLClient.m
//  FSCommandLine
//
//  Created by Logan Allred on 8/31/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FSCLClient.h"
#import "FSKSharedDefines.h"
#import "NSData+RSHexDump.h"

#define MAXLINE 128

int chomp(char *s)
{
	int chomped = 0;
	char *p = strchr(s, '\n');
	if(p != NULL)
	{
		*p = '\0';
		chomped = 1;
	}
	return chomped;
}

char * getPassword()
{
	char *pass = NULL;
	printf("Warning: if running this in the Xcode pseudo terminal, it will not hide your password, but echo it in plain text\n");
	pass = (char *)getpass("Password: ");
	printf("you typed pwd: %s\n", pass);
	chomp(pass);
	return pass;
}	
	

@implementation FSCLClient

- (id)init
{
	if ((self = [super init]))
	{
		connection  = [[[FSKConnection alloc] init] retain];
		[connection setBaseURLString:kFSAPIDevBaseURLString];
		[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
		[connection setUserAgentString:@"FSKit Command Line App/1.0" override:NO];
		[connection setDelegate:self];
		
//		[NSThread detachNewThreadSelector: @selector(readFromStdin)
//								 toTarget:self withObject:nil];
	}
	return self;
}

- (void)readFromStdin
{
NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; 
		
	// main program command loop
	char buf[MAXLINE] = {0};
	
	printf("\n\nPlease enter a command: \n\t[r]ead person\n\t[s]earch for person\n\t[q]uit\n\nCommand: ");
	int rc = 0;
	while(0 == rc && fgets(buf, sizeof buf, stdin) != NULL)
	{
		if(chomp(buf))
		{
			printf("Got the command [%s]\n", buf);
			switch (buf[0]) {
				case 'r':
				case 'R':
					printf("Read a person::\nPlease enter a person ID: ");
					fgets(buf, sizeof buf, stdin);
					chomp(buf);
					[self performSelectorOnMainThread: @selector(readPerson:)
										   withObject:[NSString stringWithCString:buf] waitUntilDone:YES];
					rc=1;
					break;
				case 's':
				case 'S':
					printf("Search for a person::\nPlease enter a full name to search on: ");
					fgets(buf, sizeof buf, stdin);
					chomp(buf);
					[self performSelectorOnMainThread: @selector(doSearch:)
										   withObject:[NSString stringWithCString:buf] waitUntilDone:YES];
					rc=2;
					break;
				case 'q':
				case 'Q':
					printf("Quitting ...\n");
					[self performSelectorOnMainThread: @selector(test)
										   withObject:nil waitUntilDone:YES];
					rc=99;
					break;
				default:
					printf("invalid command: %s", buf);
					printf("Please enter a command: \n\t[r]ead person\n\t[s]earch for person\n\t[q]uit\n\nCommand: ");
					break;
			}
		}
		else
		{
			printf("Line too long! Aborting.\n");
			rc = EXIT_FAILURE;
		}
	}
	[pool release];
}

- (void)request:(FSKRequest *)request 
didReturnResponse:(FSKResponse *)response
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, response);
	if ([response isKindOfClass:[FSKPersonResponse class]])
	{
		[self printPersonResponse:(FSKPersonResponse *)response];
	}
	else if ([response isKindOfClass:[FSKSearchResponse class]])
	{
		[self printSearchResponse:response];
	}
	if ( !([response isKindOfClass:[FSKIdentityResponse class]]) )
	{
		[self readFromStdin];
	}
}

- (void)request:(FSKRequest *)request 
didFailWithError:(FSKError *)error
{
	NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
	[self readFromStdin];
}

- (void)request:(FSKRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	char buf[MAXLINE] = {0};
	printf("username: ");
	fgets(buf, sizeof buf, stdin);
	chomp(buf);
	NSString *username = [NSString stringWithCString:buf];
	NSString *password = [NSString stringWithCString:getPassword()];
	[[challenge sender] useCredential:[NSURLCredential credentialWithUser:username password:password persistence:NSURLCredentialPersistenceForSession] forAuthenticationChallenge:challenge];
}

@end

@interface FSCLClient(Private)
-(void)readPerson:(NSString *)personId;
-(void)doSearch:(NSString *)searchName;
-(void)printPersonSummary:(FSKPersonSummary *)person;
-(void)printPersonResponse:(FSKPersonResponse *)response;
-(void)printSearchResponse:(FSKSearchResponse *)response;
@end

@implementation FSCLClient(Private)

-(void)readPerson:(NSString *)personId
{
	FSKPersonService *personService = [[FSKPersonService
										personServiceWithConnection:connection 
										delegate:self] retain];
	[personService readPerson:personId];	
}

-(void)doSearch:(NSString *)searchName
{
	FSKPersonService *personService = [[FSKPersonService
										personServiceWithConnection:connection 
										delegate:self] retain];
	[personService searchByFullName:searchName];
}

- (void)printPersonSummary:(FSKPersonSummary *)person
{
	NSLog(@"Name: %@", [person name]);
	NSLog(@"Gender: %@", [person gender]);
	NSLog(@"Birth Date: %@", [[[person birthEvent] date] displayString]);
	NSLog(@"Birth Place: %@", [[[person birthEvent] place] displayString]);
	NSLog(@"Death Date: %@", [[[person deathEvent] date] displayString]);
	NSLog(@"Death Place: %@", [[[person deathEvent] place] displayString]);
}	

-(void)printPersonResponse:(FSKPersonResponse *)response
{
	FSKPerson *person = [[response personList] lastObject];
	NSLog(@"*****************");
	NSLog(@"*****************");
	NSLog(@"Person ID: %@", [person personId]);
	[self printPersonSummary:[person summary]];
	NSLog(@"*****************");
}


-(void)printSearchResponse:(FSKSearchResponse *)response
{
	NSLog(@"*****************");
	NSLog(@"*****************");
	NSLog(@"Search Results:  %i total matches", [[response searchResults] count] );
	NSLog(@"=================");
	NSEnumerator *enumerator = [[response searchResults] objectEnumerator];
	FSKSearchResult *result;
	while (result = [enumerator nextObject]) {
		NSLog(@"Score: %@", [result score]);
		NSLog(@"ID: %@", [result refId]);
		[self printPersonSummary:[result person]];
		NSLog(@"Father: ");
		[self printPersonSummary:[result father]];
		NSLog(@"Mother: ");
		[self printPersonSummary:[result mother]];
		NSLog(@"=================");
	}
	NSLog(@"*****************");
}
@end
