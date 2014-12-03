//
//  MeasureBarDataDefinition.h
//  MSA
//
//  Created by guozhitao on 9/27/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class BarPopupMenuContainerViewController;
@class DisplayContainerViewController;

@protocol MeasureBarContainerDefinition

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;

@property (strong, nonatomic) NSMutableArray *barVs;
@property (strong, nonatomic) NSMutableArray *barVCs;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGFloat previousFrameWidth;

@property (strong, nonatomic) ShareSettings * shareSettings;

-(void)adjustMeasureBarWidth:(BOOL)animated;
-(void)setBarsStartAndWidthAccordingTo:(CGFloat)width;
-(void)setBarPopupMenuViewController:(BarPopupMenuContainerViewController *)barPopupMenuCVC;

@optional

@end