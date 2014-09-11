//
//  MsgMasterNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSG_MASTER_NAVIGATION_VIEW_CONTROLLER
#define MSG_MASTER_NAVIGATION_VIEW_CONTROLLER

#import <UIKit/UIKit.h>
//#import "MsgDetailContainerViewController.h"

@class MsgDetailContainerViewController;

@interface MsgMasterNavigationViewController : UITableViewController

@property (strong, nonatomic) MsgDetailContainerViewController *msgDetailCVC;
@property (copy, nonatomic) NSArray *statuses;

@end

#endif
