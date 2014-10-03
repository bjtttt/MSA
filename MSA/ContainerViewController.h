//
//  ContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class DisplayContainerViewController;
@class MenuContainerViewController;
@class MsgContainerViewController;
@class SystemContainerViewController;
@class MeasureContainerViewController;
@class BlurViewController;
@class BarMenuContainerViewController;

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *measureView;
@property (weak, nonatomic) IBOutlet UIView *msgView;
@property (weak, nonatomic) IBOutlet UIView *systemView;
@property (weak, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIView *barView;

@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;
@property (weak, nonatomic) IBOutlet MenuContainerViewController *menuCVC;
@property (weak, nonatomic) IBOutlet MsgContainerViewController *msgCVC;
@property (weak, nonatomic) IBOutlet SystemContainerViewController *systemCVC;
@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;
@property (weak, nonatomic) IBOutlet BlurViewController *blurVC;
@property (weak, nonatomic) IBOutlet BarMenuContainerViewController *barMenuCVC;

@property (weak, nonatomic) UIStoryboard *modeStoryboard;
@property (weak, nonatomic) UIStoryboard *measBarStoryboard;

@property (strong, nonatomic) ShareSettings * shareSettings;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

