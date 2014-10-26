//
//  Bar1TableViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"
#import "MeasureBarDefinition.h"

@class DisplayBarContainerViewController;

@interface Bar1TableViewController : UITableViewController <MeasureBarDefinition>

@property (weak, nonatomic) IBOutlet DisplayBarContainerViewController *displayBarCVC;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
