//
//  SystemDetailContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureContainerViewController.h"
#import "MeasureNavigationViewController.h"

@interface MeasureContainerViewController()

@end

@implementation MeasureContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToMeasureNVC"])
    {
        self.measureNVC = (MeasureNavigationViewController *)segue.destinationViewController;
        self.measureNVC.shareSettings = self.shareSettings;
        self.measureNVC.measureCVC = self;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.measureV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
