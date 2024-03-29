
@interface NSExpression (RuleEditorAdditions)
-(id)objectValue;
-(BOOL)shouldCastIntoAttributeType:(NSAttributeType)attributeType;
@end

@interface NSPopUpButton (RuleEditor)
+ (NSPopUpButton*)plasticButton;
@end

@class NSEntityDescription;

@interface PSPredicateEditorRowTemplate : NSObject <NSCoding, NSCopying> {
    int _templateType;
    int _predicateOptions;
    NSComparisonPredicateModifier _predicateModifier;
    int _leftAttributeType;
    int _rightAttributeType;
    NSArray *_views;
	
	NSArray *_leftExpressions; 
	NSArray *_rightExpressions;
	NSArray *_operators;	
	NSArray *_compoundTypes;
	
	NSDictionary *_formattingDictionary;
/*	
    struct {
		unsigned leftIsWildcard:1;
		unsigned rightIsWildcard:1;
		unsigned reserved:30;
    } _ptFlags;
    
    id _patternReserved;
 */
}

- (int)templateType;
- (NSControl*) _buildRightView;
- (NSPopUpButton*)_buildLeftView;
- (NSPredicate*)_defaultPredicate;
- (NSPopUpButton*)_buildOperatorsView;
- (NSString*)localizedString:(NSString*)str;
- (void)_checkForValidOperators:(NSArray*)operators;
- (void)_checkForValidExpressions:(NSArray*)expressions;
- (NSDictionary *)_formattingDictionary;
- (void)_setFormattingDictionary:(NSDictionary *)dictionary;
/* returns a positive number if the template can represent the predicate, and zero if it cannot.  The highest match determines which template is responsible for displaying the predicate.  Developers can override this to determine which predicates their custom template handles.  By default, this returns values in the range [0., 1.]
*/
- (double)matchForPredicate:(NSPredicate *)predicate;

/* returns the list of views that are placed in the row.  NSPopUpButtons are treated specially in that the items of multiple templates are merged together; other views are added as-is.  Developers can override this to return views in addition to or instead of the default views.
*/
- (NSArray *)templateViews;

/* sets the value of the views according to the given predicate.  This is only called if matchForPredicate: returns a positive value for the given predicate.  Developers can override this to set the values of their custom views.
*/
- (void)setPredicate:(NSPredicate *)predicate;

/* returns the predicate represented by the template's views' values and the given subpredicates.  Developers can override this to return the predicate represented by their custom views. */
- (NSPredicate *)predicateWithSubpredicates:(NSArray *)subpredicates;

/* for a given predicate, returns the subpredicates that should be made subrows.  For NSCompoundPredicate, this returns the array of subpredicates; it returns nil for other types of predicates.  This is only called if matchForPredicate: returns a positive value for the given predicate.  Developers can override this to create custom templates that handle complicated compound predicates.
*/ 
- (NSArray *)displayableSubpredicatesOfPredicate:(NSPredicate *)predicate;

/* creates a template of the popup-popup-popup form, with the left and right popups representing the left and right expression arrays, and the center popup representing the operators.
*/
- (id)initWithLeftExpressions:(NSArray *)leftExpressions rightExpressions:(NSArray *)rightExpressions modifier:(NSComparisonPredicateModifier)modifier operators:(NSArray *)operators options:(int)options;

/* creates a template of the popup-popup-view form, with the left popups representing the left expressions, the right view representing an arbitrary value, and the center popup representing the operators.
*/
- (id)initWithLeftExpressions:(NSArray *)leftExpressions rightExpressionAttributeType:(NSAttributeType)attributeType modifier:(NSComparisonPredicateModifier)modifier operators:(NSArray *)operators options:(int)options;

/* creates a template suitable for displaying compound predicates.  NSPredicateEditor contains such a template by default.
*/
- (id)initWithCompoundTypes:(NSArray *)compoundTypes;

/* returns the various values set in the initializers, or zero/nil if they do not apply
*/
- (NSArray *)leftExpressions;
- (NSArray *)rightExpressions;
- (NSAttributeType)rightExpressionAttributeType;
- (NSComparisonPredicateModifier)modifier;
- (NSArray *)operators;
- (int)options;
- (NSArray *)compoundTypes;

/* CoreData convenience method: creates an array of templates of the popup-popup-view variety from the given key paths.  The key paths may cross relationships but must terminate in attributes.
*/
+ (NSArray *)templatesWithAttributeKeyPaths:(NSArray *)keyPaths inEntityDescription:(NSEntityDescription *)entityDescription;

@end

