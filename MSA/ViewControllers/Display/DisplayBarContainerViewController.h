//
//  DisplayBarContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class DisplayContainerViewController;
@class Bar0TableViewController;
@class Bar1TableViewController;
@class Bar2TableViewController;
@class Bar3TableViewController;
@class Bar4TableViewController;
@class Bar5TableViewController;
@class Bar6TableViewController;
@class Bar7TableViewController;

@interface DisplayBarContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;

@property (weak, nonatomic) IBOutlet UIView *bar0V;
@property (weak, nonatomic) IBOutlet UIView *bar1V;
@property (weak, nonatomic) IBOutlet UIView *bar2V;
@property (weak, nonatomic) IBOutlet UIView *bar3V;
@property (weak, nonatomic) IBOutlet UIView *bar4V;
@property (weak, nonatomic) IBOutlet UIView *bar5V;
@property (weak, nonatomic) IBOutlet UIView *bar6V;
@property (weak, nonatomic) IBOutlet UIView *bar7V;

@property (strong, nonatomic) NSArray *barVs;

@property (weak, nonatomic) IBOutlet Bar0TableViewController *bar0VC;
@property (weak, nonatomic) IBOutlet Bar1TableViewController *bar1VC;
@property (weak, nonatomic) IBOutlet Bar2TableViewController *bar2VC;
@property (weak, nonatomic) IBOutlet Bar3TableViewController *bar3VC;
@property (weak, nonatomic) IBOutlet Bar4TableViewController *bar4VC;
@property (weak, nonatomic) IBOutlet Bar5TableViewController *bar5VC;
@property (weak, nonatomic) IBOutlet Bar6TableViewController *bar6VC;
@property (weak, nonatomic) IBOutlet Bar7TableViewController *bar7VC;

@property (strong, nonatomic) NSArray *barVCs;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (nonatomic) double previousFrameWidth;

@property (strong, nonatomic) ShareSettings * shareSettings;

-(void)setMeasureBarAccordingToFrame;
-(void)setMeasureBar:(CGFloat)barWidth;
-(void)adjustMeasureBarWidth:(BOOL)animated;

-(void)setEachMeasureBar:(CGFloat)bar1Width;
-(void)setEachMeasureBar:(CGFloat)bar1Width bar2Width:(CGFloat)bar2Width;
-(void)setEachMeasureBar:(CGFloat)bar1Width bar2Width:(CGFloat)bar2Width bar3Width:(CGFloat)bar3Width;
-(void)setEachMeasureBar:(CGFloat)bar1Width bar2Width:(CGFloat)bar2Width bar3Width:(CGFloat)bar3Width bar4Width:(CGFloat)bar4Width;
-(void)setEachMeasureBar:(CGFloat)bar1Width bar2Width:(CGFloat)bar2Width bar3Width:(CGFloat)bar3Width bar4Width:(CGFloat)bar4Width bar5Width:(CGFloat)bar5Width;
-(void)setEachMeasureBar:(CGFloat)bar1Width bar2Width:(CGFloat)bar2Width bar3Width:(CGFloat)bar3Width bar4Width:(CGFloat)bar4Width bar5Width:(CGFloat)bar5Width bar6Width:(CGFloat)bar6Width;


@end

