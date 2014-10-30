//
//  ContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "ParameterManager.h"

@class DisplayContainerViewController;
@class MenuContainerViewController;
@class MsgContainerViewController;
@class SystemContainerViewController;
@class MeasureContainerViewController;
@class BlurViewController;
@class BarPopupMenuTableViewController;
@class MeasureBarContainerViewController;
@class MainContainerView;

@interface MainContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *measureView;
@property (weak, nonatomic) IBOutlet UIView *msgView;
@property (weak, nonatomic) IBOutlet UIView *systemView;
@property (weak, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIView *barPopupMenuView;

@property (strong, nonatomic) IBOutlet MainContainerView *mainView;

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;
@property (weak, nonatomic) IBOutlet MenuContainerViewController *menuCVC;
@property (weak, nonatomic) IBOutlet MsgContainerViewController *msgCVC;
@property (weak, nonatomic) IBOutlet SystemContainerViewController *systemCVC;
@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;
@property (weak, nonatomic) IBOutlet BlurViewController *blurVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuTableViewController *barPMenuTVC;

@property (strong, nonatomic) MeasureBarContainerViewController *barCVC;

@property (weak, nonatomic) UIStoryboard *modeStoryboard;
//@property (weak, nonatomic) UIStoryboard *measBarStoryboard;

@property (strong, nonatomic) ShareSettings * shareSettings;
@property (strong, nonatomic) ParameterManager * parManager;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

//@property (nonatomic) BOOL barPopupMenuShowed;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

