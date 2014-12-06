//
//  MsgDetailTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgDetailTableViewController.h"

@interface MsgDetailTableViewController()

@end

@implementation MsgDetailTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.statuses = msaInfo[@"statuses"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) setCurrentStatus:(MSGType)currentStatus{
    self.title = self.statuses[currentStatus];
}

#pragma mark - Split view

@end
