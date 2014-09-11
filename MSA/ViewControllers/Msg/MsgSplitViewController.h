//
//  MsgSplitViewController.h
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class MsgContainerViewController;
@class MsgMasterNavigationViewController;
@class MsgDetailContainerViewController;

@interface MsgSplitViewController : UISplitViewController

@property (weak, nonatomic) MsgMasterNavigationViewController *msgMasterNVC;
@property (weak, nonatomic) MsgDetailContainerViewController *msgDetailCVC;

@property (weak, nonatomic) MsgContainerViewController *msgCVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
