//
//  SoftMenuTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar0TableViewController.h"

@interface Bar0TableViewController()

@end

@implementation Bar0TableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) setIsContinouse:(BOOL)isContinouse {
    
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

#pragma mark - Split view

@end
