# Introduction #

FSKit is an Objective-C library to help developers connect and use the [new.FamilySearch.org](http://new.familysearch.org/)  [web service APIs](https://devnet.familysearch.org/docs/api-overview/)

# Getting Started #
  1. Get API reference access & developer key from [FamilySearch DevNet](https://devnet.familysearch.org/docs/getting-started/)
  1. [Link your application to FSKit Framework](http://developer.apple.com/documentation/MacOSX/Conceptual/BPFrameworks/Tasks/CreatingFrameworks.html#//apple_ref/doc/uid/20002258-106880-BAJJBIEF)
  1. Import FSKit
```
#import <FSKit/FSKit.h>
```
  1. Create a connection
```
 FSKConnection *connection  = [[[FSKConnection alloc] init] retain];
[connection setBaseURLString:kFSAPIDevBaseURLString];
[connection setDeveloperKey:@"MMMM-MMMM-MMMM-MMMM-MMMM-MMMM-MMMM-MMMM"];
[connection setUserAgentString:@"My Cool App/1.0" override:NO];
```
  1. Make a request
```
FSKPersonService *personService = [[FSKPersonService
    personServiceWithConnection:connection 
    delegate:self] retain];
[personService readPerson:[simpleSearchField stringValue]];

[FSKPersonSearchRequest 
    fetchSearchResultsWithCriteria:parameters connection:connection 
    delegate:_delegate  selector:_selector];
```
  1. Handle the response by overriding these 2 methods in your delegate
```
- (void)request:(FSKRequest *)request 
    didReturnResponse:(FSKResponse *)response;
- (void)request:(FSKRequest *)request 
    didFailWithError:(FSKError *)error;
```

# Details #

[Class Overview](ClassOverview.md)

[HeaderDoc](http://fskit.googlecode.com/svn/trunk/Documentation/index.html)

## Topics ##

### Authentication ###
Each end user needs an account on the [new FamilySearch.org site](https://new.familysearch.org/). When a request is made that requires authentication, FSKit will attempt to authenticate using OAuth. OAuth requires that the user visit a web page to authenticate, and there are 2 ways to be notified of the result:
  * register a URL scheme handler
  * use an embedded web server
Both are supported by FSKit, find out the details on the [Authentication](Authentication.md) page.