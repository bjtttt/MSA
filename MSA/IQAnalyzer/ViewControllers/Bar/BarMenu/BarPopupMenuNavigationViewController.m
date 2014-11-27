//
//  BarPopupMenuNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarPopupMenuNavigationViewController.h"
#import "BarPopupMenuTableViewController.h"

@interface BarPopupMenuNavigationViewController()

@end

@implementation BarPopupMenuNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.barPopupMenuTVC = [self.viewControllers firstObject];
    self.barPopupMenuTVC.shareSettings = self.shareSettings;
    self.barPopupMenuTVC.barPopupMenuNVC = self;

    self.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
}

#pragma mark - Split view

@end
