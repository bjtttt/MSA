//
//  MsgDetailContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSG_DETAIL_CONTAINER_VIEW_CONTROLLER
#define MSG_DETAIL_CONTAINER_VIEW_CONTROLLER

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
//#import "MsgSplitViewController.h"
//#import "MsgDetailNavigationViewController.h"

@class MsgSplitViewController;
@class MsgDetailNavigationViewController;

@interface MsgDetailContainerViewController: UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *msgV;
@property (weak, nonatomic) IBOutlet UIToolbar *msgTBar;

@property (weak, nonatomic) IBOutlet MsgDetailNavigationViewController *msgDetailNVC;
@property (weak, nonatomic) IBOutlet MsgSplitViewController *msgSplitVC;

@property (nonatomic) double tbarHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (nonatomic) MSGType messageType;

@end

#endif
