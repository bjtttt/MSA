//
//  MsgMasterNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgDetailContainerViewController.h"

@class MsgMasterNavigationViewController;

@interface MsgMasterNavigationViewController : UITableViewController

@property (strong, nonatomic) MsgDetailContainerViewController *msgDetaillCVC;
@property (copy, nonatomic) NSArray *statuses;

@end