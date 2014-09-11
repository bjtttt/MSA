//
//  MsgDetailNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgDetailNavigationViewController.h"
#import "MsgDetailTableViewController.h"

@interface MsgDetailNavigationViewController()

@end

@implementation MsgDetailNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.msgDetailTVC = [self.viewControllers firstObject];
    self.msgDetailTVC.shareSettings = self.shareSettings;
    self.msgDetailTVC.msgDetailNVC = self;
}

#pragma mark - Split view

@end
