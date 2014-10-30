//
//  BarPopupMenuNavigationViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class MainContainerViewController;
@class BarPopupMenuTableViewController;

@interface BarPopupMenuNavigationViewController : UINavigationController

@property (weak, nonatomic) IBOutlet MainContainerViewController *mainCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuTableViewController *softMenuTVC;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
