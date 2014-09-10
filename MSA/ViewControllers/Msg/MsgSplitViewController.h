//
//  MsgSplitViewController.h
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgMasterNavigationViewController.h"
#import "MsgDetailContainerViewController.h"

@class MsgSplitViewController;

@interface MsgSplitViewController : UISplitViewController

@property (strong, nonatomic) MsgMasterNavigationViewController *msgMasterNVC;
@property (strong, nonatomic) MsgDetailContainerViewController *msgDetaillCVC;

@end
