//
//  ContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "DisplayViewController.h"
#import "MenuTabBarController.h"
#import "MsgViewController.h"

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *msgView;

@property (weak, nonatomic) IBOutlet DisplayViewController *displayVC;
@property (weak, nonatomic) IBOutlet MenuTabBarController *menuVC;
@property (weak, nonatomic) IBOutlet MsgViewController *msgVC;

@property (strong, nonatomic) ShareSettings * shareSettings;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

