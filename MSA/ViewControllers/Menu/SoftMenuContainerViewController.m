//
//  SoftMenuContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoftMenuContainerViewController.h"
#import "SoftMenuNavigationViewController.h"

@interface SoftMenuContainerViewController()

@end

@implementation SoftMenuContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"SoftMenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToSoftMenuNVC"])
    {
        self.softMenuNVC = (SoftMenuNavigationViewController *)segue.destinationViewController;
        self.softMenuNVC.shareSettings = self.shareSettings;
        self.softMenuNVC.softMenuCVC = self;
        
        self.softMenuNVC.frameWidth = self.frameWidth;
        self.softMenuNVC.frameHeight = self.frameHeight;
    }
}

-(void)viewWillLayoutSubviews {
    NSLog(@"SoftMenuContainerViewController - viewWillLayoutSubviews");

    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    NSLog(@"SoftMenuContainerViewController - viewDidLayoutSubviews");

    [super viewDidLayoutSubviews];
    
    //self.softMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
