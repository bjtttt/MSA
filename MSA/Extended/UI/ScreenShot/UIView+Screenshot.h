//
//  UIView+Screenshot.h
//  MSA
//
//  Created by guozhitao on 10/3/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

@property (NS_NONATOMIC_IOSONLY, readonly, strong) UIImage *convertViewToImage;

@end
