//
//  MeasureNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MeasureTableViewController;
@class MeasureContainerViewController;

@interface MeasureNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;
@property (weak, nonatomic) IBOutlet MeasureTableViewController *measureTVC;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
