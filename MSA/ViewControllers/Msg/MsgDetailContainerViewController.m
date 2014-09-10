//
//  MsgDetailContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgDetailContainerViewController.h"

@interface MsgDetailContainerViewController()

@end

@implementation MsgDetailContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToMsgDetailVC"])
    {
        self.msgDetailTVC = (MsgDetailTableViewController *)segue.destinationViewController;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.navBarHeight=self.msgNavBar.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.msgNavBar.frame = CGRectMake(0, 0, self.frameWidth, self.navBarHeight);
    self.msgV.frame = CGRectMake(0, self.navBarHeight+VC_MARGIN, self.frameWidth, self.frameHeight-self.navBarHeight-VC_MARGIN);
}

#pragma mark - Split view

@end
