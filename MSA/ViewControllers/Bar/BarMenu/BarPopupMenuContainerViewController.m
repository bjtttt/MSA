//
//  BarPopupMenuContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarPopupMenuContainerViewController.h"
#import "BarPopupMenuNavigationViewController.h"

@interface BarPopupMenuContainerViewController()

@end

@implementation BarPopupMenuContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToBarPopupMenuCVC"])
    {
        self.barPopupMenuNVC = (BarPopupMenuNavigationViewController *)segue.destinationViewController;
        self.barPopupMenuNVC.shareSettings = self.shareSettings;
        self.barPopupMenuNVC.barPopupMenuCVC = self;
        
        self.barPopupMenuNVC.frameWidth = self.frameWidth;
        self.barPopupMenuNVC.frameHeight = self.frameHeight;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - Split view

@end
