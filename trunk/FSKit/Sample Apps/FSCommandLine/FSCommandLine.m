#import <Foundation/Foundation.h>
#import "FSCLClient.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");

 	FSCLClient *client = [[FSCLClient alloc] init];
    NSLog(@"client created");
	[client performSelector:@selector(readFromStdin) withObject:nil afterDelay:0.5];
	
	NSPort *dummyPort = [[NSPort port] retain];
	[[NSRunLoop currentRunLoop] addPort:dummyPort forMode:NSDefaultRunLoopMode];
    NSLog(@"running runloop");
	[[NSRunLoop currentRunLoop] run];
    NSLog(@"runloop done, releasing pool");
	[dummyPort release];
	
    NSLog(@"draining pool");
	[pool drain];
    NSLog(@"Terminating!");
    return 0;
}

