//
//  SystemDetailContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemDetailContainerViewController.h"
#import "SystemDetailNavigationViewController.h"

@interface SystemDetailContainerViewController()

@end

@implementation SystemDetailContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToSystemDetailNVC"])
    {
        self.systDetailNVC = (SystemDetailNavigationViewController *)segue.destinationViewController;
        self.systDetailNVC.shareSettings = self.shareSettings;
        self.systDetailNVC.systDetailCVC = self;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.msgV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
