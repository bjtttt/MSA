//
//  PresetMenuTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class PresetMenuContainerViewController;

@interface PresetMenuTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet PresetMenuContainerViewController *presetMenuCVC;

@property (copy, nonatomic) NSArray *preset;
@property (copy, nonatomic) NSArray *presetUser;
@property (copy, nonatomic) NSArray *presetAllModes;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
