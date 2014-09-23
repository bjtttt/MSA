//
//  SoftMenuNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class SoftMenuTableViewController;
@class SoftMenuContainerViewController;

@interface SoftMenuNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet SoftMenuContainerViewController *softMenuCVC;
@property (weak, nonatomic) IBOutlet SoftMenuTableViewController *softMenuTVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
