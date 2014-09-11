//
//  MsgSplitViewController.h
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSG_SPLIT_VIEW_CONTROLLER
#define MSG_SPLIT_VIEW_CONTROLLER

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
//#import "MsgMasterNavigationViewController.h"
//#import "MsgDetailContainerViewController.h"

@class MsgMasterNavigationViewController;
@class MsgDetailContainerViewController;

@interface MsgSplitViewController : UISplitViewController

@property (strong, nonatomic) MsgMasterNavigationViewController *msgMasterNVC;
@property (strong, nonatomic) MsgDetailContainerViewController *msgDetailCVC;

@property (strong, nonatomic) ShareSettings *shareSettings;

@end

#endif
