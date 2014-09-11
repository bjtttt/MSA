//
//  MsgSplitViewController.m
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MsgSplitViewController.h"
#import "MsgMasterNavigationViewController.h"
#import "MsgDetailContainerViewController.h"

//@interface MsgSplitViewController ()
//
//@end

@implementation MsgSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.msgMasterNVC = [self.viewControllers firstObject];
    self.msgDetailCVC = [self.viewControllers lastObject];
    
    self.msgMasterNVC.msgSplitVC = self;
    self.msgMasterNVC.shareSettings = self.shareSettings;
    
    self.msgDetailCVC.msgSplitVC = self;
    self.msgDetailCVC.shareSettings = self.shareSettings;
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

@end
