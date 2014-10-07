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
    
    self.barVs = [[NSArray alloc] initWithObjects:self.bar0V, self.bar1V, self.bar2V, self.bar3V, self.bar4V, self.bar5V, self.bar6V, self.bar7V, nil];
    self.barVCs = [[NSArray alloc] initWithObjects:self.bar0VC, self.bar1VC, self.bar2VC, self.bar3VC, self.bar4VC, self.bar5VC, self.bar6VC, self.bar7VC, nil];
    
    for(UIView *bv in self.barVs)
    {
        // Border Radius
        [bv.layer setCornerRadius:LIGHT_CORNER_RADIUS];
        [bv.layer setMasksToBounds:YES];
        //[self.measureView setClipsToBounds:YES];
        // Border
        [bv.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [bv.layer setBorderWidth:NORMAL_BORDER_WIDTH];
        // Background
        //[self.bar0V.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    }
    
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
    CGFloat width = 0.0f;
    
    if(self.shareSettings.showTrace == YES)
        width = self.frameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH;
    else
        width = self.frameWidth - MEASBAR_MEAS_CTRL_WIDTH;
    
    [self setMeasureBar:width];
}

-(void)setMeasureBar:(CGFloat)width {
    self.bar0V.frame = CGRectMake(0, 0, MEASBAR_MEAS_CTRL_WIDTH, MEASBAR_HEIGHT);
    self.bar0VC.frameWidth = MEASBAR_MEAS_CTRL_WIDTH;
    self.bar0VC.frameHeight = MEASBAR_HEIGHT;
    
    if(self.shareSettings.useBarRatio == YES)
        [self setResizableBarWidth:width sizeArray:self.shareSettings.barRatios];
    else
    {
        if(self.shareSettings.barResizable == YES)
        {
            if(self.shareSettings.menuDisplayed == YES)
                [self setResizableBarWidth:width sizeArray:self.shareSettings.barWidthsWithMenu];
            else
                [self setResizableBarWidth:width sizeArray:self.shareSettings.barWidths];
        }
        else
        {
            NSAssert(self.shareSettings.barResizable == YES, @"Bar Resiable is %d", self.shareSettings.barResizable);
        }
    }
}

-(void) setResizableBarWidth:(CGFloat)width sizeArray:(NSArray *)sizeArray
{
    CGFloat total = 0;
    for(NSNumber *num in sizeArray)
    {
        total = total + [num floatValue];
    }

    CGFloat barWidth = [[self.shareSettings.barRatios objectAtIndex:0] floatValue] * width / total;
    
    self.bar1V.frame = CGRectMake(MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
    self.bar1VC.frameWidth = barWidth;
    self.bar1VC.frameHeight = MEASBAR_HEIGHT;
    
    barWidth = [[self.shareSettings.barRatios objectAtIndex:1] floatValue] * width / total;
    
    if(self.shareSettings.measureBarCount > 1)
    {
        self.bar2V.frame = CGRectMake(barWidth*1+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar2VC.frameWidth = barWidth;
        self.bar2VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar2V.frame = CGRectMake(barWidth*1+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    
    barWidth = [[self.shareSettings.barRatios objectAtIndex:2] floatValue] * width / total;
    
    if (self.shareSettings.measureBarCount > 2)
    {
        self.bar3V.frame = CGRectMake(barWidth*2+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar3VC.frameWidth = barWidth;
        self.bar3VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar3V.frame = CGRectMake(barWidth*2+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    
    barWidth = [[self.shareSettings.barRatios objectAtIndex:3] floatValue] * width / total;
    
    if (self.shareSettings.measureBarCount > 3)
    {
        self.bar4V.frame = CGRectMake(barWidth*3+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar4VC.frameWidth = barWidth;
        self.bar4VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar4V.frame = CGRectMake(barWidth*3+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    
    barWidth = [[self.shareSettings.barRatios objectAtIndex:4] floatValue] * width / total;
    
    if (self.shareSettings.measureBarCount > 4)
    {
        self.bar5V.frame = CGRectMake(barWidth*4+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, barWidth+VC_MARGIN*1, MEASBAR_HEIGHT);
        self.bar5VC.frameWidth = barWidth;
        self.bar5VC.frameHeight = MEASBAR_HEIGHT;
    }
    else
        self.bar5V.frame = CGRectMake(barWidth*4+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    
    barWidth = [[self.shareSettings.barRatios objectAtIndex:5] floatValue] * width / total;
    
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
    else
        self.bar6V.frame = CGRectMake(barWidth*5+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*1, 0, 0, 0);
    
    if(self.shareSettings.showTrace == YES)
    {
        if(self.frameWidth == self.displayCVC.mainCVC.frameWidth)
        {
            self.bar7V.frame = CGRectMake(width+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, MEASBAR_TRACE_WIDTH+VC_MARGIN*7, MEASBAR_HEIGHT);
            self.bar7VC.frameWidth = MEASBAR_TRACE_WIDTH+VC_MARGIN*7;
            self.bar7VC.frameHeight = MEASBAR_HEIGHT;
        }
        else
        {
            self.bar7V.frame = CGRectMake(width+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, MEASBAR_TRACE_WIDTH+VC_MARGIN*6, MEASBAR_HEIGHT);
            self.bar7VC.frameWidth = MEASBAR_TRACE_WIDTH+VC_MARGIN*6;
            self.bar7VC.frameHeight = MEASBAR_HEIGHT;
        }
    }
    else
        self.bar7V.frame = CGRectMake(width+MEASBAR_MEAS_CTRL_WIDTH-VC_MARGIN*7, 0, 0, 0);
    
}

-(void)adjustMeasureBarWidth:(BOOL)animated {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    CGFloat width = 0.0f;
    if(self.shareSettings.showTrace == YES)
        width = self.previousFrameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH;
    else
        width = self.previousFrameWidth - MEASBAR_MEAS_CTRL_WIDTH;
    [self setMeasureBar:width];

    layoutBlock = ^(void)
    {
        CGFloat width = 0.0f;
        if(self.shareSettings.showTrace == YES)
            width = self.frameWidth - MEASBAR_TRACE_WIDTH - MEASBAR_MEAS_CTRL_WIDTH;
        else
            width = self.frameWidth - MEASBAR_MEAS_CTRL_WIDTH;
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