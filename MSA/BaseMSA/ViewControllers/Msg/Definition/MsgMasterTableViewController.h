//
//  MsgMasterTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MsgMasterNavigationViewController;

@interface MsgMasterTableViewController : UITableViewController

@property (weak, nonatomic) MsgMasterNavigationViewController *msgMasterNVC;

@property (copy, nonatomic) NSArray *statuses;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
