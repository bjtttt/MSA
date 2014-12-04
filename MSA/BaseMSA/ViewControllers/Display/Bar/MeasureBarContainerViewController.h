//
//  MeasureBarContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MeasureBarContainerProtocol.h"

@class DisplayContainerViewController;
@class Bar0ViewController;
@class Bar1ViewController;
@class Bar2ViewController;
@class Bar3ViewController;
@class Bar4ViewController;
@class Bar5ViewController;
@class Bar6ViewController;
@class Bar7ViewController;
@class Bar8ViewController;
@class Bar9ViewController;

@class MeasureBarContainerView;
@class BarPopupMenuContainerViewController;

@interface MeasureBarContainerViewController : UIViewController <MeasureBarContainerProtocol>

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

@property (weak, nonatomic) IBOutlet Bar0ViewController *bar0VC;
@property (weak, nonatomic) IBOutlet Bar1ViewController *bar1VC;
@property (weak, nonatomic) IBOutlet Bar2ViewController *bar2VC;
@property (weak, nonatomic) IBOutlet Bar3ViewController *bar3VC;
@property (weak, nonatomic) IBOutlet Bar4ViewController *bar4VC;
@property (weak, nonatomic) IBOutlet Bar5ViewController *bar5VC;
@property (weak, nonatomic) IBOutlet Bar6ViewController *bar6VC;
@property (weak, nonatomic) IBOutlet Bar7ViewController *bar7VC;
@property (weak, nonatomic) IBOutlet Bar8ViewController *bar8VC;
@property (weak, nonatomic) IBOutlet Bar9ViewController *bar9VC;

@property (strong, nonatomic) NSMutableArray *barVCs;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGFloat previousFrameWidth;

@property (strong, nonatomic) ShareSettings * shareSettings;

-(void)adjustMeasureBarWidth:(BOOL)animated;
-(void)setBarsStartAndWidthAccordingTo:(CGFloat)width;

-(void)setBarPopupMenuViewController:(BarPopupMenuContainerViewController *)barPopupMenuCVC;

@end

