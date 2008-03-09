#import "MyAppDelegate.h"
#import "RuleDelegate.h"
#import "ImageTextCell.h"
#import "SFHFRatingCell.h"

NSMutableData *receivedData;

@implementation MyAppDelegate

- (id)init {
	self = [super init];
	connection  = [[[FSKConnection alloc] init] retain];
	//	[connection setBaseURLString:kFSAPIDevBaseURLString];
	
	ftService = [[FSKFamilyTreeService familyTreeServiceWithConnection:connection delegate:self] retain];
	identityService = [[FSKIdentityService identityServiceWithConnection:connection delegate:self] retain];
	return self;
}

- (void)dealloc {
	[connection release];
	[ftService release];
	[identityService release];
	[super dealloc];
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

- (void)performRuleSearch
{
	[ruleEditor reloadPredicate];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	NSArray *predicates = [[ruleEditor predicate] subpredicates];
	unsigned int	predCount = [predicates count];
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
	
	[ftService searchWithCriteria:dict];
}

- (void)awakeFromNib {	
	[identityService login];
	
	// [predicateEditor bind:@"objectValue" toObject:predicatesController withKeyPath:@"selection.predicate" options:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],NSConditionallySetsEditableBindingOption,nil]];
	
	//	[predicateEditor setFormattingStringsFileName:@"format"];
	NSUserDefaults *defs= [NSUserDefaults standardUserDefaults];	
	
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
	NSData *preddata = 	[defs objectForKey:@"objectValue"];
	if(preddata){
		NSCompoundPredicate *pred = [NSKeyedUnarchiver unarchiveObjectWithData:preddata];
		//		[predicateEditor setObjectValue:pred];
	}	
	
	/* CONFIGURE RULE EDITOR*/
	
	id delegate = [[RuleDelegate alloc] init];
	[ruleEditor setDelegate:delegate];
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
	//	[cell setPrimaryTextKeyPath: @"nextNode.nextSibling.nextSibling.stringValue"];
	//	[cell setSecondaryTextKeyPath: @"nextNode.nextSibling.nextSibling.XMLString"];
	//	[cell setIconKeyPath: @"icon"];
	return;
	
	// Set rating cell
	SFHFRatingCell *starCell = [[SFHFRatingCell alloc] initImageCell: [NSImage imageNamed: @"star"]];
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
	NSXMLElement *personElement = [data valueForKeyPath:@"nextNode.nextSibling"];
	NSImage *image = [NSImage imageNamed:@"Users.tiff"];// [appInfo icon];
		NSColor *color = [NSColor grayColor];
	if (personElement)
	{
		NSString *gender = @"Female";//[[[personElement nodesForXPath:@"//gender" error:nil] lastObject] stringValue];
		if ([gender isEqualToString:@"Male"]) {
			color = [NSColor blueColor];
		} else if ([gender isEqualToString:@"Female"]) {
			color = [NSColor redColor];
		}
	}
	
	int count = 4;
    NSRect rect = { 0,0, 150, 94};
    NSSize compositeSize;
    compositeSize.width = (rect.size.width * count);
    compositeSize.height = rect.size.height;
 NSImage * compositeImage;
    compositeImage = [[NSImage alloc] initWithSize:compositeSize];
    
    [compositeImage lockFocus];
    
        // this image has its own graphics context, so
        // we need to specify high interpolation again	
        [[NSGraphicsContext currentContext]
            setImageInterpolation: NSImageInterpolationHigh];
    
        int i;
    
        for ( i = 0; i < count; i++ )
        {
            [image setFlipped:YES];
    
            [image drawInRect: rect
                     fromRect: NSZeroRect
                    operation: NSCompositeSourceOver
                     fraction: 0.2];
NSBezierPath * path = [NSBezierPath bezierPathWithRect:rect];
[path setLineWidth:3];
[color set];
[path stroke];    
            rect.origin.x += rect.size.width; // move right
        }
    
    [compositeImage unlockFocus];
    	return compositeImage;
}
- (NSString*) primaryTextForCell: (ImageTextCell*) cell data: (NSObject*) data {
	NSXMLElement *personElement = [data valueForKeyPath:@"nextNode.nextSibling"];
	if (personElement)
	{
		return [NSString stringWithFormat:@"%@ (%@)", [personElement valueForKeyPath:@"nextNode.stringValue"], [[personElement attributeForName:@"ref"] stringValue]];
	} else
	{
		return @"No results";
	}
}
- (NSString*) secondaryTextForCell: (ImageTextCell*) cell data: (NSObject*) data {
	NSXMLElement *personElement = [data valueForKeyPath:@"nextNode.nextSibling"];
	NSError *theError;
	NSArray *birthElements = [personElement nodesForXPath:@"./*/*[@type='Birth']" error:&theError];
	NSLog(@"personElement %@ birth %@ (%d) error: %@", personElement, birthElements, [birthElements count], [theError localizedDescription]);
	if (!birthElements || [birthElements count] < 1) {
		NSLog(@"error: %@", [theError localizedDescription]);
		return @"No birth information";
	}
	NSLog(@"0: %@", [birthElements objectAtIndex:0]);
	//NSLog(@"1: %@", [birthElements objectAtIndex:1]);
	return [NSString stringWithFormat:@"born %@ in %@", [[birthElements objectAtIndex:0] valueForKeyPath:@"nextNode.stringValue"], [[birthElements objectAtIndex:0] valueForKeyPath:@"nextNode.nextSibling.stringValue"]];
}

- (void)requestFinished:(FSKResponse *)response
{
	NSLog(@"request:didReturnReponse");
	NSError *error;
	NSAttributedString *	styledText = [[NSAttributedString alloc] initWithString: [response XMLStringWithOptions:NSXMLNodePrettyPrint]];
//	[[[document valueForKey:@"resultsText"] textStorage] setAttributedString: styledText];
//	[[[document valueForKey:@"searchResultsText"] textStorage] setAttributedString: styledText];		
//	[document setValue:responseXML forKey:@"searchResultXML"];
	[[searchResultsText textStorage] setAttributedString:styledText];
	[self setValue:[response retain] forKey:@"searchResultXML"];
}

@end
