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
    
    self.softMenuTVC = [self.viewControllers firstObject];
    self.softMenuTVC.shareSettings = self.shareSettings;
    self.softMenuTVC.softMenuNVC = self;
}

#pragma mark - Split view

@end
