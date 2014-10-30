//
//  BarPopupMenuNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class BarPopupMenuContainerViewController;
@class BarPopupMenuTableViewController;

@interface BarPopupMenuNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet BarPopupMenuContainerViewController *barPopupMenuCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuTableViewController *barPopupMenuTVC;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
