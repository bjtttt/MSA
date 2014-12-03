//
//  MeasureBarContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MeasureBarContainerDefinition.h"

@class DisplayContainerViewController;
@class Bar0TableViewController;
@class Bar1TableViewController;
@class Bar2TableViewController;
@class Bar3TableViewController;
@class Bar4TableViewController;
@class Bar5TableViewController;
@class Bar6TableViewController;
@class Bar7TableViewController;
@class Bar8TableViewController;
@class Bar9TableViewController;

@class MeasureBarContainerView;
@class BarPopupMenuContainerViewController;

@interface MeasureBarContainerViewController : UIViewController <MeasureBarContainerDefinition>

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuContainerViewController *barPopupMenuCVC;

@property (weak, nonatomic) IBOutlet UIView *bar0V;
@property (weak, nonatomic) IBOutlet UIView *bar1V;
@property (weak, nonatomic) IBOutlet UIView *bar2V;
@property (weak, nonatomic) IBOutlet UIView *bar3V;
@property (weak, nonatomic) IBOutlet UIView *bar4V;
@property (weak, nonatomic) IBOutlet UIView *bar5V;
@property (weak, nonatomic) IBOutlet UIView *bar6V;
@property (weak, nonatomic) IBOutlet UIView *bar7V;
@property (weak, nonatomic) IBOutlet UIView *bar8V;
@property (weak, nonatomic) IBOutlet UIView *bar9V;

@property (strong, nonatomic) IBOutlet MeasureBarContainerView *barCV;

@property (strong, nonatomic) NSMutableArray *barVs;

@property (weak, nonatomic) IBOutlet Bar0TableViewController *bar0VC;
@property (weak, nonatomic) IBOutlet Bar1TableViewController *bar1VC;
@property (weak, nonatomic) IBOutlet Bar2TableViewController *bar2VC;
@property (weak, nonatomic) IBOutlet Bar3TableViewController *bar3VC;
@property (weak, nonatomic) IBOutlet Bar4TableViewController *bar4VC;
@property (weak, nonatomic) IBOutlet Bar5TableViewController *bar5VC;
@property (weak, nonatomic) IBOutlet Bar6TableViewController *bar6VC;
@property (weak, nonatomic) IBOutlet Bar7TableViewController *bar7VC;
@property (weak, nonatomic) IBOutlet Bar8TableViewController *bar8VC;
@property (weak, nonatomic) IBOutlet Bar9TableViewController *bar9VC;

@property (strong, nonatomic) NSMutableArray *barVCs;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (nonatomic) CGFloat previousFrameWidth;

@property (strong, nonatomic) ShareSettings * shareSettings;

-(void)adjustMeasureBarWidth:(BOOL)animated;
-(void)setBarsStartAndWidthAccordingTo:(CGFloat)width;

-(void)setBarPopupMenuViewController:(BarPopupMenuContainerViewController *)barPopupMenuCVC;

@end

