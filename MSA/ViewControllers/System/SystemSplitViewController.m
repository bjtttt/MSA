//
//  SystemSplitViewController.m
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "SystemSplitViewController.h"
#import "SystemMasterNavigationViewController.h"
#import "SystemDetailContainerViewController.h"

@interface SystemSplitViewController ()

@end

@implementation SystemSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.systMasterNVC = [self.viewControllers firstObject];
    self.systDetailCVC = [self.viewControllers lastObject];
    
    self.systMasterNVC.systSplitVC = self;
    self.systMasterNVC.shareSettings = self.shareSettings;
    
    self.systDetailCVC.systSplitVC = self;
    self.systDetailCVC.shareSettings = self.shareSettings;
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

@end
