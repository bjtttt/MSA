//
//  SystemMasterTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SystemMasterNavigationViewController;

@interface SystemMasterTableViewController : UITableViewController

@property (weak, nonatomic) SystemMasterNavigationViewController *systMasterNVC;

@property (copy, nonatomic) NSArray *systems;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
