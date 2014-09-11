//
//  MsgDetailNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MsgDetailNavigationViewController;

@interface MsgDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet MsgDetailNavigationViewController *msgDetailNVC;

@property (copy, nonatomic) NSArray *statuses;
@property (nonatomic) MSGType currentStatus;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
