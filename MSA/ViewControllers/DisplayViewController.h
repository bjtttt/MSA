//
//  DisplayViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface DisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *displayTopNavBar;
@property (weak, nonatomic) IBOutlet UIButton *showConnectButton;
@property (weak, nonatomic) IBOutlet UIButton *showConfigButton;
@property (weak, nonatomic) IBOutlet UINavigationBar *displayBottomNavBar;
@property (weak, nonatomic) IBOutlet UIButton *showMsgButton;
@property (weak, nonatomic) IBOutlet UIButton *showHideMenuButton;

@property (strong, nonatomic) ShareSettings * shareSettings;

- (IBAction)showHideMenu:(id)sender;
- (IBAction)showHideMsg:(id)sender;

@end

