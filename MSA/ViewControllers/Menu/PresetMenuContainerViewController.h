//
//  PresetMenuContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class PresetMenuTableViewController;
@class MenuContainerViewController;

@interface PresetMenuContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UIView *presetMenuV;

@property (weak, nonatomic) IBOutlet MenuContainerViewController *menuCVC;
@property (weak, nonatomic) IBOutlet PresetMenuTableViewController *presetMenuTVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
