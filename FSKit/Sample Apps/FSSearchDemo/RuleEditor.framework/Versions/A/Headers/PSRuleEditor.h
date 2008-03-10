// PSRuleEditor.h
// RuleEditor Framework

// Copyright cacaodev, 2006,2007 cacaodev@gmail.com



/*!

<b>Embed RuleEditor framework into your application with Xcode:</b>

1/ Create a copy files build phase in your application's target and set the destination to "Frameworks".<br/>
2/ Drag the RuleEditor framework to this build phase.<br/>
3/ Add RuleEditor framework to your "Link binary with library" build phase.<br/>
- Add any needed #import <RuleEditor/PSRuleEditor.h> directives to your headers. 

 <b>Create a RuleEditor view with Interface Builder:</b>

	1/ Drag the PSRuleEditor.h file included in the framework to the Nib's window.<br/>
	2/ Create a Custom NSView where you want.<br/>
	3/ Set the custom class of your NSView to PSRuleEditor.<br/>

	*/


/*!
@header RuleEditor
	@class PSRuleEditor
	@abstract PSRuleEditor Class Reference
	@discussion A PSRuleEditor is a class that allows the user to create and configure a list of options.  The view has a delegate which offers a tree of choices to the view.  The choices are presented by the view to the user as a row of popup buttons, static text fields, and custom views.  Each row in the list represents a particular path down the tree of choices.  An example of part of a tree of choices and a path through it:
 <pre>
 ----| contains        -------> [CUSTOM TEXT FIELD]
 Name-------------|   | starts with     |
 Kind                 | ends with-------|
 Creation date        | is
 Modification date
 </pre>
 Each node in the tree is represented by a "criterion," which can be any object.  As the user chooses from the popup menus, the rule editor view will query its delegate for the child criteria of the chosen criterion.  The only restriction on the criteria is that two criterions should be considered equal by isEqual: if they represent the same node, and must not be equal if they represent different nodes.  The path through the tree for a given row is represented by the array of criteria for the row.  For example, the criteria for the above selection would represent "Name", "ends with", and the custom text field; the manner in which the criteria represent those values is up to the developer.
 
 <span style="display:none"> 
 There are two types of rows - standard rows and header rows (PSRuleEditorRowTypeSimple and PSRuleEditorRowTypeCompound).  A header row can contain other rows, but a standard row cannot.  Header rows and standard rows can have different trees of criteria.  The amount and style of row nesting is configurable.
 </span> 
 Every time a row is created or modified, the rule editor view will query its delegate view for a "display value" for each new criterion in the row.  The display value is what is presented to the user, and must be a NSString, NSView, or NSMenuItem.  When a criterion is selected in the row, the rule editor will query the criterion for its child criteria and then each of the children for their display value.  If there are multiple children, a popup button is formed from the string values and menu items.  If there is only one child, its display value is displayed as a static text field (if it is a string) or as a view (if the value is a view).
 
 PSRuleEditor has some optional support for predicates.  For each row, it will ask its delegate for various parts of a predicate, which are returned in a dictionary.  Assuming the delegate returns enough parts for each row, the parts are then combined to form a predicate for the entire view.  This is expressed in the  "predicate" property for the view.  Subclassers can modify the predicate for each row as it is constructed.  Setting a predicate back on the view is not supported.
 <span style="display:none">  
 PSRuleEditor exposes one binding, "rows."  The "rows" binding may be bound to an ordered to-many relation (e.g. NSMutableArray).  Each object in the relation should have the following properties:
 
 "rowType" -> integer representing the type of the row (PSRuleEditorRowType)<br/>
 "subrows" -> ordered to-many relation (e.g. NSMutableArray) containing the directly nested subrows for the given row<br/>
 "displayValues" -> ordered to-many relation containing the display values for the row<br/>
 "criteria" -> ordered to-many relation containing the criteria for the row
 
 These key paths can be set using the set*KeyPath: methods below
 </span> 
 */

#define ROW_HEIGHT 30.

#define ANIM_DURATION 0.3
#define INTERSLICE 0.

#define INDENT_WIDTH 30
#define INTERSPACE 5

#define SUBVIEW_WIDTH 100
#define SUBVIEW_HEIGHT 17.
#define BUTTON_HEIGHT 17.
#define FONT_SIZE 10.

#define MAX_CRITERIA_COUNT 10

#import "PSRuleEditorSlice.h"

@class PSRuleEditorSlice;
@class NSPredicate,NSComparisonPredicate,NSExpression,NSCompoundPredicate,NSAnimation,NSViewAnimation;

