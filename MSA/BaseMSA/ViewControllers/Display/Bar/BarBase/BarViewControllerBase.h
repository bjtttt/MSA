//
//  BarViewControllerBase.h
//  MSA
//
//  Created by guozhitao on 10/2/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;
@class MeasureBarContainerViewController;
@class BarPopupMenuContainerViewController;

@interface BarViewControllerBase : UIViewController

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) MeasureBarContainerViewController *measureBarCVC;
@property (nonatomic) BarPopupMenuContainerViewController *barPopupMenuCVC;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@end
