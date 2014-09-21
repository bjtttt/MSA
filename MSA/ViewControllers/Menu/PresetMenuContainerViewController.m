//
//  PresetMenuContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresetMenuContainerViewController.h"
#import "MenuContainerViewController.h"
#import "PresetMenuTableViewController.h"

@interface PresetMenuContainerViewController()

@end

@implementation PresetMenuContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToPresetMenuTVC"])
    {
        self.presetMenuTVC = (PresetMenuTableViewController *)segue.destinationViewController;
        self.presetMenuTVC.shareSettings = self.shareSettings;
        self.presetMenuTVC.presetMenuCVC = self;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.presetMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
