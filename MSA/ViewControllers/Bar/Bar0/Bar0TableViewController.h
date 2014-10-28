//
//  Bar0TableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MeasureBarDefinition.h"

@class MeasureBarContainerViewController;
@class BarPopupMenuTableViewController;

@interface Bar0TableViewController : UITableViewController <MeasureBarDefinition>

@property (weak, nonatomic) IBOutlet MeasureBarContainerViewController *displayBarCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuTableViewController *barPopupMenuTVC;

@property (weak, nonatomic) IBOutlet UIImageView *singleContinousIV;

@property (nonatomic) BOOL isContinouse;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
