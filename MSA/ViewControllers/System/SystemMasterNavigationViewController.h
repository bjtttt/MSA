//
//  SystemMasterNavigationViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-9-11.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SystemSplitViewController;
@class SystemMasterTableViewController;

@interface SystemMasterNavigationViewController : UINavigationController

@property (weak, nonatomic) SystemSplitViewController *systSplitVC;
@property (weak, nonatomic) SystemMasterTableViewController *systMasterTVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
