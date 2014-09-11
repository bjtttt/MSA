//
//  MsgDetailNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MsgDetailTableViewController;
@class MsgDetailContainerViewController;

@interface MsgDetailNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet MsgDetailContainerViewController *msgDetailCVC;
@property (weak, nonatomic) IBOutlet MsgDetailTableViewController *msgDetailTVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
