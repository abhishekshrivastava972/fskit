#import "FSSearchDemoDelegate.h"
#import "ImageTextCell.h"
#import "SFHFRatingCell.h"
#import "FSKSharedDefines.h"

NSMutableData *receivedData;

@implementation FSSearchDemoDelegate

- (id)init {
	self = [super init];
	connection  = [[[FSKConnection alloc] init] retain];
	[connection setBaseURLString:kFSAPIDevBaseURLString];
	[connection setDeveloperKey:kFSK_DEVELOPER_KEY];
	[connection setUserAgentString:@"FSKitSearchDemo/1.0" override:NO];
	
	personService = [[FSKPersonService personServiceWithConnection:connection delegate:self] retain];
	identityService = [[FSKIdentityService identityServiceWithConnection:connection delegate:self] retain];
	return self;
}

- (void)dealloc {
	[ruleDelegate release];
	[lastResponse release];
	[connection release];
	[personService release];
	[identityService release];
	[super dealloc];
}

- (void)performSimpleSearch
{
	NSLog(@"search menu template: %@ tag: %d", [simpleSearchField stringValue], simpleSearchTag);
	switch (simpleSearchTag) {
	case 2:
		//birthplace
		[personService searchWithCriteria:[NSDictionary dictionaryWithObject:[simpleSearchField stringValue] forKey:@"birthPlace"]];
		break;
	case 3:
		//id
		[personService readPerson:[simpleSearchField stringValue]];
		break;
	case 4:
		//afn
		[personService readPerson:[NSString stringWithFormat:@"afn.%@", [simpleSearchField stringValue]]];
		break;
	default:
		[personService searchByFullName:[simpleSearchField stringValue]];
		break;
	}
}

- (void)performFormSearch
{
	NSLog(@"form vals: %@", [form content]);
	[personService searchWithCriteria:[form content]];
}

- (void)performRuleSearch
{
	[ruleEditor reloadPredicate];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	NSArray *predicates = [(NSCompoundPredicate *)[ruleEditor predicate] subpredicates];
	unsigned int predCount = [predicates count];
	unsigned int index = 0;
	for( ;index < predCount; index += 1)
	{
		id	pred = [predicates objectAtIndex:index];
		/* Send leftExpression to pred, if pred supports it*/
		if ([pred isKindOfClass:[NSComparisonPredicate class]])
		{
			NSLog(@"criteria expressions l=%@ r=%@", [pred leftExpression], [pred rightExpression]);
			if ([[[pred rightExpression] constantValue] length] > 0) { 
				[dict setValue:[[pred rightExpression] constantValue] forKey:[[pred leftExpression] keyPath]];
			}
		}
	}
	[dict setValue:@"15" forKey:@"maxResults"];
	NSLog(@"search queryDict %@", dict);
	
	[personService searchWithCriteria:dict];
}

- (IBAction) doSearch: (id) sender
{
	NSLog(@"doSearch tab:%@", [[searchTabs selectedTabViewItem] identifier]);
	if ([[[searchTabs selectedTabViewItem] identifier] isEqualToString:@"simple"]) {
		[self performSimpleSearch];
	}
	else if ([[[searchTabs selectedTabViewItem] identifier] isEqualToString:@"form"]) {
			[self performFormSearch];
	}
	else if ([[[searchTabs selectedTabViewItem] identifier] isEqualToString:@"rules"]) {
		[self performRuleSearch];
	}
}

- (IBAction)setSimpleSearchCategory:(id)sender;
{
	NSLog(@"search menu category tag: %d", [sender tag]);
	simpleSearchTag = [sender tag];
}

