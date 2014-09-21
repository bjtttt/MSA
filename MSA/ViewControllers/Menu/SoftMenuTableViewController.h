//
//  SoftMenuTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SoftMenuNavigationViewController;

@interface SoftMenuTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet SoftMenuNavigationViewController *softMenuNVC;

@property (copy, nonatomic) NSArray *systems;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
