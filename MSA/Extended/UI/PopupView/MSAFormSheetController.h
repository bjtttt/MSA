//
//  MSAFormSheetController.h
//  MSAFormSheetController
//

#import <UIKit/UIKit.h>
#import "MSAAppearance.h"
#import "MSAFormSheetBackgroundWindow.h"

#if defined(__GNUC__) && ((__GNUC__ >= 4) || ((__GNUC__ == 3) && (__GNUC_MINOR__ >= 1)))
#define MSA_DEPRECATED_ATTRIBUTE(message) __attribute__((deprecated(message)))
#else
#define MSA_DEPRECATED_ATTRIBUTE(message)
#endif

extern CGFloat const MSAFormSheetControllerDefaultAnimationDuration;
extern CGFloat const MSAFormSheetControllerWindowTag;

extern NSString *const MSAFormSheetWillRotateNotification;

typedef NS_ENUM(NSInteger, MSAFormSheetTransitionStyle) {
    MSAFormSheetTransitionStyleSlideFromTop = 0,
    MSAFormSheetTransitionStyleSlideFromBottom,
    MSAFormSheetTransitionStyleSlideFromLeft,
    MSAFormSheetTransitionStyleSlideFromRight,
    MSAFormSheetTransitionStyleSlideAndBounceFromLeft,
    MSAFormSheetTransitionStyleSlideAndBounceFromRight,
    MSAFormSheetTransitionStyleFade,
    MSAFormSheetTransitionStyleBounce,
    MSAFormSheetTransitionStyleDropDown,
    MSAFormSheetTransitionStyleCustom,
    MSAFormSheetTransitionStyleNone,
};

/**
 Notifications are posted right after completion handlers
 
 @see willPresentCompletionHandler
 @see willDismissCompletionHandler
 @see didPresentCompletionHandler
 @see didDismissCompletionHandler
 */
extern NSString *const MSAFormSheetWillPresentNotification;
extern NSString *const MSAFormSheetWillDismissNotification;
extern NSString *const MSAFormSheetDidPresentNotification;
extern NSString *const MSAFormSheetDidDismissNotification;

@class MSAFormSheetController;

typedef void(^MSAFormSheetCompletionHandler)(UIViewController *presentedFSViewController);
typedef void(^MSAFormSheetBackgroundViewTapCompletionHandler)(CGPoint location);
typedef void(^MSAFormSheetPresentationCompletionHandler)(MSAFormSheetController *formSheetController);
typedef void(^MSAFormSheetTransitionCompletionHandler)();

@interface MSAFormSheetWindow : UIWindow <MSAAppearance>

/**
 Returns whether the window should be touch transparent.
 If transparent is set to YES, window will not recive touch and didTapOnBackgroundViewCompletionHandler will not be called.
 Also will not be possible to dismiss form sheet on background tap.
 By default, this is NO.
 */
@property (nonatomic, assign, getter = isTransparentTouchEnabled) BOOL transparentTouchEnabled MSA_APPEARANCE_SELECTOR;
@end

@interface MSAFormSheetController : UIViewController <MSAAppearance>

/**
 Returns the background window that is displayed below form sheet controller.
 */
+ (MSAFormSheetBackgroundWindow *)sharedBackgroundWindow;

/**
 Returns copy of formSheetController stack, last object in array (form sheet controller) is on top.
 */
+ (NSArray *)formSheetControllersStack;

/**
 Returns the window that form sheet controller is displayed .
 */
@property (nonatomic, readonly, strong) MSAFormSheetWindow *formSheetWindow;

/**
 The view controller that is presented by this form sheet controller.
 MSAFormSheetController (self) --> presentedFSViewController
 */
@property (nonatomic, readonly, strong) UIViewController *presentedFSViewController;

/**
 The view controller that is presenting this form sheet controller.
 This is only set up if you use UIViewController (MSAFormSheet) category to present form sheet controller.
 presentingViewController --> MSAFormSheetController (self) --> presentedFSViewController
 */
@property (nonatomic, readonly, weak) UIViewController *presentingViewController;

/**
 The transition style to use when presenting the receiver.
 By default, this is MSAFormSheetTransitionStyleSlideFromTop.
 */
@property (nonatomic, assign) MSAFormSheetTransitionStyle transitionStyle MSA_APPEARANCE_SELECTOR;

/**
 The handler to call when presented form sheet is before entry transition and its view will show on window.
 */
@property (nonatomic, copy) MSAFormSheetCompletionHandler willPresentCompletionHandler;

/**
 The handler to call when presented form sheet will be dismiss, this is called before out transition animation.
 */
@property (nonatomic, copy) MSAFormSheetCompletionHandler willDismissCompletionHandler;

/**
 The handler to call when presented form sheet is after entry transition animation.
 */
@property (nonatomic, copy) MSAFormSheetCompletionHandler didPresentCompletionHandler;

/**
 The handler to call when presented form sheet is after dismiss.
 */
@property (nonatomic, copy) MSAFormSheetCompletionHandler didDismissCompletionHandler;

/**
 The handler to call when user tap on background view.
 */
