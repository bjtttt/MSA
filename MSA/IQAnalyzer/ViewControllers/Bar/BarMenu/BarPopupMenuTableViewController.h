//
//  BarPopupMenuTableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class BarPopupMenuNavigationViewController;

@interface BarPopupMenuTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet BarPopupMenuNavigationViewController *barPopupMenuNVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

//-(BOOL)resignFirstResponder;
//-(BOOL)becomeFirstResponder;

@end
