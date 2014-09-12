//
//  DisplaySettingsContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DisplaySettingsContainerViewController.h"

@interface DisplaySettingsContainerViewController ()

@end

@implementation DisplaySettingsContainerViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
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
