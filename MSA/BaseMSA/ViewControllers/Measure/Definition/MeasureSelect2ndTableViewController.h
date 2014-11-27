//
//  MeasureSelect2ndTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MeasureSelectTableViewController;

@interface MeasureSelect2ndTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet MeasureSelectTableViewController *measureSelectTVC;

@property (copy, nonatomic) NSArray *systems;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@property (strong, nonatomic) NSMutableArray *views;

@end