- (void)awakeFromNib {	
	[identityService login];
	
	// [predicateEditor bind:@"objectValue" toObject:predicatesController withKeyPath:@"selection.predicate" options:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],NSConditionallySetsEditableBindingOption,nil]];
	
	//	[predicateEditor setFormattingStringsFileName:@"format"];
	//  NSUserDefaults *defs= [NSUserDefaults standardUserDefaults];	
	
	/* CONFIGURE PREDICATE EDITOR*/	
	//	[predicateEditor setRowHeight:25];
	//	NSData *data = 	[defs objectForKey:@"templates"];
	//	NSMutableArray *templates; 
	//	if (data){
	//		templates = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	//		NSLog(@"got templates from defaults");
	//	}else{
	//		/* get the existing templates */ 
	//		templates = [NSMutableArray arrayWithArray:[predicateEditor rowTemplates]]; 
	//		
	//		/* Create another template manually. Our people like three different kinds of ice cream. */ 
	//		NSArray *textExpressions = [NSArray arrayWithObjects:[NSExpression expressionForKeyPath:@"name"],[NSExpression expressionForKeyPath:@"adress"],nil];
	//		
	// 		NSArray *numExpressions = [NSArray arrayWithObjects:[NSExpression expressionForKeyPath:@"age"],[NSExpression expressionForKeyPath:@"date"],nil];
	//		
	//		NSArray *rightExpressions = [NSArray arrayWithObjects: [NSExpression expressionForConstantValue:@"Jean"], [NSExpression expressionForConstantValue:@"Pierre"], [NSExpression expressionForConstantValue:@"Paul"], nil]; 
	//		
	//		NSArray *staticTextOperators = [NSNumber numbersWithRange:NSMakeRange(4,6)];
	//		NSArray *freeTextOperators = [NSNumber numbersWithRange:NSMakeRange(4,9)];
	//		NSArray *numOperators = [NSNumber numbersWithRange:NSMakeRange(1,5)];
	//		
	//		PSPredicateEditorRowTemplate *newTemplate = [[[PSPredicateEditorRowTemplate alloc] initWithLeftExpressions:textExpressions 
	//																								  rightExpressions:rightExpressions modifier:NSDirectPredicateModifier operators:staticTextOperators options:0] autorelease];
	//		
	//		PSPredicateEditorRowTemplate *NSStringAttributeTypeTemplate = [[[PSPredicateEditorRowTemplate alloc] initWithLeftExpressions:textExpressions rightExpressionAttributeType:NSStringAttributeType modifier:NSDirectPredicateModifier operators:freeTextOperators options:0] autorelease];
	//		
	//		PSPredicateEditorRowTemplate *NSFloatAttributeTypeTemplate = [[[PSPredicateEditorRowTemplate alloc] initWithLeftExpressions:numExpressions rightExpressionAttributeType:NSFloatAttributeType modifier:NSDirectPredicateModifier operators:numOperators options:0] autorelease];
	//		
	//		
	//		[templates addObjectsFromArray:[NSArray arrayWithObjects:newTemplate,NSStringAttributeTypeTemplate,NSFloatAttributeTypeTemplate,nil]]; 
	//		
	//	}
	
	/* set the templates back on the predicate editor */
	//	[predicateEditor setRowTemplates:templates];
	//[predicateEditor bind:@"objectValue" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:@"values.objectValue" options:[NSDictionary dictionaryWithObjectsAndKeys:NSUnarchiveFromDataTransformerName,NSValueTransformerNameBindingOption,[NSNumber numberWithBool:YES],NSValidatesImmediatelyBindingOption, nil]];
	//	NSLog(@"BINDINGS %@",[predicateEditor infoForBinding:@"objectValue"]);
	
	
	// Set predicate
//	NSData *preddata = 	[defs objectForKey:@"objectValue"];
//	if(preddata){
//		NSCompoundPredicate *pred = [NSKeyedUnarchiver unarchiveObjectWithData:preddata];
//		//		[predicateEditor setObjectValue:pred];
//	}	
	
	/* CONFIGURE RULE EDITOR*/
	
	ruleDelegate = [[[RuleDelegate alloc] init] retain];
	[ruleEditor setDelegate:ruleDelegate];
	//	[predicateEditor setDelegate:delegate];
	
	[ruleEditor setFormattingStringsFileName:@"format.plist"];
	[ruleEditor setRowHeight:25];
	
	[ruleEditor removeRowAtIndex:0];
	[ruleEditor addRow:self];
	[ruleEditor addRow:self];
	[ruleEditor addRow:self];
	[ruleEditor addRow:self];
	[ruleEditor addRow:self];
	
	// appList is a NSTableView object
	NSTableColumn* column = [[searchResultsTableView tableColumns] objectAtIndex:1];
	ImageTextCell* cell = [[[ImageTextCell alloc] init] autorelease];
	[column setDataCell: cell];
	[cell setDataDelegate: self];
//	[cell setPrimaryTextKeyPath: @"name"];
//	[cell setSecondaryTextKeyPath: @"personId"];
//	[cell setIconKeyPath: @"icon"];
	
	// Set rating cell
	SFHFRatingCell *starCell = [[[SFHFRatingCell alloc] initImageCell: [NSImage imageNamed: @"star"]] autorelease];
	[starCell setContinuous: YES];
	[starCell setHighlightedImage: [NSImage imageNamed: @"star_highlighted"]];
//	[starCell setPlaceholderImage: [NSImage imageNamed: @"star_placeholder"]];
//	[starCell setHighlightedPlaceholderImage: [NSImage imageNamed: @"star_placeholder_highlighted"]];	
	[starCell setMaximumRating: [NSNumber numberWithInt: 5]];
	NSTableColumn *ratingColumn = [searchResultsTableView tableColumnWithIdentifier:@"rating"];
	[ratingColumn setDataCell:starCell];
//	[ratingColumn bind:@"value" toObject: papersController withKeyPath:@"arrangedObjects.rating" options:nil];
//	[ratingColumn setSortDescriptorPrototype: [[[NSSortDescriptor alloc] initWithKey: @"rating" ascending: NO] autorelease]];	
	
}

#pragma mark -
#pragma mark Custom Cell data delegate methods

- (NSImage*) iconForCell: (ImageTextCell*) cell data: (NSObject*) data {
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, data);
	if (data)
	{
		NSString *gender = [data valueForKeyPath:@"gender"];//[[[personElement nodesForXPath:@"./*:gender" error:nil] lastObject] stringValue];
		if ([gender isEqualToString:@"Male"]) {
			return [NSImage imageNamed:@"user_icon_male.png"];
		} else if ([gender isEqualToString:@"Female"]) {
			return [NSImage imageNamed:@"user_icon_female.png"];
		}
	}

	return [NSImage imageNamed:@"Users.tiff"];
}

- (NSString*) primaryTextForCell: (ImageTextCell*) cell data: (NSObject*) data {
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, [data class]);
	if (data)
	{
		return [data valueForKeyPath:@"name"];
	} else
	{
		return @"No results";
	}
}

- (NSString*) secondaryTextForCell: (ImageTextCell*) cell data: (NSObject*) data {
//	NSLog(@"%s %@", __PRETTY_FUNCTION__, data);
	return [data valueForKeyPath:@"personId"];
}

- (void)requestFinished:(FSKResponse *)response
{
	NSLog(@"%s", _cmd);
	[self setValue:[response retain] forKey:@"lastResponse"];
	
	NSXMLDocument *doc = [response xmlDocument];
	NSAttributedString *styledText = [[NSAttributedString alloc] initWithString: [doc XMLStringWithOptions:NSXMLNodePrettyPrint]];
	[[searchResultsText textStorage] setAttributedString:[styledText autorelease]];
}

@end
