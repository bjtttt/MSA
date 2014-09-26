//
//  DisplaySettingsContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ShareSettings.h"
#import "DisplaySettingsContainerViewController.h"

@interface DisplaySettingsContainerViewController ()

@end

@implementation DisplaySettingsContainerViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // Border Radius
    [self.bar0V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar0V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar0V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar0V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    // Background
    [self.bar0V.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    
    // Border Radius
    [self.bar1V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar1V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar1V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar1V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar2V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar2V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar2V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar2V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar3V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar3V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar3V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar3V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar4V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar4V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar4V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar4V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar5V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar5V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar5V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar5V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar6V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar6V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar6V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar6V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    // Border Radius
    [self.bar7V.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.bar7V.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    // Border
    [self.bar7V.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.bar7V.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //self.tabBar.frame=CGRectMake(0, self.tabBar.frame.origin.y,self.tabBar.frame.size.width,self.tabBar.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

@end
