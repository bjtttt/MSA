//
//  MeasureTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MeasureNavigationViewController;

@interface MeasureTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet MeasureNavigationViewController *measureNVC;

@property (copy, nonatomic) NSArray *systems;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
