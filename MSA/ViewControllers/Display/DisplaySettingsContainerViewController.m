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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //[self adjustMeasureBarWidth:NO];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if(self.previousFrameWidth != self.frameWidth)
    {
        [self adjustMeasureBarWidth:YES];
    
        self.previousFrameWidth = self.frameWidth;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

-(void)adjustMeasureBarWidth:(BOOL)animated {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    CGFloat previosWidth = (self.previousFrameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;

    self.bar0V.frame = CGRectMake(0, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar1V.frame = CGRectMake(previosWidth-VC_MARGIN, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar2V.frame = CGRectMake(previosWidth*2-VC_MARGIN*2, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar3V.frame = CGRectMake(previosWidth*3-VC_MARGIN*3, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar4V.frame = CGRectMake(previosWidth*4-VC_MARGIN*4, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar5V.frame = CGRectMake(previosWidth*5-VC_MARGIN*5, 0, previosWidth, MEASBAR_HEIGHT);
    self.bar6V.frame = CGRectMake(previosWidth*6-VC_MARGIN*6, 0, previosWidth, MEASBAR_HEIGHT);
    if(self.frameWidth == self.displayCVC.mainCVC.frameWidth)
        self.bar7V.frame = CGRectMake(previosWidth*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*7, MEASBAR_HEIGHT);
    else
        self.bar7V.frame = CGRectMake(previosWidth*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*6, MEASBAR_HEIGHT);

    CGFloat width = (self.frameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
    
    layoutBlock = ^(void)
    {
        self.bar0V.frame = CGRectMake(0, 0, width, MEASBAR_HEIGHT);
        self.bar1V.frame = CGRectMake(width-VC_MARGIN, 0, width, MEASBAR_HEIGHT);
        self.bar2V.frame = CGRectMake(width*2-VC_MARGIN*2, 0, width, MEASBAR_HEIGHT);
        self.bar3V.frame = CGRectMake(width*3-VC_MARGIN*3, 0, width, MEASBAR_HEIGHT);
        self.bar4V.frame = CGRectMake(width*4-VC_MARGIN*4, 0, width, MEASBAR_HEIGHT);
        self.bar5V.frame = CGRectMake(width*5-VC_MARGIN*5, 0, width, MEASBAR_HEIGHT);
        self.bar6V.frame = CGRectMake(width*6-VC_MARGIN*6, 0, width, MEASBAR_HEIGHT);
        if(self.frameWidth == self.displayCVC.mainCVC.frameWidth)
            self.bar7V.frame = CGRectMake(width*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*7, MEASBAR_HEIGHT);
        else
            self.bar7V.frame = CGRectMake(width*7-VC_MARGIN*7, 0, MEASBAR_SINGLE_WIDTH+VC_MARGIN*6, MEASBAR_HEIGHT);
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
