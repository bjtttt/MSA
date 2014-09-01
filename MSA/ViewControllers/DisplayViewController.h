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

@property (weak, nonatomic) IBOutlet UINavigationBar *displayNavBar;
@property (weak, nonatomic) IBOutlet UIButton *showHideMenuButton;
@property (weak, nonatomic) IBOutlet UIToolbar *displayToolBar;
@property (weak, nonatomic) IBOutlet UIButton *showHideMsgButton;

@property (strong, nonatomic) ShareSettings * shareSettings;

- (IBAction)showHideMenu:(id)sender;
- (IBAction)showHideMsg:(id)sender;

@end

