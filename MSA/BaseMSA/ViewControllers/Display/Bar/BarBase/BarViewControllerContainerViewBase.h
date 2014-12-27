//
//  BarViewControllerContainerViewBase.h
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;

@interface BarViewControllerContainerViewBase : UIView//UIVisualEffectView

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) int curMeasBarIndex;
@property (nonatomic) BOOL sendNotification;

@end