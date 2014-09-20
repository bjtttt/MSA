//
//  MZApperance.h
//  MZAppearance
//
//

#import <Foundation/Foundation.h>

#define MSA_APPEARANCE_SELECTOR UI_APPEARANCE_SELECTOR

@protocol MSAAppearance <NSObject>

/** 
 To customize the appearance of all instances of a class, send the relevant appearance modification messages to the appearance proxy for the class.
 */
+ (id)appearance;
@end

@interface MSAAppearance : NSProxy

/** 
 Applies the appearance of all instances to the object. 
 */
- (void)applyInvocationTo:(id)target;

/**
 Applies the appearance of all instances to the object starting from the superclass 
 */
- (void)applyInvocationRecursivelyTo:(id)target upToSuperClass:(Class)superClass;

/** 
 Returns appearance for class 
 */
+ (id)appearanceForClass:(Class)aClass;

@end
