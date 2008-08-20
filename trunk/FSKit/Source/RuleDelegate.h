//  RuleDelegate.h
//  PSRuleEditor

#import <Cocoa/Cocoa.h>

#if (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4)
	#import <RuleEditor/PSRuleEditor.h>
#else
	#define PSRuleEditor NSRuleEditor
	#define PSRuleEditorPredicateLeftExpression NSRuleEditorPredicateLeftExpression
	#define PSRuleEditorPredicateRightExpression NSRuleEditorPredicateRightExpression
	#define PSRuleEditorPredicateComparisonModifier NSRuleEditorPredicateComparisonModifier
	#define PSRuleEditorPredicateOptions NSRuleEditorPredicateOptions
	#define PSRuleEditorPredicateOperatorType NSRuleEditorPredicateOperatorType
	#define PSRuleEditorPredicateCustomSelector NSRuleEditorPredicateCustomSelector
	#define PSRuleEditorRowsDidChangeNotification NSRuleEditorRowsDidChangeNotification
#endif

@class PSRuleEditor;


/*!
    @class	RuleDelegate
    @brief    <#(brief description)#>
    @details  <#(comprehensive description)#>
*/
@interface RuleDelegate : NSObject {
	NSArray *operators;
	NSDictionary *rootChildren;	
}

/* -- Required delegate methods -- */

/*!
    @brief   Returns the number of child items of a given criterion.
    @details Implementation of this method is required.
		@result The number of child items of criterion. If criterion is nil, return the number of root criteria.
		@param editor The rule editor that sent the message.
		@param criterion The criterion for which the number of children is required.
		@param rowType The row type
*/
- (int)ruleEditor:(PSRuleEditor *)editor numberOfChildrenForCriterion:(id)criterion withRowType:(int)rowType;

/*!
 @brief   Return the child of a given item at a given index.
 @details Implementation of this method is required.
 @result The child of the given item at index. If criterion is nil, returns the root criterion for the row type rowType at index.
 @param editor The rule editor that sent the message.
 @param index
 @param criterion
 @param rowType The row type
 */
- (id)ruleEditor:(PSRuleEditor *)editor child:(int)index forCriterion:(id)criterion withRowType:(int)rowType;

/*!
 @brief   Returns the value for a given criterion.
 @details The value should be an instance of NSString, NSView, or NSMenuItem. If the value is an NSView or NSMenuItem, you must ensure it is unique for every invocation of this method; that is, do not return a particular instance of NSView or NSMenuItem more than once.
 @result The value for criterion.
 @param editor The rule editor that sent the message.
 @param criterion The criterion for which the value is required.
 @param row The row index
*/
- (id)ruleEditor:(PSRuleEditor *)editor displayValueForCriterion:(id)criterion inRow:(int)row;

/* -- Optional delegate methods -- */

/*!
 @brief Returns a dictionary representing the parts of the predicate determined by the given criterion and value.
 @details  Implementation of this method is optional.
 @result  A dictionary representing the parts of the predicate determined by the given criterion and value. The keys of the dictionary should be the string constants specified in ‚ÄúPredicate part keys‚Äù with corresponding appropriate values.
 @param editor  The rule editor that sent the message.
 @param criterion The criterion for which the predicate parts are required.
 @param value 
 @param row The row number of criterion.
 */
- (NSDictionary *)ruleEditor:(PSRuleEditor *)editor predicatePartsForCriterion:(id)criterion withDisplayValue:(id)value inRow:(int)row;

/*!
 @brief Notifies the receiver that a rule editor's rows changed.
 @param notification A PSRuleEditorRowsDidChangeNotification notification. 
 @details If this method is implemented, PSRuleEditor automatically registers its delegate to receive PSRuleEditorRowsDidChangeNotification notifications to this method.
 
 */
- (void)ruleEditorRowsDidChange:(NSNotification *)notification;

@end
