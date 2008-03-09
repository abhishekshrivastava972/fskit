//  RuleDelegate.m
//  PSRuleEditor


#import "RuleDelegate.h"
//#import "Controls.h"
static NSString *predicatePartsKeys[6]={@"PSRuleEditorPredicateLeftExpression",@"PSRuleEditorPredicateRightExpression",@"PSRuleEditorPredicateCustomSelector",@"PSRuleEditorPredicateComparisonModifier",@"PSRuleEditorPredicateOptions",@"PSRuleEditorPredicateOperatorType"};
@implementation RuleDelegate

- (id)init{
	self = [super init];
	if (self != nil) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"criteria" ofType:@"plist"];
		NSDictionary * criteriadict = [NSDictionary dictionaryWithContentsOfFile:path];
		rootChildren = [[criteriadict objectForKey:@"criteria"] retain];
	}
	return self;
}

-(void)dealloc{
	[operators release];
	[rootChildren release];
	[super dealloc];	
}

/* When called, you should return the number of child items of the given criterion.  If criterion is nil, you should return the number of root criteria for the given row type. Implementation of this method is required. */
- (int)ruleEditor:(PSRuleEditor *)editor numberOfChildrenForCriterion:(id)criterion withRowType:(int)rowType{
	NSLog(@"%s %@ %@ %d", _cmd, editor, criterion, rowType);
	id newCriterion = (criterion)?criterion:rootChildren;
	return [[newCriterion objectForKey:@"childs"] count];
}

/* When called, you should return the child of the given item at the given index.  If criterion is nil, return the root criterion for the given row type at the given index. Implementation of this method is required. */
- (id)ruleEditor:(PSRuleEditor *)editor child:(int)index forCriterion:(id)criterion withRowType:(int)rowType{
	NSLog(@"%s %d %@ %@ %d", _cmd, index, criterion, rowType);
	if(!criterion) return [[rootChildren objectForKey:@"childs"] objectAtIndex:index];
	
	NSMutableArray *childs = [[[criterion objectForKey:@"childs"] mutableCopy] autorelease];
	NSMutableDictionary *childCriterion = [[[childs objectAtIndex:index] mutableCopy] autorelease];	
	
	id value = [childCriterion objectForKey:@"value"];
	if ([value isKindOfClass:[NSString class]] && NSClassFromString(value)){
		id view = [[[NSClassFromString(value) alloc] init] autorelease];
		
		[childCriterion setObject:view forKey:@"value"];
		[childs replaceObjectAtIndex:index withObject:childCriterion];
		[criterion setObject:childs forKey:@"childs"];
	}
	
	return childCriterion;
}

/*
 When called, you should return a value for the given criterion.  The value should be an instance of NSString, NSView, or NSMenuItem (1).  If the value is an NSView or NSMenuItem (1), you must ensure it is unique for every invocation of this method; that is, do not return a particular instance of NSView or NSMenuItem more than once.  Implementation of this method is required. 
 (1) NSMenuItem: not implemented yet.
 */
- (id)ruleEditor:(PSRuleEditor *)editor displayValueForCriterion:(id)criterion inRow:(int)row{
	NSLog(@"%s %@ %@ %d", _cmd, editor, criterion, row);
	return [criterion objectForKey:@"value"];		
}

- (NSDictionary*)ruleEditor:(PSRuleEditor*)editor predicatePartsForCriterion:(id)criterion withDisplayValue:(id)value inRow:(int)row{
	NSLog(@"%s %@ %@ %d", _cmd, editor, criterion, row);
	
	NSMutableDictionary *predicatePartsForCriterion = [NSMutableDictionary dictionary];
	NSString *lhs = [NSString stringWithFormat:@"%@", [criterion objectForKey:PSRuleEditorPredicateLeftExpression]];
	NSString *rhs = [NSString stringWithFormat:@"%@", [criterion objectForKey:PSRuleEditorPredicateRightExpression]];
	int i;
	for (i=0 ;i< 6;i++){
		NSString *key = predicatePartsKeys[i];
		id value = [criterion objectForKey:key];
		if (!value) continue;
		id predicatePart;
		
		if([value isKindOfClass:[NSString class]] && [value hasPrefix:@"$"]) 
			value = [criterion valueForKeyPath:[value substringFromIndex:1]];
		
		if([key isEqualToString:PSRuleEditorPredicateLeftExpression]) {
			predicatePart = [NSExpression expressionForKeyPath:value];
			lhs = [NSString stringWithFormat:@"%@", value];
		}
		else if ([key isEqualToString:PSRuleEditorPredicateRightExpression]) {
			predicatePart = [NSExpression expressionForConstantValue:value];
			rhs = [NSString stringWithFormat:@"%@", value];
		}
		else
			predicatePart = value;
		
		[predicatePartsForCriterion setObject:predicatePart forKey:key];		
	}
	
	return predicatePartsForCriterion;
}

- (void)ruleEditorRowsDidChange:(NSNotification *)notification{
	NSLog(@"ruleEditorRowsDidChange:%@ %@",[notification description], [[notification object] predicate]); 
//	NSLog(@"subpreds %@", [[[notification object] predicate] subpredicates]);
//	PSRuleEditor *editor = [notification object];
//	NSPredicate *predicates = [[editor predicate] subpredicates];
//	unsigned int	predCount = [predicates count];
//unsigned int index = 0;
//NSDictionary *dict = [NSDictionary new];
//for( ;index < predCount; index += 1)
//	{
//		id	pred = [predicates objectAtIndex:index];
//		/* Send leftExpression to pred, if pred supports it*/
//		if ([pred isKindOfClass:[NSComparisonPredicate class]])
//		{
//			NSLog(@"criteria expressions l=%@ r=%@", [pred leftExpression], [pred rightExpression]);
//			
//		}
//	}
}

//- (NSDictionary*)queryParameters:(PSRuleEditor *)editor {
//		NSMutableArray *parameters = [NSMutableArray array];
//		
//	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//		int i, count = [self countOfSlices];
//		for (i = 0; i < count; i++)
//		{
//			NSDictionary *predpart = [self ruleEditor:(id)nil predicatePartsForCriterion:(id)childcriterion withDisplayValue:selectedValue inRow:(int)row];
////			if(predpart)[dict setValuesForKeysWithDictionary:predpart];
//			NSExpression *lhs = [predpart objectForKey:PSRuleEditorPredicateLeftExpression];
//			NSExpression *rhs = [predpart objectForKey:PSRuleEditorPredicateRightExpression];
//			
//			if (!lhs){ NSLog(@"missing left expression in predicate parts dictionary"); return NULL;}
//			if (!rhs){ NSLog(@"missing right expression in predicate parts dictionary"); return NULL;}	
//			
//			NSLog(@"lhs: %@ rhs:%@",lhs,rhs);
//			[parameters setValue:[rhs constantValue] forKey:[lhs constantValue]];
//		}
//
//
//		return parameters;
//}



@end
