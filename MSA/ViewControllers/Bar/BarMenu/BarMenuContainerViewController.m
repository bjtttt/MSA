//
//  PresetMenuContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarMenuContainerViewController.h"
#import "ContainerViewController.h"
#import "BarMenuTableViewController.h"

@interface BarMenuContainerViewController()

@end

@implementation BarMenuContainerViewController

-(void)viewDidLoad{
    NSLog(@"PresetMenuContainerViewController - viewDidLoad");

    [super viewDidLoad];

    NSLog(@"\nPresetMenu Container View Controller:\nx = %f\ny = %f\nwidth = %f\nheight = %f",
          self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"PresetMenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToBarMenuTVC"])
    {
        self.barMenuTVC = (BarMenuTableViewController *)segue.destinationViewController;
        self.barMenuTVC.shareSettings = self.shareSettings;
        self.barMenuTVC.barMenuCVC = self;
        
        self.barMenuTVC.frameWidth = self.frameWidth;
        self.barMenuTVC.frameHeight = self.frameHeight;
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

- (IBAction)cancelBarPopupMenu:(id)sender {
    self.shareSettings.barTapped = !self.shareSettings.barTapped;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"barTapped" object:nil];
}

@end
