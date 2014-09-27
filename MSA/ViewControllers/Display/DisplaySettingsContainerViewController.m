//
//  DisplaySettingsContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ShareSettings.h"
#import "ContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "DisplaySettingsContainerViewController.h"

@interface DisplaySettingsContainerViewController ()

@end

@implementation DisplaySettingsContainerViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // Border Radius
    [self.bar0V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar0V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar0V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar0V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    // Background
    //[self.bar0V.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    
    // Border Radius
    [self.bar1V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar1V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar1V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar1V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar2V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar2V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar2V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar2V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar3V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar3V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar3V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar3V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar4V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar4V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar4V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar4V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar5V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar5V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar5V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar5V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar6V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar6V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar6V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar6V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar7V.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.bar7V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar7V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar7V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    //[self adjustMeasureBarWidth:NO];
    
    self.previousFrameWidth = self.frameWidth;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self setMeasureBarAccordingToFrame];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //[self setMeasureBarAccordingToFrame];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    //[self setMeasureBarAccordingToFrame];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if(self.previousFrameWidth != self.frameWidth)
    {
        [self adjustMeasureBarWidth:YES];
    
        self.previousFrameWidth = self.frameWidth;
    }
    else
        [self setMeasureBarAccordingToFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

-(void)setMeasureBarAccordingToFrame {
    CGFloat width = (self.frameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
    [self setMeasureBar:width];
}

-(void)setMeasureBar:(CGFloat)barWidth {
    self.bar0V.frame = CGRectMake(0, 0, barWidth, MEASBAR_HEIGHT);
    self.bar1V.frame = CGRectMake(barWidth-VC_MARGIN, 0, barWidth, MEASBAR_HEIGHT);
    self.bar2V.frame = CGRectMake(barWidth*2-VC_MARGIN*2, 0, barWidth, MEASBAR_HEIGHT);
    self.bar3V.frame = CGRectMake(barWidth*3-VC_MARGIN*3, 0, barWidth, MEASBAR_HEIGHT);
    self.bar4V.frame = CGRectMake(barWidth*4-VC_MARGIN*4, 0, barWidth, MEASBAR_HEIGHT);
    self.bar5V.frame = CGRectMake(barWidth*5-VC_MARGIN*5, 0, barWidth, MEASBAR_HEIGHT);
    self.bar6V.frame = CGRectMake(barWidth*6-VC_MARGIN*6, 0, barWidth, MEASBAR_HEIGHT);
    if(self.frameWidth == self.displayCVC.mainCVC.frameWidth)
        self.bar7V.frame = CGRectMake(barWidth*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*7, MEASBAR_HEIGHT);
    else
        self.bar7V.frame = CGRectMake(barWidth*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*6, MEASBAR_HEIGHT);
}

-(void)adjustMeasureBarWidth:(BOOL)animated {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    CGFloat width = (self.previousFrameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
    [self setMeasureBar:width];

    layoutBlock = ^(void)
    {
        CGFloat width = (self.frameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
        [self setMeasureBar:width];
    };
    completionBlock = ^(BOOL finished){
    };
    
    if (animated)
    {
        [UIView animateWithDuration:0.25
         //delay:0
         //options:UIViewAnimationOptionLayoutSubviews
                         animations:layoutBlock
                         completion:completionBlock];
    }
    else
    {
        layoutBlock();
        completionBlock(YES);
    }
}

@end
