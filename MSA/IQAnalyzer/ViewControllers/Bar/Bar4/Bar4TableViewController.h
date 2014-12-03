//
//  Bar4TableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MeasureBarProtocol.h"

@class MeasureBarContainerViewController;
@class BarPopupMenuContainerViewController;

@interface Bar4TableViewController : UITableViewController <MeasureBarProtocol>

@property (weak, nonatomic) IBOutlet MeasureBarContainerViewController *measureBarCVC;
@property (weak, nonatomic) IBOutlet BarPopupMenuContainerViewController *barPopupMenuCVC;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
