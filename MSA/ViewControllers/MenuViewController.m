//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.layer.borderWidth = BORDER_WIDTH;
    //self.view.layer.borderColor = [[UIColor blackColor] CGColor];
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
