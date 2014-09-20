//
//  MSAFormSheetController.m
//  MSAFormSheetController
//

#import "MSAFormSheetController.h"
#import "NSInvocation+Copy.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

NSString *const MSAFormSheetDidPresentNotification = @"MSAFormSheetDidPresentNotification";
NSString *const MSAFormSheetDidDismissNotification = @"MSAFormSheetDidDismissNotification";
NSString *const MSAFormSheetWillPresentNotification = @"MSAFormSheetWillPresentNotification";
NSString *const MSAFormSheetWillDismissNotification = @"MSAFormSheetWillDismissNotification";

CGFloat const MSAFormSheetControllerDefaultPortraitTopInset = 66.0;
CGFloat const MSAFormSheetControllerDefaultLandscapeTopInset = 6.0;
CGFloat const MSAFormSheetControllerDefaultWidth = 284.0;
CGFloat const MSAFormSheetControllerDefaultHeight = 284.0;

CGFloat const MSAFormSheetControllerDefaultAnimationDuration = 0.3;
CGFloat const MSAFormSheetControllerDefaultTransitionBounceDuration = 0.4;
CGFloat const MSAFormSheetControllerDefaultTransitionDropDownDuration = 0.4;

CGFloat const MSAFormSheetPresentedControllerDefaultCornerRadius = 6.0;
CGFloat const MSAFormSheetPresentedControllerDefaultShadowRadius = 6.0;
CGFloat const MSAFormSheetPresentedControllerDefaultShadowOpacity = 0.5;

UIWindowLevel const UIWindowLevelFormSheet = 3;
CGFloat const MSAFormSheetControllerWindowTag = 10001;

static const char* MSAFormSheetControllerAssociatedKey = "MSAFormSheetControllerAssociatedKey";

static MSAFormSheetBackgroundWindow *instanceOfFormSheetBackgroundWindow = nil;
static NSMutableArray *instanceOfSharedQueue = nil;
static BOOL instanceOfFormSheetAnimating = 0;

#pragma mark - UIViewController (OBJC_ASSOCIATION)

@implementation UIViewController (OBJC_ASSOCIATION)

- (MSAFormSheetController *)formSheetController
{
    return objc_getAssociatedObject(self, MSAFormSheetControllerAssociatedKey);
}

- (void)setFormSheetController:(MSAFormSheetController *)formSheetController
{
    objc_setAssociatedObject(self, MSAFormSheetControllerAssociatedKey, formSheetController, OBJC_ASSOCIATION_ASSIGN);
}

@end

#pragma mark - MSAFormSheetBackgroundWidnow (Show/Hide)

@implementation MSAFormSheetBackgroundWindow (Show)

+ (void)showBackgroundWindowAnimated:(BOOL)animated
{
    if ([MSAFormSheetController sharedBackgroundWindow].isHidden) {
        [instanceOfFormSheetBackgroundWindow makeKeyAndVisible];
        
        instanceOfFormSheetBackgroundWindow.alpha = 0;
        
        if (animated) {
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 instanceOfFormSheetBackgroundWindow.alpha = 1;
                             }];
        } else {
            instanceOfFormSheetBackgroundWindow.alpha = 1;
        }
    }
    
}

+ (void)hideBackgroundWindowAnimated:(BOOL)animated
{
    if (!animated) {
        [instanceOfFormSheetBackgroundWindow removeFromSuperview];
        instanceOfFormSheetBackgroundWindow = nil;
        return;
    }
    [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         instanceOfFormSheetBackgroundWindow.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [instanceOfFormSheetBackgroundWindow removeFromSuperview];
                         instanceOfFormSheetBackgroundWindow = nil;
                     }];
}

@end

#pragma mark - MSAFormSheetWindow

@implementation MSAFormSheetWindow

+ (id)appearance
{
    return [MSAAppearance appearanceForClass:[self class]];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        id appearance = [[self class] appearance];
        [appearance applyInvocationTo:self];
    }
    return self;
}

