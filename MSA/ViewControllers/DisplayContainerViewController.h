//
//  DisplayContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class ContainerViewController;
@class DisplayTracesContainerViewController;
@class DisplayBarContainerViewController;
@class MsgContainerViewController;
@class SystemContainerViewController;

@interface DisplayContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet MsgContainerViewController *msgCVC;
@property (weak, nonatomic) IBOutlet SystemContainerViewController *systCVC;
@property (weak, nonatomic) IBOutlet DisplayBarContainerViewController *barCVC;
@property (weak, nonatomic) IBOutlet DisplayTracesContainerViewController *traceCVC;
@property (weak, nonatomic) IBOutlet ContainerViewController *mainCVC;

@property (weak, nonatomic) IBOutlet UIView *tracesV;
@property (weak, nonatomic) IBOutlet UIView *barV;

@property (weak, nonatomic) IBOutlet UINavigationBar *displayNavBar;
@property (weak, nonatomic) IBOutlet UIButton *showConnectButton;
@property (weak, nonatomic) IBOutlet UIButton *showSystemButton;
@property (weak, nonatomic) IBOutlet UIToolbar *displayToolBar;
@property (weak, nonatomic) IBOutlet UIButton *showMsgButton;
@property (weak, nonatomic) IBOutlet UIButton *showHideMenuButton;

@property (strong, nonatomic) ShareSettings * shareSettings;

@property (nonatomic) double navBarHeight;
@property (nonatomic) double toolBarHeight;
@property (nonatomic) double settingsHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

- (IBAction)showHideMenu:(id)sender;
- (IBAction)showMeasureView:(id)sender;
- (IBAction)exitToHere:(UIStoryboardSegue *)sender;
//- (IBAction)transitionFromTop:(id)sender;

- (IBAction)showSystemView:(id)sender;
- (IBAction)showMsgView:(id)sender;

//-(void)adjustMeasureBarWidth:(BOOL)animated;

@end

