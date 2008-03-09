//
//  PSPredicateEditor.h
//  PSRuleEditor
//
//  Created by x on 2/18/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "PSRuleEditor.h"
#import "PSRuleEditor_SelectDrag.h"
#import "PSRuleEditorSlice.h"
#import "PSPredicateEditorRowTemplate.h"

@interface PSPredicateEditor : PSRuleEditor {
	NSMutableArray *_allTemplates;
    
    NSArray *_rootItems;
    NSArray *_rootHeaderItems;
    
    id _predicateTarget;
    SEL _predicateAction;
	
	NSCompoundPredicate *_objectValue;
	NSMutableArray *subpredicates;
 }
 
- (void)insertRowAtIndex:(int)rowIndex;
- (void)removeRowAtIndex:(int)rowIndex;
- (void)_reloadPredicateForSlice:(id)slice;
- (void)changeSlicesWithPredicates:(NSArray*)predicates kind:(int)kind indexes:(NSIndexSet*)indexes;
- (void)observeValueForKeyPath:keyPath ofObject:object change:(NSDictionary *)change context:context;
- (void)setRowTemplates:(NSArray *)rowTemplates;

- (NSPredicate*)predicateForRow:(int)row;
- (PSPredicateEditorRowTemplate*)nextTemplate;
- (PSPredicateEditorRowTemplate*)templateForPredicate:(NSPredicate *)predicate;

- (NSMutableArray *)subpredicates;
- (unsigned)countOfSubpredicates;
- (id)objectInSubpredicatesAtIndex:(unsigned)index;
- (void)insertObject:(id)obj inSubpredicatesAtIndex:(unsigned)index;
- (void)insertSubpredicates:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromSubpredicatesAtIndex:(unsigned)index;
- (void)removeSubpredicatesAtIndexes:(NSIndexSet*)indexes;
- (void)replaceObjectInSubpredicatesAtIndex:(unsigned)theIndex withObject:(id)obj;

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
