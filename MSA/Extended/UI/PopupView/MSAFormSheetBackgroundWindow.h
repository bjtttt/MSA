//
//  MSAFormSheetBackgroundWindow.h
//  MSAFormSheetControllerExample
//

#import <UIKit/UIKit.h>
#import "MSAAppearance.h"

@interface MSAFormSheetBackgroundWindow : UIWindow <MSAAppearance>

/**
 The background color of the background view.
 After last form sheet dismiss, backgroundColor will change to default.
 If you want to set it permanently to another color use appearance proxy on MSAFormSheetBackgroundWindow.
 By default, this is a black at with a 0.5 alpha component
 */
@property (nonatomic, strong) UIColor *backgroundColor MSA_APPEARANCE_SELECTOR;

/**
 The background image of the background view, it is setter for backgroundImageView and can be set by MSAAppearance proxy.
 After last form sheet dismiss, backgroundImage will change to default.
 If you want to set it permanently to another color use appearance proxy on MSAFormSheetBackgroundWindow.
 By default, this is nil
 */
@property (nonatomic, strong) UIImage *backgroundImage MSA_APPEARANCE_SELECTOR;

/**
 The background image view.
 */
@property (nonatomic, strong, readonly) UIImageView *backgroundImageView;

/*
 Apply background blur effect
 By default, this is NO
 */
@property (nonatomic, assign) BOOL backgroundBlurEffect MSA_APPEARANCE_SELECTOR;

/*
 Specifies the blur radius used to render the blur background view
 By default, this is 2.0
 */
@property (nonatomic, assign) CGFloat blurRadius MSA_APPEARANCE_SELECTOR;

/*
 Specifies the blur tint color used to render the blur background view
 By default, this is nil
 */
@property (nonatomic, assign) UIColor *blurTintColor MSA_APPEARANCE_SELECTOR;

/*
 Specifies the blur saturation used to render the blur background view
 By default, this is 1.0
 */
@property (nonatomic, assign) CGFloat blurSaturation MSA_APPEARANCE_SELECTOR;

/*
 Specifies the blur mask image used to render the blur background view
 By default, this is nil
 */
@property (nonatomic, assign) UIImage *blurMaskImage MSA_APPEARANCE_SELECTOR;

/*
 Asynchronously recompute the display of background blur.
 Recommended to use if you expect interface orientation or some dynamic animations belof form sheet
 By default, this is NO
 */
@property (nonatomic, assign) BOOL dynamicBlur MSA_APPEARANCE_SELECTOR;

/*
 Specifies how often the blur background refresh.
 Works only if dynamicBlur is set to YES.
 By default, this is 0
 */
@property (nonatomic, assign) CGFloat dynamicBlurInterval MSA_APPEARANCE_SELECTOR;

/*
 All of the interface orientations that the background image view supports.
 By default, this is UIInterfaceOrientationMaskAll
 */
@property (nonatomic, assign) UIInterfaceOrientationMask supportedInterfaceOrientations MSA_APPEARANCE_SELECTOR;
@end
