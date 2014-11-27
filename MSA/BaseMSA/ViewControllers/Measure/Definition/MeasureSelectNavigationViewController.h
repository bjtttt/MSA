//
//  MeasureSelectNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MeasureSelectTableViewController;
@class MeasureContainerViewController;

@interface MeasureSelectNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;
@property (weak, nonatomic) IBOutlet MeasureSelectTableViewController *measureSelectTVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
