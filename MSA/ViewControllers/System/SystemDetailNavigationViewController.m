//
//  SystemDetailNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemDetailNavigationViewController.h"
#import "SystemDetailTableViewController.h"

@interface SystemDetailNavigationViewController()

@end

@implementation SystemDetailNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.systDetailTVC = [self.viewControllers firstObject];
    self.systDetailTVC.shareSettings = self.shareSettings;
    self.systDetailTVC.systDetailNVC = self;
}

#pragma mark - Split view

@end
