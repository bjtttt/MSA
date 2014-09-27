//
//  DisplaySettingsContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class DisplayContainerViewController;

@interface DisplaySettingsContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;

@property (weak, nonatomic) IBOutlet UIView *bar0V;
@property (weak, nonatomic) IBOutlet UIView *bar1V;
@property (weak, nonatomic) IBOutlet UIView *bar2V;
@property (weak, nonatomic) IBOutlet UIView *bar3V;
@property (weak, nonatomic) IBOutlet UIView *bar4V;
@property (weak, nonatomic) IBOutlet UIView *bar5V;
@property (weak, nonatomic) IBOutlet UIView *bar6V;
@property (weak, nonatomic) IBOutlet UIView *bar7V;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (nonatomic) double previousFrameWidth;

@property (strong, nonatomic) ShareSettings * shareSettings;

-(void)setMeasureBarAccordingToFrame;
-(void)setMeasureBar:(CGFloat)barWidth;
-(void)adjustMeasureBarWidth:(BOOL)animated;

@end