- (CGPoint)convertPoint:(CGPoint)point toInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    CGSize windowSize = self.bounds.size;
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return CGPointMake(windowSize.height-point.y, point.x);
        
    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return CGPointMake(point.y, windowSize.width-point.x);
        
    } else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        return CGPointMake(windowSize.width-point.x, windowSize.height-point.y);
    }
    return point;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIInterfaceOrientation orientaion = [UIApplication sharedApplication].statusBarOrientation;
    CGPoint convertedPoint = [self convertPoint:point toInterfaceOrientation:orientaion];
    
    // UIView will be "transparent" for touch events if we return NO
    if (self.isTransparentTouchEnabled) {
        MSAFormSheetController *formSheet = (MSAFormSheetController *)self.rootViewController;
        if (!CGRectContainsPoint(formSheet.presentedFSViewController.view.frame, convertedPoint)){
            return NO;
        }
    }
    return YES;
}

@end

#pragma mark - MSAFormSheetController

@interface MSAFormSheetController () <UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIViewController *presentingViewController;
@property (nonatomic, strong) UIViewController *presentedFSViewController;

@property (nonatomic, strong) UITapGestureRecognizer *backgroundTapGestureRecognizer;

@property (nonatomic, weak) UIWindow *applicationKeyWindow;
@property (nonatomic, strong) MSAFormSheetWindow *formSheetWindow;

@property (nonatomic, assign, getter = isPresented) BOOL presented;
@property (nonatomic, assign, getter = isKeyboardVisible) BOOL keyboardVisible;
@property (nonatomic, strong) NSValue *screenFrameWhenKeyboardVisible;
@end

@implementation MSAFormSheetController
@synthesize presentingViewController = _presentingViewController;

#pragma mark - Helpers

