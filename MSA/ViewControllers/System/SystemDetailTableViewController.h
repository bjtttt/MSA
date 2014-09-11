//
//  SystemDetailNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SystemDetailNavigationViewController;

@interface SystemDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet SystemDetailNavigationViewController *systDetailNVC;

@property (copy, nonatomic) NSArray *systems;
@property (nonatomic) SYSTType currentSystem;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
