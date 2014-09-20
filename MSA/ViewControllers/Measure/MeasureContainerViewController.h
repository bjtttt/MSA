//
//  MeasureContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class MeasureNavigationViewController;

@interface MeasureContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *measureNavBar;
@property (weak, nonatomic) IBOutlet UIView *measureV;

@property (weak, nonatomic) IBOutlet MeasureNavigationViewController *measureNVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
