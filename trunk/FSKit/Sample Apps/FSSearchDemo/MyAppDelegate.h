/* MyAppDelegate */

#import <Cocoa/Cocoa.h>
#import <RuleEditor/PSRuleEditor.h>
#import <FSKit/FSKit.h>

@interface MyAppDelegate : NSObject
{
	FSKConnection *connection;
	FSKPersonService *personService;
	FSKIdentityService *identityService;
	
    IBOutlet NSTabView *searchTabs;
    IBOutlet NSTextView *searchResultsText;
    IBOutlet NSTableView *searchResultsTableView;
    IBOutlet NSSearchField *simpleSearchField;
	IBOutlet PSRuleEditor *ruleEditor;
	//    IBOutlet NSButton *searchButton;
	//	IBOutlet PSPredicateEditor *predicateEditor;
	
	NSXMLDocument *searchResultXML;	
	
	NSMutableDictionary *searchForm;
	IBOutlet NSObjectController *form;
	int simpleSearchTag;
}

- (IBAction)doSearch:(id)sender;
- (IBAction)setSimpleSearchCategory:(id)sender;

@end
