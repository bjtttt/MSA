//
//  SystemMasterNavigationViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-9-11.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemMasterNavigationViewController.h"
#import "SystemMasterTableViewController.h"

@interface SystemMasterNavigationViewController()

@end

@implementation SystemMasterNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    self.systMasterTVC = [self.viewControllers firstObject];
    self.systMasterTVC.shareSettings = self.shareSettings;
    self.systMasterTVC.systMasterNVC = self;
}

@end
