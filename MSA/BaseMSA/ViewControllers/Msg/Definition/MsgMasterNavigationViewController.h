//
//  MsgMasterNavigationViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-9-11.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MsgSplitViewController;
@class MsgMasterTableViewController;

@interface MsgMasterNavigationViewController : UINavigationController

@property (weak, nonatomic) MsgSplitViewController *msgSplitVC;
@property (weak, nonatomic) MsgMasterTableViewController *msgMasterTVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
