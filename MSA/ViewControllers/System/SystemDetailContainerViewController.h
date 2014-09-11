//
//  SystemDetailContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class SystemSplitViewController;
@class SystemDetailNavigationViewController;

@interface SystemDetailContainerViewController: UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *msgV;

@property (weak, nonatomic) IBOutlet SystemDetailNavigationViewController *systDetailNVC;
@property (weak, nonatomic) IBOutlet SystemSplitViewController *systSplitVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (nonatomic) SYSTType systemType;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
