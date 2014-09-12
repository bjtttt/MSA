//
//  DisplayContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MsgContainerViewController.h"
#import "SystemContainerViewController.h"

@interface DisplayContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet MsgContainerViewController *msgCVC;
@property (weak, nonatomic) IBOutlet SystemContainerViewController *systCVC;

@property (weak, nonatomic) IBOutlet UIView *settingsV;
@property (weak, nonatomic) IBOutlet UIView *tracesV;

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
- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@end

