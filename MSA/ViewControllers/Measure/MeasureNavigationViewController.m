//
//  MeasureNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureNavigationViewController.h"
#import "MeasureTableViewController.h"

@interface MeasureNavigationViewController()

@end

@implementation MeasureNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.measureTVC = [self.viewControllers firstObject];
    self.measureTVC.shareSettings = self.shareSettings;
    self.measureTVC.measureNVC = self;
}

#pragma mark - Split view

@end
