//
//  Bar6TableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class DisplaySettingsContainerViewController;

@interface Bar6TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet DisplaySettingsContainerViewController *displaySettingsCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
