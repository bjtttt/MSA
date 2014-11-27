//
//  BarPopupMenuContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class BarPopupMenuNavigationViewController;
@class MainContainerViewController;

@interface BarPopupMenuContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UIView *barPopupMenuV;

@property (weak, nonatomic) IBOutlet MainContainerViewController *mainCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuNavigationViewController *barPopupMenuNVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
