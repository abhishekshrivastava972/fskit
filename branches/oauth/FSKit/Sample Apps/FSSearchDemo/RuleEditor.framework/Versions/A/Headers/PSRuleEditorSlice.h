
// PSRuleEditorSlice.h
// RuleEditor Framework

// Copyright cacaodev, 2006,2007 cacaodev@gmail.com


@class PSRuleEditor,PSPredicateEditorRowTemplate,PSTreeNode;

typedef enum {
	PSRuleEditorType,
	PSPredicateEditorType	
}  PSRuleEditorSliceType;

@interface PSRuleEditorSlice : NSView {
	PSTreeNode			*treeNode;
	NSBundle			*frameworkBundle;
	NSButton			*remove;
	NSColor				*bgColor;
	NSColor				*selectedColor;
	PSRuleEditor		*_editor;
	PSRuleEditorSliceType _type;
	id					_template;
	NSMutableArray		*criteria;
	NSDictionary		*formattingDictionary;
	
	int rowIndex;
	const PSRuleEditorRootCriterion;
}
+(PSRuleEditorSlice*)sliceWithEditor:(PSRuleEditor*)ed type:(PSRuleEditorSliceType)type;
+ (PSRuleEditorSlice*)sliceWithEditor:(PSRuleEditor*)editor type:(PSRuleEditorSliceType)type treeNode:(id)node;
+ (PSRuleEditorSlice*)sliceWithEditor:(PSRuleEditor*)editor template:(PSPredicateEditorRowTemplate*)atemplate treeNode:(id)node;

- (PSRuleEditorSlice*)initWithFrame:(NSRect)editorFrame editor:(PSRuleEditor*)ed type:(PSRuleEditorSliceType)type template:(PSPredicateEditorRowTemplate*)template treeNode:(id)node;

- (NSString*)_selectedValueAtCriterionIndex:(int)index;
- (NSString*)_selectedChildCriterionAtIndex:(int)index;
- (NSArray*)displayValues;

- (void)_rearrangeViewsWithChangeKind:(NSKeyValueChange)changeKind;
- (void)setBgColor:(NSColor *)abgColor;
- (void)insertCriterion:(id)criterion atIndex:(int)index recursive:(BOOL)recursive;
- (void)insertCriterionsFromTemplate;
- (void)didSelectItem:(id)sender;
- (void)reloadSubpredicate:(id)sender;

- (NSColor*)bgColor;
- (PSRuleEditor*)editor;
- (PSPredicateEditorRowTemplate*)template;
- (PSTreeNode*)treeNode;
- (int)rowIndex;
- (PSRuleEditorSliceType)type;

- (NSArray*)criteriaViews;
- (NSArray*)criteriaValues;

- (NSString*)formattedValue:(NSString*)val;
- (NSString*)localizedString:(NSString*)srt;
- (NSButton*)remove;

- (int)rowIndex;
- (int)countOfCriteria; 
- (id)objectInCriteriaAtIndex:(int)index; 
- (void)insertObject:(id)anObject inCriteriaAtIndex:(int)index;
- (void)insertCriteria:(NSArray*)objects atIndexes:(NSIndexSet*)indexes;
- (void)removeObjectFromCriteriaAtIndex:(int)index;
- (void)removeCriteriaAtIndexes:(NSIndexSet*)indexes;
- (void)replaceObjectInCriteriaAtIndex:(int)index withObject:(id)anObject;
@end
