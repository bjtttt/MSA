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

}

#pragma mark - Split view

@end