+ (CGFloat)statusBarHeight
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsLandscape(orientation)) {
        return [UIApplication sharedApplication].statusBarFrame.size.width;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

+ (BOOL)isAutoLayoutAvailable
{
    if (NSClassFromString(@"NSLayoutConstraint")) {
        return YES;
    }
    return NO;
}

#pragma mark - Appearance

+ (id)appearance
{
    return [MSAAppearance appearanceForClass:[self class]];
}

+ (void)load
{
    @autoreleasepool {
        id appearance = [self appearance];
        
        [appearance setPresentedFormSheetSize:CGSizeMake(MSAFormSheetControllerDefaultWidth, MSAFormSheetControllerDefaultHeight)];
        [appearance setCornerRadius:MSAFormSheetPresentedControllerDefaultCornerRadius];
        [appearance setShadowOpacity:MSAFormSheetPresentedControllerDefaultShadowOpacity];
        [appearance setShadowRadius:MSAFormSheetPresentedControllerDefaultShadowRadius];
        [appearance setPortraitTopInset:MSAFormSheetControllerDefaultPortraitTopInset];
        [appearance setLandscapeTopInset:MSAFormSheetControllerDefaultLandscapeTopInset];
        [appearance setShouldMoveToTopWhenKeyboardAppears:YES];
    }
}

#pragma mark - Class methods

+ (void)setAnimating:(BOOL)animating
{
    instanceOfFormSheetAnimating = animating;
}

+ (BOOL)isAnimating
{
    return instanceOfFormSheetAnimating;
}

+ (NSMutableArray *)sharedQueue
{
    if (!instanceOfSharedQueue) {
        instanceOfSharedQueue = [NSMutableArray array];
    }
    return instanceOfSharedQueue;
}

+ (NSArray *)formSheetControllersStack
{
    return [[MSAFormSheetController sharedQueue] copy];
}

+ (MSAFormSheetBackgroundWindow *)sharedBackgroundWindow
{
    if (!instanceOfFormSheetBackgroundWindow) {
        instanceOfFormSheetBackgroundWindow = [[MSAFormSheetBackgroundWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    return instanceOfFormSheetBackgroundWindow;
}

#pragma mark - Setters

- (void)setPresentingViewController:(UIViewController *)presentingViewController
{
    if (_presentingViewController != presentingViewController) {
        _presentingViewController = presentingViewController;
    }
}

- (void)setPortraitTopInset:(CGFloat)portraitTopInset
{
    if (_portraitTopInset != portraitTopInset) {
        _portraitTopInset = portraitTopInset;
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            _portraitTopInset += [MSAFormSheetController statusBarHeight];
        }
    }
}

- (void)setLandscapeTopInset:(CGFloat)landscapeTopInset
{
    if (_landscapeTopInset != landscapeTopInset) {
        _landscapeTopInset = landscapeTopInset;
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            _landscapeTopInset += [MSAFormSheetController statusBarHeight];
        }
    }
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity
{
    if (_shadowOpacity != shadowOpacity) {
        _shadowOpacity = shadowOpacity;
        self.view.layer.shadowOpacity = _shadowOpacity;
    }
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
    if (_shadowRadius != shadowRadius) {
        _shadowRadius = shadowRadius;
        self.view.layer.shadowRadius = _shadowRadius;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        self.presentedFSViewController.view.layer.cornerRadius = _cornerRadius;
    }
}

- (void)setPresentedFormSheetSize:(CGSize)presentedFormSheetSize
{
    if (!CGSizeEqualToSize(_presentedFormSheetSize, presentedFormSheetSize)) {
        _presentedFormSheetSize = presentedFormSheetSize;
        
        CGPoint presentedFormCenter = self.presentedFSViewController.view.center;
        self.presentedFSViewController.view.frame = CGRectMake(0, 0, _presentedFormSheetSize.width, _presentedFormSheetSize.height);
        self.presentedFSViewController.view.center = presentedFormCenter;
        
        // This will make sure that origin be in good position
        [self setupPresentedFSViewControllerFrame];
    }
}

#pragma mark - Getters

- (MSAFormSheetWindow *)formSheetWindow
{
    if (!_formSheetWindow) {
        MSAFormSheetWindow *window = [[MSAFormSheetWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        window.opaque = NO;
        window.windowLevel = UIWindowLevelFormSheet;
        window.tag = MSAFormSheetControllerWindowTag;
        window.rootViewController = self;
        
        _formSheetWindow = window;
    }
    
    return _formSheetWindow;
}

- (BOOL)viewUsingAutolayout
{
    if (self.view.constraints.count > 0) {
        return YES;
    }
    return NO;
}

#pragma mark - Public

- (instancetype)initWithViewController:(UIViewController *)presentedFormSheetViewController
{
    if (self = [super init]) {
        
        // viewDidLoad is called
        self.presentedFSViewController = presentedFormSheetViewController;
        
        id appearance = [[self class] appearance];
        [appearance applyInvocationRecursivelyTo:self upToSuperClass:[MSAFormSheetController class]];
        
        [self setupFormSheetViewController];
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)formSheetSize viewController:(UIViewController *)presentedFormSheetViewController
{
    if (self = [self initWithViewController:presentedFormSheetViewController]) {
        if (!CGSizeEqualToSize(formSheetSize, CGSizeZero)) {
            _presentedFormSheetSize = formSheetSize;
            [self setupFormSheetViewController];
        }
    }
    return self;
}

- (void)presentAnimated:(BOOL)animated completionHandler:(MSAFormSheetCompletionHandler)completionHandler
{
    NSAssert(self.presentedFSViewController, @"MSAFormSheetController must have at least one view controller.");
    NSAssert(![MSAFormSheetController isAnimating], @"Attempting to begin a form sheet transition from to while a transition is already in progress. Wait for didPresentCompletionHandler/didDismissCompletionHandler to know the current transition has completed");
    
    if (self.isPresented){
        if (completionHandler) {
            completionHandler(self.presentedFSViewController);
        }
        return;
    }
    
    self.applicationKeyWindow = [UIApplication sharedApplication].keyWindow;
    
    if (![[MSAFormSheetController sharedQueue] containsObject:self]) {
        [[MSAFormSheetController sharedQueue] addObject:self];
    }
    
    [MSAFormSheetController setAnimating:YES];
    
    [MSAFormSheetBackgroundWindow showBackgroundWindowAnimated:animated];
    
    [self.formSheetWindow makeKeyAndVisible];
    
    [self setupPresentedFSViewControllerFrame];
    
    if (self.willPresentCompletionHandler) {
        self.willPresentCompletionHandler(self.presentedFSViewController);
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:MSAFormSheetWillPresentNotification object:self userInfo:nil];
    
    MSAFormSheetTransitionCompletionHandler transitionCompletionHandler = ^(){
        [MSAFormSheetController setAnimating:NO];
        
        self.presented = YES;
        
        [self.presentedFSViewController setFormSheetController:self];
        
        [self addKeyboardNotifications];
        
        if (self.didPresentCompletionHandler) {
            self.didPresentCompletionHandler(self.presentedFSViewController);
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:MSAFormSheetDidPresentNotification object:self userInfo:nil];
        
        if (completionHandler) {
            completionHandler(self.presentedFSViewController);
        }
    };
    
    if (animated) {
        [self transitionEntryWithCompletionBlock:transitionCompletionHandler];
    } else {
        transitionCompletionHandler();
    }
    
}

- (void)dismissAnimated:(BOOL)animated completionHandler:(MSAFormSheetCompletionHandler)completionHandler
{
    if (self.willDismissCompletionHandler) {
        self.willDismissCompletionHandler(self.presentedFSViewController);
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:MSAFormSheetWillDismissNotification object:self userInfo:nil];
    
    [MSAFormSheetController setAnimating:YES];
    
    [[MSAFormSheetController sharedQueue] removeObject:self];
    
    if ([MSAFormSheetController sharedQueue].count == 0) {
        [MSAFormSheetBackgroundWindow hideBackgroundWindowAnimated:animated];
    }
    
    [self removeKeyboardNotifications];
    
    MSAFormSheetTransitionCompletionHandler transitionCompletionHandler = ^(){
        [MSAFormSheetController setAnimating:NO];
        self.presented = NO;
        
        if (self.didDismissCompletionHandler) {
            self.didDismissCompletionHandler(self.presentedFSViewController);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:MSAFormSheetDidDismissNotification object:self userInfo:nil];
        
        if (completionHandler) {
            completionHandler(self.presentedFSViewController);
        }
        [self cleanup];
    };
    
    if (animated) {
        [self transitionOutWithCompletionBlock:transitionCompletionHandler];
    } else {
        transitionCompletionHandler();
    }
    
    [self.applicationKeyWindow makeKeyWindow];
    self.applicationKeyWindow.hidden = NO;
}

#pragma mark - Transitions

- (void)transitionEntryWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock
{
    switch (self.transitionStyle) {
        case MSAFormSheetTransitionStyleSlideFromTop:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            CGRect originalFormSheetRect = formSheetRect;
            formSheetRect.origin.y = -formSheetRect.size.height;
            self.presentedFSViewController.view.frame = formSheetRect;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = originalFormSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideFromBottom:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            CGRect originalFormSheetRect = formSheetRect;
            formSheetRect.origin.y = self.view.bounds.size.height;
            self.presentedFSViewController.view.frame = formSheetRect;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = originalFormSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideFromRight:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            CGRect originalFormSheetRect = formSheetRect;
            formSheetRect.origin.x = self.view.bounds.size.width;
            self.presentedFSViewController.view.frame = formSheetRect;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = originalFormSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideFromLeft:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            CGRect originalFormSheetRect = formSheetRect;
            formSheetRect.origin.x = -self.view.bounds.size.width;
            self.presentedFSViewController.view.frame = formSheetRect;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = originalFormSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideAndBounceFromLeft:
        {
            CGFloat x = self.presentedFSViewController.view.center.x;
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
            animation.values = @[@(x - self.view.bounds.size.width), @(x + 20), @(x - 10), @(x)];
            animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = MSAFormSheetControllerDefaultTransitionDropDownDuration;
            animation.delegate = self;
            [animation setValue:completionBlock forKey:@"completionHandler"];
            [self.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounceLeft"];
        }break;
            
        case MSAFormSheetTransitionStyleSlideAndBounceFromRight:
        {
            CGFloat x = self.presentedFSViewController.view.center.x;
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
            animation.values = @[@(x + self.view.bounds.size.width), @(x - 20), @(x + 10), @(x)];
            animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = MSAFormSheetControllerDefaultTransitionDropDownDuration;
            animation.delegate = self;
            [animation setValue:completionBlock forKey:@"completionHandler"];
            [self.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounceRight"];
        }break;
            
        case MSAFormSheetTransitionStyleFade:
        {
            self.presentedFSViewController.view.alpha = 0;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.alpha = 1;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleBounce:
        {
            CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            bounceAnimation.fillMode = kCAFillModeBoth;
            bounceAnimation.duration = MSAFormSheetControllerDefaultTransitionBounceDuration;
            bounceAnimation.values = @[
                                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 0.01f)],
                                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.1f)],
                                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 0.9f)],
                                       [NSValue valueWithCATransform3D:CATransform3DIdentity]];
            bounceAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
            bounceAnimation.timingFunctions = @[
                                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            bounceAnimation.delegate = self;
            [bounceAnimation setValue:completionBlock forKey:@"completionHandler"];
            [self.presentedFSViewController.view.layer addAnimation:bounceAnimation forKey:@"bounce"];
        }break;
            
        case MSAFormSheetTransitionStyleDropDown:
        {
            CGFloat y = self.presentedFSViewController.view.center.y;
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
            animation.values = @[@(y - self.view.bounds.size.height), @(y + 20), @(y - 10), @(y)];
            animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = MSAFormSheetControllerDefaultTransitionDropDownDuration;
            animation.delegate = self;
            [animation setValue:completionBlock forKey:@"completionHandler"];
            [self.presentedFSViewController.view.layer addAnimation:animation forKey:@"dropdown"];
        }break;
            
        case MSAFormSheetTransitionStyleCustom:
        {
            [self customTransitionEntryWithCompletionBlock:completionBlock];
            
        }break;
            
        case MSAFormSheetTransitionStyleNone:
        default:{
            if (completionBlock) {
                completionBlock();
            }
        }break;
    }
}

- (void)transitionOutWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock
{
    switch (self.transitionStyle) {
        case MSAFormSheetTransitionStyleSlideFromTop:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            formSheetRect.origin.y = -self.view.bounds.size.height;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = formSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideFromBottom:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            formSheetRect.origin.y = self.view.bounds.size.height;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.presentedFSViewController.view.frame = formSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideAndBounceFromRight:
        case MSAFormSheetTransitionStyleSlideFromRight:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            formSheetRect.origin.x = self.view.bounds.size.width;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = formSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleSlideAndBounceFromLeft:
        case MSAFormSheetTransitionStyleSlideFromLeft:
        {
            CGRect formSheetRect = self.presentedFSViewController.view.frame;
            formSheetRect.origin.x = -self.view.bounds.size.width;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.frame = formSheetRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleFade:
        {
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                             animations:^{
                                 self.presentedFSViewController.view.alpha = 0;
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleBounce:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            animation.values = @[@(1), @(1.2), @(0.01)];
            animation.keyTimes = @[@(0), @(0.4), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = MSAFormSheetControllerDefaultAnimationDuration;
            animation.delegate = self;
            [animation setValue:completionBlock forKey:@"completionHandler"];
            [self.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounce"];
            
            self.presentedFSViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        }break;
            
        case MSAFormSheetTransitionStyleDropDown:
        {
            CGPoint point = self.presentedFSViewController.view.center;
            point.y += self.view.bounds.size.height;
            [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.presentedFSViewController.view.center = point;
                                 CGFloat angle = ((CGFloat)arc4random_uniform(100) - 50.f) / 100.f;
                                 self.presentedFSViewController.view.transform = CGAffineTransformMakeRotation(angle);
                             }
                             completion:^(BOOL finished) {
                                 if (completionBlock) {
                                     completionBlock();
                                 }
                             }];
        }break;
            
        case MSAFormSheetTransitionStyleCustom:
        {
            [self customTransitionOutWithCompletionBlock:completionBlock];
            
        }break;
            
        case MSAFormSheetTransitionStyleNone:
        default:{
            if (completionBlock) {
                completionBlock();
            }
        }break;
    }
}

- (void)customTransitionEntryWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock
{
    if (completionBlock) {
        completionBlock();
    }
}
- (void)customTransitionOutWithCompletionBlock:(MSAFormSheetTransitionCompletionHandler)completionBlock
{
    if (completionBlock) {
        completionBlock();
    }
}

- (void)resetTransition
{
    [self.presentedFSViewController.view.layer removeAllAnimations];
}

#pragma mark - CAAnimation delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    void(^completionHandler)(void) = [anim valueForKey:@"completionHandler"];
    if (completionHandler) {
        completionHandler();
    }
}

/////////////////////////////////////////////////////////////////////////////

#pragma mark - Setup

- (void)setupFormSheetViewController
{
    self.presentedFSViewController.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    if ([MSAFormSheetController isAutoLayoutAvailable]) {
        self.view.translatesAutoresizingMaskIntoConstraints = YES;
    }
    
    self.presentedFSViewController.view.frame = CGRectMake(0, 0, self.presentedFormSheetSize.width, self.presentedFormSheetSize.height);
    self.presentedFSViewController.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.presentedFSViewController.view.center.y);
    self.presentedFSViewController.view.layer.cornerRadius = self.cornerRadius;
    self.presentedFSViewController.view.layer.masksToBounds = YES;
    
    self.view.layer.shadowOffset = CGSizeZero;
    self.view.layer.shadowRadius = self.shadowRadius;
    self.view.layer.shadowOpacity = self.shadowOpacity;
    self.view.frame = self.presentedFSViewController.view.frame;
}

- (void)setupPresentedFSViewControllerFrame
{
    if (self.keyboardVisible) {
        CGRect formSheetRect = self.presentedFSViewController.view.frame;
        CGRect screenRect = [self.screenFrameWhenKeyboardVisible CGRectValue];
        
        if (screenRect.size.height > formSheetRect.size.height) {
            if (self.shouldCenterVerticallyWhenKeyboardAppears) {
                formSheetRect.origin.y = ([MSAFormSheetController statusBarHeight] + screenRect.size.height - formSheetRect.size.height)/2 - screenRect.origin.y;
            }
        } else {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
                formSheetRect.origin.y = [MSAFormSheetController statusBarHeight];
            } else {
                formSheetRect.origin.y = 0;
            }
        }
        
        self.presentedFSViewController.view.frame = formSheetRect;
        
    } else if (self.shouldCenterVertically) {
        self.presentedFSViewController.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        self.presentedFSViewController.view.frame = CGRectMake(self.presentedFSViewController.view.frame.origin.x, self.portraitTopInset, self.presentedFSViewController.view.frame.size.width, self.presentedFSViewController.view.frame.size.height);
    } else {
        self.presentedFSViewController.view.frame = CGRectMake(self.presentedFSViewController.view.frame.origin.x, self.landscapeTopInset, self.presentedFSViewController.view.frame.size.width, self.presentedFSViewController.view.frame.size.height);
    }
}

#pragma mark - UIGestureRecognizers

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // recive touch only on background window
    if (touch.view == self.view) {
        return YES;
    }
    return NO;
}

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)tapGesture
{
    // If last form sheet controller will begin dismiss, don't want to recive touch
    if (tapGesture.state == UIGestureRecognizerStateEnded && [MSAFormSheetController sharedQueue].count > 0){
        CGPoint location = [tapGesture locationInView:[tapGesture.view superview]];
        if (self.didTapOnBackgroundViewCompletionHandler) {
            self.didTapOnBackgroundViewCompletionHandler(location);
        }
        if (self.shouldDismissOnBackgroundViewTap) {
            [self dismissAnimated:YES completionHandler:nil];
        }
    }
}

#pragma mark - UIKeyboard Notifications

- (void)willShowKeyboardNotification:(NSNotification *)notification
{
    CGRect screenRect = [[notification userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        screenRect.size.height = [UIScreen mainScreen].bounds.size.width - screenRect.size.width;
        screenRect.size.width = [UIScreen mainScreen].bounds.size.height;
    } else {
        screenRect.size.height = [UIScreen mainScreen].bounds.size.height - screenRect.size.height;
        screenRect.size.width = [UIScreen mainScreen].bounds.size.width;
    }
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        screenRect.origin.y = 0;
    } else {
        screenRect.origin.y = [MSAFormSheetController statusBarHeight];
    }
    
    self.screenFrameWhenKeyboardVisible = [NSValue valueWithCGRect:screenRect];
    self.keyboardVisible = YES;
    
    [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration animations:^{
        [self setupPresentedFSViewControllerFrame];
    }];
    
}

- (void)willHideKeyboardNotification:(NSNotification *)notification
{
    self.keyboardVisible = NO;
    self.screenFrameWhenKeyboardVisible = nil;
    
    [UIView animateWithDuration:MSAFormSheetControllerDefaultAnimationDuration animations:^{
        [self setupPresentedFSViewControllerFrame];
    }];
    
}

- (void)addKeyboardNotifications
{
    [self removeKeyboardNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willShowKeyboardNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willHideKeyboardNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapGestureRecognizer:)];
    tapGesture.delegate = self;
    self.backgroundTapGestureRecognizer = tapGesture;
    
    [self.formSheetWindow addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.presentedFSViewController.view];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // Fix navigation bar height (minibar for landscape) when view controller will rotate (AutoLayout)
    if ([self.presentedFSViewController isKindOfClass:[UINavigationController class]] && [MSAFormSheetController isAutoLayoutAvailable] && [self viewUsingAutolayout]) {
        UINavigationController *navigationController = (UINavigationController *)self.presentedFSViewController;
        [navigationController.navigationBar sizeToFit];
    }
    
    [self setupPresentedFSViewControllerFrame];
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self resetTransition];
    
    // Fix navigation bar height (minibar for landscape) when view controller will rotate (non-AutoLayout)
    if ([self.presentedFSViewController isKindOfClass:[UINavigationController class]]) {
        if (!([MSAFormSheetController isAutoLayoutAvailable] && [self viewUsingAutolayout])) {
            UINavigationController *navigationController = (UINavigationController *)self.presentedFSViewController;
            [navigationController.navigationBar performSelector:@selector(sizeToFit) withObject:nil afterDelay:(0.5f * duration)];
        }
    }
    
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)cleanup
{
    [self.presentedFSViewController.view removeFromSuperview];
    self.presentedFSViewController = nil;
    
    [self.formSheetWindow removeGestureRecognizer:self.backgroundTapGestureRecognizer];
    
    self.formSheetWindow.rootViewController = nil;
    [self.formSheetWindow removeFromSuperview];
    self.formSheetWindow = nil;
    
    self.backgroundTapGestureRecognizer = nil;
    
    [self removeKeyboardNotifications];
}

