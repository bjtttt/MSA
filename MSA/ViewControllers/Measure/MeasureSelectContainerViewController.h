//
//  MeasureSelectContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class MeasureSelectNavigationViewController;
@class MeasureContainerViewController;

@interface MeasureSelectContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UIView *measureSelectV;

@property (weak, nonatomic) IBOutlet MeasureSelectNavigationViewController *measureSelectNVC;
@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
