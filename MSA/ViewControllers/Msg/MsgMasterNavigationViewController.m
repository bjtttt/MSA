//
//  MsgMasterNavigationViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-9-11.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgMasterNavigationViewController.h"
#import "MsgMasterTableViewController.h"

@interface MsgMasterNavigationViewController()

@end

@implementation MsgMasterNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    self.msgMasterTVC = [self.viewControllers firstObject];
    self.msgMasterTVC.shareSettings = self.shareSettings;
    self.msgMasterTVC.msgMasterNVC = self;
}

@end
