//
//  SystemSplitViewController.h
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class SystemContainerViewController;
@class SystemMasterNavigationViewController;
@class SystemDetailContainerViewController;

@interface SystemSplitViewController : UISplitViewController

@property (weak, nonatomic) SystemMasterNavigationViewController *systMasterNVC;
@property (weak, nonatomic) SystemDetailContainerViewController *systDetailCVC;

@property (weak, nonatomic) SystemContainerViewController *systCVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
