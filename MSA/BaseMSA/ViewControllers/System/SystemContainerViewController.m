//
//  SystemViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "SystemContainerViewController.h"
#import "SystemSplitViewController.h"

@interface SystemContainerViewController ()

@end

@implementation SystemContainerViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToSystemSplitVC"])
    {
        self.systSplitVC = (SystemSplitViewController *)segue.destinationViewController;
        self.systSplitVC.systCVC = self;
        self.systSplitVC.shareSettings = self.shareSettings;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.navBarHeight=self.systNavBar.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;

    NSLog(@"\nSystem :\nnavBarHeight %f\nframeWidth   %f\nframeHeight  %f", self.navBarHeight, self.frameWidth, self.frameHeight);
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.systNavBar.frame = CGRectMake(0, 0, self.frameWidth, self.navBarHeight);
    self.systVC.frame = CGRectMake(0, self.navBarHeight+VC_MARGIN, self.frameWidth, self.frameHeight-self.navBarHeight-VC_MARGIN);
    
    NSLog(@"\nSystem Navigation Bar :\nx      %f\ny      %f\nwidth  %f\nheight %f", self.systNavBar.frame.origin.x, self.systNavBar.frame.origin.y, self.systNavBar.frame.size.width, self.systNavBar.frame.size.height);
    NSLog(@"\nSystem View Container :\nx      %f\ny      %f\nwidth  %f\nheight %f", self.systVC.frame.origin.x, self.systVC.frame.origin.y, self.systVC.frame.size.width, self.systVC.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (IBAction)hideMsg:(id)sender {
    //[self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)exitToHere:(UIStoryboardSegue *)sender {
    // Nothing to do here
}

@end
