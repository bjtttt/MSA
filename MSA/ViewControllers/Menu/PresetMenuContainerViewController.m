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
    NSLog(@"PresetMenuContainerViewController - viewDidLoad");

    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"PresetMenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToPresetMenuTVC"])
    {
        self.presetMenuTVC = (PresetMenuTableViewController *)segue.destinationViewController;
        self.presetMenuTVC.shareSettings = self.shareSettings;
        self.presetMenuTVC.presetMenuCVC = self;
        
        self.presetMenuTVC.frameWidth = self.frameWidth;
        self.presetMenuTVC.frameHeight = self.frameHeight;
    }
}

-(void)viewWillLayoutSubviews {
    NSLog(@"PresetMenuContainerViewController - viewWillLayoutSubviews");

    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    NSLog(@"PresetMenuContainerViewController - viewDidLayoutSubviews");

    [super viewDidLayoutSubviews];
    
    //self.presetMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