@property (nonatomic, copy) MSAFormSheetBackgroundViewTapCompletionHandler didTapOnBackgroundViewCompletionHandler;

/**
 Distance that the presented form sheet view is inset from the status bar in landscape orientation.
 By default, this is 66.0
 */
@property (nonatomic, assign) CGFloat landscapeTopInset MSA_APPEARANCE_SELECTOR;

/**
 Distance that the presented form sheet view is inset from the status bar in portrait orientation.
 By default, this is 6.0
 */
@property (nonatomic, assign) CGFloat portraitTopInset MSA_APPEARANCE_SELECTOR;

/**
 The radius to use when drawing rounded corners for the layer’s presented form sheet view background.
 By default, this is 6.0
 */
@property (nonatomic, assign) CGFloat cornerRadius MSA_APPEARANCE_SELECTOR;

/**
 The blur radius (in points) used to render the layer’s shadow.
 By default, this is 6.0
 */
@property (nonatomic, assign) CGFloat shadowRadius MSA_APPEARANCE_SELECTOR;

/**
 The opacity of the layer’s shadow.
 By default, this is 0.5
 */
@property (nonatomic, assign) CGFloat shadowOpacity MSA_APPEARANCE_SELECTOR;

/**
 Size for presented form sheet controller
 By default, this is CGSizeMake(284.0,284.0)
 */
@property (nonatomic, assign) CGSize presentedFormSheetSize MSA_APPEARANCE_SELECTOR;

/**
 Center form sheet vertically.
 By default, this is NO
 */
@property (nonatomic, assign) BOOL shouldCenterVertically MSA_APPEARANCE_SELECTOR;

/**
 Returns whether the form sheet controller should dismiss after background view tap.
 By default, this is NO
 */
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundViewTap MSA_APPEARANCE_SELECTOR;

/**
 Returns whether the form sheet controller should move to top when UIKeyboard will appear.
 By default, this is YES
 */
@property (nonatomic, assign) BOOL shouldMoveToTopWhenKeyboardAppears MSA_APPEARANCE_SELECTOR;

/**
 Center form sheet vertically when UIKeyboard will appear.
 By default, this is NO
 */
@property (nonatomic, assign) BOOL shouldCenterVerticallyWhenKeyboardAppears MSA_APPEARANCE_SELECTOR;

/**
 Subclasses may override to add custom transition animation.
 You need to setup transitionStyle to MSAFormSheetTransitionStyleCustom to call this method.
 When animation is finished you must call super method or completionBlock to keep view life cycle.
 */
- (void)customTransitionEntryWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock;
- (void)customTransitionOutWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock;

/**
 Initializes and returns a newly created form sheet controller.
 
 @param presentedFormSheetViewController The view controller that is presented by form sheet controller.
 */
- (instancetype)initWithViewController:(UIViewController *)presentedFormSheetViewController;

/**
 Initializes and returns a newly created form sheet controller.
 
 @param formSheetSize The size, in points, for the form sheet controller.
 @param presentedFormSheetViewController The view controller that is presented by form sheet controller.
 */
- (instancetype)initWithSize:(CGSize)formSheetSize viewController:(UIViewController *)presentedFormSheetViewController;

/**
 Presents a form sheet controller.
 
 @param animated Pass YES to animate the transition.
 @param completionHandler A completion handler (didPresentCompletionHandler) or NULL.
 */
- (void)presentAnimated:(BOOL)animated completionHandler:(MSAFormSheetCompletionHandler)completionHandler;

/**
 Dismisses a form sheet controller.
 
 @param animated Pass YES to animate the transition.
 @param completionHandler A completion handler (didDismissCompletionHandler) or NULL.
 */
- (void)dismissAnimated:(BOOL)animated completionHandler:(MSAFormSheetCompletionHandler)completionHandler;

@end

/**
 Category on UIViewController to provide access to the formSheetController.
 */
@interface UIViewController (MSAFormSheet)
@property (nonatomic, readonly) MSAFormSheetController *formSheetController;

/**
 Presents a form sheet cotnroller
 @param formSheetController The form sheet controller or a subclass of MSAFormSheetController.
 @param completionHandler A completion handler or NULL.
 */
- (void)presentFormSheetController:(MSAFormSheetController *)formSheetController animated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler;

/**
 Creates a new form sheet controller and presents it.
 
 @param viewController The view controller that is presented by form sheet controller.
 @param transitionStyle he transition style to use when presenting the receiver.
 @param completionHandler A completion handler or NULL.
 */
- (void)presentFormSheetWithViewController:(UIViewController *)viewController animated:(BOOL)animated transitionStyle:(MSAFormSheetTransitionStyle)transitionStyle completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler;

- (void)presentFormSheetWithViewController:(UIViewController *)viewController animated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler;

/**
 Dismisses the form sheet controller that was presented by the receiver. If not find, last form sheet will be dismissed.
 @param animated Pass YES to animate the transition.
 @param completionHandler A completion handler (didDismissCompletionHandler) or NULL.
 */
- (void)dismissFormSheetControllerAnimated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler;

@end
