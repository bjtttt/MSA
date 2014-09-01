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
#import "MenuViewController.h"

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UIView *menuView;

@property (weak, nonatomic) IBOutlet DisplayViewController *displayVC;
@property (weak, nonatomic) IBOutlet MenuViewController *menuVC;

@property (strong, nonatomic) ShareSettings * shareSettings;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

