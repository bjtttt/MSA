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
@class BarPopupMenuContainerViewController;

@interface Bar0TableViewController : UITableViewController <MeasureBarDefinition>

@property (weak, nonatomic) IBOutlet MeasureBarContainerViewController *measureBarCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuContainerViewController *barPopupMenuCVC;

@property (weak, nonatomic) IBOutlet UIImageView *singleContinousIV;

@property (nonatomic) BOOL isContinouse;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