typedef enum PSRuleEditorNestingMode {
    PSRuleEditorNestingModeSingle,	    /* Only a single row is allowed.  Plus/minus buttons will not be shown */
    PSRuleEditorNestingModeList,	    /* Allows a single list, with no nesting and no compound rows */
    PSRuleEditorNestingModeCompound,	/* Unlimited nesting and compound rows; this is the default */
    PSRuleEditorNestingModeSimple	    /* One compound row at the top with subrows beneath it, and no further nesting allowed */
} PSRuleEditorNestingMode;

@interface PSRuleEditor : NSView {
	NSPredicate *_predicate;
    PSRuleEditorNestingMode _nestingMode;
	
	id					_delegate;	
	NSImage				*plus;
	NSImage				*minus;
	NSColor				*rowLightColor;
	NSColor				*rowDarkColor;
	
	float				animDuration;
	
	NSMutableIndexSet   *selectedRowIndexes;
	NSMutableArray		*selectedSlices;
	NSMutableArray		*slices;
	NSDictionary		*formattingDictionary;
	NSString			*formattingStringsFileName;
	
	float rowHeight;
	// Unimplemented	
	NSString			*_typeKeyPath;
	NSString			*_itemsKeyPath;
	NSString			*_valuesKeyPath;
	NSString			*_subrowsArrayKeyPath; 
	
	BOOL alternateFirstItem, shouldDraw;
	NSEvent *downEvent;
	NSRect oldDrawRect, newDrawRect;
	int dst,src;
	NSRect minFrame;
}

- (BOOL)alternateFirstItem;
- (BOOL)shouldUseHeader;
- (NSImage*)plus;
- (NSImage*)minus;
- (NSDictionary *)formattingDictionary;

- (void)_reloadPredicateForSlice:(id)slice;

- (PSRuleEditor*)initWithFrame:(NSRect)frame;
- (void)drawRect:(NSRect)rect;
- (void)dealloc;

- (NSMutableArray*)rows;
- (void)_insertRow:(PSRuleEditorSlice*)slice;
- (void)_removeRow:(PSRuleEditorSlice*)slice;
- (void)rearrange:(NSKeyValueChange)type newIndexes:(NSIndexSet*)indexes;

- (int)countOfSlices; 
- (id)objectInSlicesAtIndex:(int)index; 
- (void)insertObject:(id)anObject inSlicesAtIndex:(int)index; 
- (void)removeObjectFromSlicesAtIndex:(int)index;
- (void)insertSlices:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)removeSlicesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSlicesAtIndex:(int)index withObject:(id)anObject; 

#pragma mark public methods
	/*! 
	@method delegate  
	@abstract Returns the receiver‚Äôs delegate.
	@result The receiver‚Äôs delegate.
	@discussion Clients can call this method to get the delegate for the PSRuleEditor.  PSRuleEditor requires a delegate that implements the required PSRuleEditorDelegateMethods methods to function.

	*/
- (id)delegate;
	/*! 
	@method setDelegate:  
	@abstract Sets the receiver‚Äôs delegate.
	@discussion Clients can call this method to set the delegate for the PSRuleEditor. PSRuleEditor requires a delegate that implements the required PSRuleEditorDelegateMethods methods to function.
	@param delegate  The delegate for the reciever.
	*/
- (void)setDelegate:(id)delegate;

	/*!
 @method criteriaForRow:
	 @abstract   Returns the currently chosen items for a given row.
	 @discussion Clients call this to obtain all of the currently chosen items for the given row.  These are the same items that are returned from the delegate method - ruleEditor: child: forCriterion: withRowType:
	 @param row The index of a row in the receiver.
	 @result The currently chosen items for row row.
	 */
- (NSArray *)criteriaForRow:(int)row;

	/*!
 @method    displayValuesForRow: 
	 @abstract   Returns the chosen values for a given row.
	 @discussion Clients call this to obtain all of the chosen values (strings, views, or menu items) for row.  These are the same values that are returned from the delegate method - ruleEditor: valueForItem: inRow:
	 @param row The index of a row in the receiver.
	 @result The chosen values (strings, views, or menu items) for row row.
	 */
- (NSArray *)displayValuesForRow:(int)row;

	/*!
	@method    formattingDictionary
	 @abstract   Returns the formatting dictionary for the receiver.
	 @result The formatting dictionary for the receiver.
	 */
- (NSDictionary *)formattingDictionary;

	/*!
	@method    setFormattingDictionary:
	 @abstract   Sets the formatting dictionary for the receiver.
	 @discussion If you set the formatting dictionary with this method, it sets the current formatting strings file name to nil (see formattingStringsFileName).
	 */
