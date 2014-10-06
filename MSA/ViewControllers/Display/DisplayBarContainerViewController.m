//
//  DisplayBarContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ShareSettings.h"
#import "ContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "DisplayBarContainerViewController.h"
#import "Bar0TableViewController.h"
#import "Bar1TableViewController.h"
#import "Bar2TableViewController.h"
#import "Bar3TableViewController.h"
#import "Bar4TableViewController.h"
#import "Bar5TableViewController.h"
#import "Bar6TableViewController.h"
#import "Bar7TableViewController.h"

@interface DisplayBarContainerViewController ()

@end

@implementation DisplayBarContainerViewController
            
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToBar0VC"])
    {
        self.bar0VC = (Bar0TableViewController *)segue.destinationViewController;
        self.bar0VC.shareSettings = self.shareSettings;
        self.bar0VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar1VC"])
    {
        self.bar0VC = (Bar0TableViewController *)segue.destinationViewController;
        self.bar0VC.shareSettings = self.shareSettings;
        self.bar0VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar2VC"])
    {
        self.bar2VC = (Bar2TableViewController *)segue.destinationViewController;
        self.bar2VC.shareSettings = self.shareSettings;
        self.bar2VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar3VC"])
    {
        self.bar3VC = (Bar3TableViewController *)segue.destinationViewController;
        self.bar3VC.shareSettings = self.shareSettings;
        self.bar3VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar4VC"])
    {
        self.bar4VC = (Bar4TableViewController *)segue.destinationViewController;
        self.bar4VC.shareSettings = self.shareSettings;
        self.bar4VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar5VC"])
    {
        self.bar5VC = (Bar5TableViewController *)segue.destinationViewController;
        self.bar5VC.shareSettings = self.shareSettings;
        self.bar5VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar6VC"])
    {
        self.bar6VC = (Bar6TableViewController *)segue.destinationViewController;
        self.bar6VC.shareSettings = self.shareSettings;
        self.bar6VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar7VC"])
    {
        self.bar7VC = (Bar7TableViewController *)segue.destinationViewController;
        self.bar7VC.shareSettings = self.shareSettings;
        self.bar7VC.displayBarCVC = self;
    }
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
    NSAssert1(self.shareSettings.measureBarCount > 0 && self.shareSettings.measureBarCount <= 6, @"barCount should be > 0 and <= 6 but it is %d", self.shareSettings.measureBarCount);
    
    CGFloat width = 0.0f;
    
    if(self.shareSettings.showTrace == YES)
        width = (self.frameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
    else
        width = (self.frameWidth - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
    
    [self setMeasureBar:width];
}

-(void)setMeasureBar:(CGFloat)barWidth {
    NSAssert1(self.shareSettings.measureBarCount > 0 && self.shareSettings.measureBarCount <= 6, @"barCount should be > 0 and <= 6 but it is %d", self.shareSettings.measureBarCount);
    
    self.bar0V.frame = CGRectMake(0, 0, MEASBAR_MEAS_CTRL_WIDTH, MEASBAR_HEIGHT);
    self.bar0VC.frameWidth = MEASBAR_MEAS_CTRL_WIDTH;
    self.bar0VC.frameHeight = MEASBAR_HEIGHT;
    self.bar1V.frame = CGRectMake(MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
    self.bar1VC.frameWidth = barWidth;
    self.bar1VC.frameHeight = MEASBAR_HEIGHT;
    if(self.shareSettings.measureBarCount > 1)
    {
        self.bar2V.frame = CGRectMake(barWidth*1+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar2VC.frameWidth = barWidth;
        self.bar2VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar2V.frame = CGRectMake(barWidth*1+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    if (self.shareSettings.measureBarCount > 2)
    {
        self.bar3V.frame = CGRectMake(barWidth*2+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar3VC.frameWidth = barWidth;
        self.bar3VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar3V.frame = CGRectMake(barWidth*2+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    if (self.shareSettings.measureBarCount > 3)
    {
        self.bar4V.frame = CGRectMake(barWidth*3+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar4VC.frameWidth = barWidth;
        self.bar4VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar4V.frame = CGRectMake(barWidth*3+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    if (self.shareSettings.measureBarCount > 4)
    {
        self.bar5V.frame = CGRectMake(barWidth*4+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar5VC.frameWidth = barWidth;
        self.bar5VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar5V.frame = CGRectMake(barWidth*4+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    if (self.shareSettings.measureBarCount > 5)
    {
        if(self.shareSettings.showTrace == YES)
            self.bar6V.frame = CGRectMake(barWidth*5+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        else
        {
            if(self.shareSettings.menuDisplayed == YES)
                self.bar6V.frame = CGRectMake(barWidth*5+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*0, MEASBAR_HEIGHT);
            else
                self.bar6V.frame = CGRectMake(barWidth*5+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        }
        self.bar6VC.frameWidth = barWidth;
        self.bar6VC.frameHeight = MEASBAR_HEIGHT;
    }
    if(self.shareSettings.showTrace == YES)
    {
        if(self.frameWidth == self.displayCVC.mainCVC.frameWidth)
        {
            self.bar7V.frame = CGRectMake(barWidth*self.shareSettings.measureBarCount+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, MEASBAR_TRACE_WIDTH+VC_MARGIN*7, MEASBAR_HEIGHT);
            self.bar7VC.frameWidth = MEASBAR_TRACE_WIDTH+VC_MARGIN*7;
            self.bar7VC.frameHeight = MEASBAR_HEIGHT;
        }
        else
        {
            self.bar7V.frame = CGRectMake(barWidth*self.shareSettings.measureBarCount+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, MEASBAR_TRACE_WIDTH+VC_MARGIN*6, MEASBAR_HEIGHT);
            self.bar7VC.frameWidth = MEASBAR_TRACE_WIDTH+VC_MARGIN*6;
            self.bar7VC.frameHeight = MEASBAR_HEIGHT;
        }
    }
    else
        self.bar7V.frame = CGRectMake(barWidth*self.shareSettings.measureBarCount+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, 0, 0);
}

-(void)adjustMeasureBarWidth:(BOOL)animated {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    CGFloat width = 0.0f;
    if(self.shareSettings.showTrace == YES)
        width = (self.previousFrameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
    else
        width = (self.previousFrameWidth - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
    [self setMeasureBar:width];

    layoutBlock = ^(void)
    {
        CGFloat width = 0.0f;
        if(self.shareSettings.showTrace == YES)
            width = (self.frameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
        else
            width = (self.frameWidth - MEASBAR_MEAS_CTRL_WIDTH) / self.shareSettings.measureBarCount;
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
