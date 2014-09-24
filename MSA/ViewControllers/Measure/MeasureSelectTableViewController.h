//
//  MeasureSelectTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MeasureSelectNavigationViewController;

@interface MeasureSelectTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet MeasureSelectNavigationViewController *measureSelectNVC;

@property (copy, nonatomic) NSArray *systems;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