- (void)setFormattingDictionary:(NSDictionary *)dictionary;

	/*!
@method    formattingStringsFileName:
	 @abstract   the formatting string file name for the receiver.
	 @discussion 
	 */
- (NSString*)formattingStringsFileName;

	/*!
	@method    setFormattingStringsFileName:
	 @abstract   Sets the formatting dictionary for the receiver based on the given file name.
	 @discussion Clients can call this to automatically set a formatting dictionary based on the strings file with the given name.  Setting a formatting strings file searches the main bundle, and the bundle containing this nib, for a (possibly localized) strings file resource with the given name, loads it, and sets it as the formatting dictionary.  The resulting dictionary can be obtained with -[NSRuleEditor formattingDictionary].  If you set the formatting dictionary explicitly with -[NSRuleEditor setFormattingDictionary:], then it sets the current formattingStringsFilename to nil.
	 */
- (void)setFormattingStringsFileName:(NSString *)stringsFileName;

	/* Clients call this to set and get the nesting mode for the NSRuleEditor.  This is generally set at view creation time and not modified after.  The default is NSRuleEditorNestingModeCompound. 
- (void)setNestingMode:(PSRuleEditorNestingMode)mode;
- (PSRuleEditorNestingMode)nestingMode;
	*/

	/*!
	@method    predicate
	 @abstract   Returns the predicate for the receiver.
	 @result If the delegate implements ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:, the predicate for the receiver. If the delegate does not implement ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:, or if the delegate does not return enough parts to construct a full predicate, returns nil.
	 */

- (NSPredicate *)predicate;

	/*!
	@method    predicateForRow:
	 @abstract   Returns the predicate for the row.
	 @result 
	 */
- (NSPredicate*)predicateForRow:(int)row;

	/*!
	@method    reloadPredicate
	 @abstract   Instructs the receiver to regenerate its predicate by invoking the corresponding delegate method.
	 @discussion You typically invoke this method because something has changed (for example, a view's value).
	 */
- (void)reloadPredicate;

	/* Adds "initial" rows, or a row to the end - useful as the target for the outside + button */
- (void)addRow:(id)sender;

	/*!
	@method	selectedRowIndexes
	 @abstract	Returns the indexes of the receiver‚Äôs selected rows.
	 @result	The indexes of the receiver‚Äôs selected rows.
	 */
- (NSIndexSet *)selectedRowIndexes;

	/*!
	@method	numberOfRows
	 @abstract	Returns the number of rows in the receiver.
	 @result	The number of rows in the receiver.
	 */
- (void)setSelectedRowIndexes:(NSMutableIndexSet *)value;

- (int)numberOfRows;

	/*!
	@method	insertRowAtIndex:   
	 @abstract	Adds a new row of a given type at a given location.
	 @param		rowIndex The index at which the new row should be inserted. rowIndex must be greater than parentRow, and must specify a row that does not fall amongst the children of some other parent.
	 @discussion If parentRow is greater than or equal to rowIndex, or if rowIndex would fall amongst the children of some other parent, an NSInvalidArgumentException is raised.
	 */
- (void)insertRowAtIndex:(int)rowIndex;

	/*!
 @method	removeRowAtIndex:  
	 @abstract	Removes the row at a given index.
	 @param		rowIndex The index of a row in the receiver.
	 @discussion Any subrows of the deleted row are adopted by the parent of the deleted row, or are made root rows.
	 
	 This method raises an NSRangeException if rowIndex is equal to or larger than the number of rows in the receiver, or less than 0.
	 */
- (void)removeRowAtIndex:(int)rowIndex;
	/*!
	@method	rowHeight
	 @abstract	Returns the row height for the receiver.
	 @result	The row height for the receiver.
	 */
- (float)rowHeight;

	/*!
	@method		setRowHeight:    
	 @abstract		Sets the row height for the receiver.
	 @param			height The row height for the receiver.
	 @discussion	This method changes the receiver's frame and marks it for redisplay.
	 */
- (void)setRowHeight:(float)height;


@end

@interface NSObject (PSRuleEditorDelegate)

/* -- Required delegate methods -- */

/*!
@method		ruleEditor:numberOfChildrenForCriterion:withRowType:  
 @abstract		Returns the number of child items of a given criterion.
 @discussion	Implementation of this method is required.
 @result		The number of child items of criterion. If criterion is nil, return the number of root criteria.
 @param			editor The rule editor that sent the message.
 @param			criterion The criterion for which the number of children is required.
 */
