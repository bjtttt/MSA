//
//  SystemDetailNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SystemDetailTableViewController;
@class SystemDetailContainerViewController;

@interface SystemDetailNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet SystemDetailContainerViewController *systDetailCVC;
@property (weak, nonatomic) IBOutlet SystemDetailTableViewController *systDetailTVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
