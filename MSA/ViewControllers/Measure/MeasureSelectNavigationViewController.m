//
//  MeasureSelectNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureSelectNavigationViewController.h"
#import "MeasureContainerViewController.h"
#import "MeasureSelectTableViewController.h"

@interface MeasureSelectNavigationViewController()

@end

@implementation MeasureSelectNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.measureSelectTVC = [self.viewControllers firstObject];
    self.measureSelectTVC.shareSettings = self.shareSettings;
    self.measureSelectTVC.measureSelectNVC = self;
    
    self.measureSelectTVC.frameWidth = self.frameWidth;
    self.measureSelectTVC.frameHeight = self.frameHeight;
}

#pragma mark - Split view

@end