- (int)ruleEditor:(PSRuleEditor *)editor numberOfChildrenForCriterion:(id)criterion withRowType:(int)rowType;

	/*!
 @method   ruleEditor:child:forCriterion:withRowType:
	 @abstract   Return the child of a given item at a given index.
	 @discussion Implementation of this method is required.
	 @result The child of the given item at index. If criterion is nil, returns the root criterion for the row type rowType at index.
	 @param editor The rule editor that sent the message.
	 @param index
	 @param criterion
	 */
- (id)ruleEditor:(PSRuleEditor *)editor child:(int)index forCriterion:(id)criterion withRowType:(int)rowType;

	/*!
 @method   ruleEditor:displayValueForCriterion:inRow:
	 @abstract   Returns the value for a given criterion.
	 @discussion The value should be an instance of NSString, NSView, or NSMenuItem. If the value is an NSView or NSMenuItem, you must ensure it is unique for every invocation of this method; that is, do not return a particular instance of NSView or NSMenuItem more than once.
	 @result The value for criterion.
	 @param editor The rule editor that sent the message.
	 @param criterion The criterion for which the value is required.
	 */
- (id)ruleEditor:(PSRuleEditor *)editor displayValueForCriterion:(id)criterion inRow:(int)row;

	/* -- Optional delegate methods -- */

	/*!
 @method ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:
	 @abstract Returns a dictionary representing the parts of the predicate determined by the given criterion and value.
	 @discussion  Implementation of this method is optional.
	 @result  A dictionary representing the parts of the predicate determined by the given criterion and value. The keys of the dictionary should be the string constants specified in ‚ÄúPredicate part keys‚Äù with corresponding appropriate values.
	 @param editor  The rule editor that sent the message.
	 @param criterion The criterion for which the predicate parts are required.
	 @param value 
	 @param row The row number of criterion.
	 */
- (NSDictionary *)ruleEditor:(PSRuleEditor *)editor predicatePartsForCriterion:(id)criterion withDisplayValue:(id)value inRow:(int)row;

	/*!
 @method ruleEditorRowsDidChange:
	 @abstract Notifies the receiver that a rule editor‚Äôs rows changed.
	 @param notification A PSRuleEditorRowsDidChangeNotification notification. 
	 @discussion If this method is implemented, PSRuleEditor automatically registers its delegate to receive PSRuleEditorRowsDidChangeNotification notifications to this method.
	 
	 */
- (void)ruleEditorRowsDidChange:(NSNotification *)notification;

@end

/*!
@const PSRuleEditorPredicateLeftExpression
 @abstract The corresponding value is an NSExpression object representing the left expression in the predicate.
 @discussion This value is required for a non-nil comparison predicate.
 */
extern NSString * const PSRuleEditorPredicateLeftExpression;
/*!
@const PSRuleEditorPredicateRightExpression
 @abstract The corresponding value is an NSExpression object representing the right expression in the predicate.
 @discussion This value is required for a non-nil comparison predicate.
 */
extern NSString * const PSRuleEditorPredicateRightExpression;
/*! 
@const PSRuleEditorPredicateComparisonModifier
@abstract The corresponding value is an NSNumber object representing a NSComparisonPredicateModifier constant the of the predicate.
@discussion This value is optional‚Äîif not specified, NSDirectPredicateModifier is assumed.
*/
extern NSString * const PSRuleEditorPredicateComparisonModifier;

/*!
@const PSRuleEditorPredicateOptions
 @abstract The corresponding value is an NSNumber object representing a NSComparisonPredicateOptions bitfield.
 @discussion If no value is specified, 0 (no options) is assumed.
 */
extern NSString * const PSRuleEditorPredicateOptions;

/*!
@const PSRuleEditorPredicateOperatorType
 @abstract The corresponding value is an NSNumber object representing a NSPredicateOperatorType constant.
 @discussion This value is required for a non-nil comparison predicate.
 */
extern NSString * const PSRuleEditorPredicateOperatorType;

/*!
@const PSRuleEditorPredicateCustomSelector
 @abstract The corresponding value is an NSString object representing a custom selector.
 @discussion If specified, this overrides the operator type, options, and comparison modifier.
 */
extern NSString * const PSRuleEditorPredicateCustomSelector;

/*!
@const PSRuleEditorRowsDidChangeNotification
 @abstract Posted to the default notification center whenever the view's rows change.
 @discussion The object is the PSRuleEditor; there is no userInfo
 */
NSString *const PSRuleEditorRowsDidChangeNotification ;