@end

#pragma mark - UIViewController (MSAFormSheet)

@implementation UIViewController (MSAFormSheet)
@dynamic formSheetController;

#pragma mark - Public

- (void)presentFormSheetController:(MSAFormSheetController *)formSheetController animated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler
{
    self.formSheetController = formSheetController;
    formSheetController.presentingViewController = self;
    
    [formSheetController presentAnimated:animated completionHandler:^(UIViewController *presentedFSViewController){
        if (completionHandler) {
            completionHandler(formSheetController);
        }
    }];
}

- (void)presentFormSheetWithViewController:(UIViewController *)viewController animated:(BOOL)animated transitionStyle:(MSAFormSheetTransitionStyle)transitionStyle completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler
{
    MSAFormSheetController *formSheetController = [[MSAFormSheetController alloc] initWithViewController:viewController];
    formSheetController.transitionStyle = transitionStyle;
    
    self.formSheetController = formSheetController;
    formSheetController.presentingViewController = self;
    
    [formSheetController presentAnimated:animated completionHandler:^(UIViewController *presentedFSViewController){
        if (completionHandler) {
            completionHandler(formSheetController);
        }
    }];
}

- (void)presentFormSheetWithViewController:(UIViewController *)viewController animated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler
{
    [self presentFormSheetWithViewController:viewController animated:animated transitionStyle:MSAFormSheetTransitionStyleSlideFromTop completionHandler:completionHandler];
}


- (void)dismissFormSheetControllerAnimated:(BOOL)animated completionHandler:(MSAFormSheetPresentationCompletionHandler)completionHandler
{
    MSAFormSheetController *formSheetController = nil;
    
    if (self.formSheetController) {
        formSheetController = self.formSheetController;
    } else {
        formSheetController = [[MSAFormSheetController sharedQueue] lastObject];
    }
    
    [formSheetController dismissAnimated:animated completionHandler:^(UIViewController *presentedFSViewController) {
        if (completionHandler) {
            completionHandler(formSheetController);
        }
    }];
}

@end
