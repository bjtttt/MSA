//
//  MsgContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MsgContainerViewController.h"
#import "MsgSplitViewController.h"

@interface MsgContainerViewController ()

@end

@implementation MsgContainerViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.msgSplitVC.delegate=(id)self.msgMasterNavVC.topViewController;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToMsgSplitVC"])
    {
        self.msgSplitVC = (MsgSplitViewController *)segue.destinationViewController;
        self.msgSplitVC.msgCVC = self;
        self.msgSplitVC.shareSettings = self.shareSettings;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.navBarHeight=self.msgNavBar.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
    
    NSLog(@"\nMessage :\nnavBarHeight %f\nframeWidth   %f\nframeHeight  %f", self.navBarHeight, self.frameWidth, self.frameHeight);
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.msgNavBar.frame = CGRectMake(0, 0, self.frameWidth, self.navBarHeight);
    self.msgV.frame = CGRectMake(0, self.navBarHeight+VC_MARGIN, self.frameWidth, self.frameHeight-self.navBarHeight-VC_MARGIN);
    
    NSLog(@"\nMessgae Navigation Bar :\nx      %f\ny      %f\nwidth  %f\nheight %f", self.msgNavBar.frame.origin.x, self.msgNavBar.frame.origin.y, self.msgNavBar.frame.size.width, self.msgNavBar.frame.size.height);
    NSLog(@"\nMessage View Container :\nx      %f\ny      %f\nwidth  %f\nheight %f", self.msgV.frame.origin.x, self.msgV.frame.origin.y, self.msgV.frame.size.width, self.msgV.frame.size.height);
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
