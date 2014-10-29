//
//  MainContainerView.h
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface MainContainerView : UIView

@property (weak, nonatomic) UIView *barPopupMenuV;
@property (weak, nonatomic) UIView *barV;

@property (strong, nonatomic) ShareSettings * shareSettings;

@end