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
    //NSLog(@"PresetMenuContainerViewController - viewDidLoad");

    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];

    //NSLog(@"\nPresetMenu Container View Controller:\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"PresetMenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToPresetMenuTVC"])
    {
        self.presetMenuTVC = (PresetMenuTableViewController *)segue.destinationViewController;
        self.presetMenuTVC.shareSettings = self.shareSettings;
        self.presetMenuTVC.presetMenuCVC = self;
        
        //self.presetMenuTVC.view.frame = CGRectMake(0, NAVBAR_HEIGHT, self.frameWidth, self.frameHeight-NAVBAR_HEIGHT);
        
        self.presetMenuTVC.frameWidth = self.frameWidth;
        self.presetMenuTVC.frameHeight = self.frameHeight;
    }
}

-(void)viewWillLayoutSubviews {
    //NSLog(@"PresetMenuContainerViewController - viewWillLayoutSubviews");

    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    //NSLog(@"PresetMenuContainerViewController - viewDidLayoutSubviews");

    [super viewDidLayoutSubviews];
    
    //self.presetMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
