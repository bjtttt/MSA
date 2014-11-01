//
//  SoftMenuNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoftMenuNavigationViewController.h"
#import "SoftMenuTableViewController.h"

@interface SoftMenuNavigationViewController()

@end

@implementation SoftMenuNavigationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.softMenuTVC = [self.viewControllers firstObject];
    self.softMenuTVC.shareSettings = self.shareSettings;
    self.softMenuTVC.softMenuNVC = self;

    //self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
    //self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.frameWidth, self.frameHeight);
}

/*
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.frameWidth, self.frameHeight);
    
    NSLog(@"\nSoftMenuNavigationViewController - viewDidAppear:\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}
*/

#pragma mark - Split view

@end
