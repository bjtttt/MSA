//
//  Bar0TableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ShareSettings.h"

@class DisplayBarContainerViewController;

@interface Bar0TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet DisplayBarContainerViewController *displayBarCVC;

@property (weak, nonatomic) IBOutlet UIImageView *singleContinousIV;

@property (nonatomic) BOOL isContinouse;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
