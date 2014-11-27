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

    //self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"SoftMenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToSoftMenuNVC"])
    {
        self.softMenuNVC = (SoftMenuNavigationViewController *)segue.destinationViewController;
        self.softMenuNVC.shareSettings = self.shareSettings;
        self.softMenuNVC.softMenuCVC = self;
        
        self.softMenuNVC.frameWidth = self.frameWidth;
        self.softMenuNVC.frameHeight = self.frameHeight;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.softMenuV.frame = CGRectMake(self.softMenuV.frame.origin.x, self.softMenuV.frame.origin.y, self.frameWidth, self.frameHeight);
    
    //NSLog(@"\nSoftMenuNavigationViewController - viewDidAppear:\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)viewWillLayoutSubviews {
    //NSLog(@"SoftMenuContainerViewController - viewWillLayoutSubviews");

    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    NSLog(@"SoftMenuContainerViewController - viewDidLayoutSubviews");

    [super viewDidLayoutSubviews];
    
    //self.softMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

-(void)setSoftMenuFrame
{
    //self.softMenuV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
