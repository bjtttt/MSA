//
//  ContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "DisplayContainerViewController.h"
#import "MenuContainerViewController.h"
#import "MsgContainerViewController.h"
#import "SystemContainerViewController.h"

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *msgView;
@property (weak, nonatomic) IBOutlet UIView *systemView;

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;
@property (weak, nonatomic) IBOutlet MenuContainerViewController *menuCVC;
@property (weak, nonatomic) IBOutlet MsgContainerViewController *msgCVC;
@property (weak, nonatomic) IBOutlet SystemContainerViewController *systemCVC;

@property (strong, nonatomic) ShareSettings * shareSettings;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

