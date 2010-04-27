//
//  FSKOAuthSimpleServer.m
//  FSKit
//
//  Created by Logan Allred on 4/17/10.
//  Copyright 2010 RedBugz Software. All rights reserved.
//

#import "FSKOAuthSimpleServer.h"
#import "NSString+URIQuery.h"

@implementation FSKOAuthSimpleServer

- (id) initWithDelegate:(id)theDelegate
{
	self = [super init];
	if (self != nil) {
		delegate = theDelegate;
		oauthVerifier = @"";
		port = 50000;
		server = [[[SimpleHTTPServer alloc] initWithTCPPort:port
												   delegate:self] retain];
	}
	return self;
}

- (void)dealloc
{
	[server release];
	[oauthVerifier release];
	[super dealloc];
}


- (void)processURL:(NSURL *)url connection:(SimpleHTTPConnection *)connection
{
	NSLog(@"%s url: %@", __PRETTY_FUNCTION__, url);
	if ([[[url path] pathExtension] length] > 0)
	{
		[server replyWithStatusCode:404 message:@"<html><body><p>404 NOT FOUND</p></body></html>"];
		return;
	}
	NSDictionary *params = [[url query] queryDictionaryUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"param dict: %@", params);
	NSString *oauthToken = [params valueForKey:@"oauth_token"];
	NSString *verifier = [params valueForKey:@"oauth_verifier"];
	NSLog(@"oauth_verifier: %@", verifier);
    if( oauthToken && verifier ) {
		NSString *response = [NSString stringWithFormat:@"<html><body>You will now be returned to the application.<br>You may close this browser window.<br><br><pre>%@</pre></body></html>", [params description]];
		[server replyWithData:[response dataUsingEncoding:NSUTF8StringEncoding] MIMEType:@"text/html"];
		[server closeConnection:connection];
		oauthVerifier = [verifier retain];
		[server release];
		server = nil;
		[delegate setVerifier:oauthVerifier];
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Error in URL: %@", params];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
		[delegate setVerifier:nil];
    }
}

- (void)stopProcessing
{
	NSLog(@"stop processing");
}

- (NSUInteger)port {
    return port;
}

- (void)setPort:(NSUInteger)value {
	port = value;
}

- (NSString *) verifier
{
	return oauthVerifier;
}

- (NSURL *) callbackURL
{
	NSLog(@"%s port:%i", __PRETTY_FUNCTION__, port);
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:%i", port]];
}

@end
