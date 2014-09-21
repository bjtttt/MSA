//
//  SoftMenuContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class SoftMenuNavigationViewController;
@class MenuContainerViewController;

@interface SoftMenuContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UIView *softMenuV;

@property (weak, nonatomic) IBOutlet MenuContainerViewController *menuCVC;
@property (weak, nonatomic) IBOutlet SoftMenuNavigationViewController *softMenuNVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
