//
//  PSPredicateEditor.h
//  PSRuleEditor
//
//  Created by x on 2/18/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "PSRuleEditor.h"
#import "PSPredicateEditorRowTemplate.h"
#import "TreeController.h"
#import "TreeNode.h"

@interface PSPredicateEditor : PSRuleEditor {
    NSMutableArray *_allTemplates;
    
//	NSArray *_rootItems;
//	NSArray *_rootHeaderItems;
	TreeController *treecontroller;

//	id _predicateTarget;
//	SEL _predicateAction;
	
	NSCompoundPredicate *_objectValue;
	id observedObjectForValue;
	NSString *observedKeyPathForValue;
	NSValueTransformer *valueTransformer;
}
- (void)startObservingChanges;
- (void)stopObservingChanges;

- (void)_updatePredicate;
- (void)_reloadPredicateForSlice:(PSRuleEditorSlice*)slice;

- (void)insertNodeWithRootPredicate:(NSCompoundPredicate*)predicate;
- (void)insertSlicesWithNodes:(NSArray*)nodes indexes:(NSIndexSet*)indexes;
- (void)removeSlicesWithNodes:(NSArray*)nodes childIndexes:(NSIndexSet*)indexes;
- (void)observeValueForKeyPath:keyPath ofObject:object change:(NSDictionary *)change context:context;
- (void)setRowTemplates:(NSArray *)rowTemplates;

- (NSNumber*)compoundTypeForSlice:(PSRuleEditorSlice*)slice;
- (NSPredicate*)predicateForRow:(int)row;
- (NSPredicate*)predicateForSlice:(PSRuleEditorSlice*)slice;
- (PSPredicateEditorRowTemplate*)nextTemplate;
- (PSPredicateEditorRowTemplate*)templateForPredicate:(NSPredicate *)predicate;
- (NSCompoundPredicate*)predicateWithNodes:(NSArray*)childnodes type:(NSCompoundPredicateType)type;

- (NSArray *)rowTemplates;
- (NSCompoundPredicate *)objectValue;
- (void)setObjectValue:(NSCompoundPredicate *)value;

	/* Sets the NSPredicateEditorRowTemplates for the NSPredicateEditor.  When created, NSPredicateEditor contains a template representing compound predicates; if you wish to keep it, you should take care to include it in this array.
	*/
- (void)setRowTemplates:(NSArray *)rowTemplates;

	/* Returns the row templates for this NSPredicateEditor.
	*/
- (NSArray *)rowTemplates;

@end
