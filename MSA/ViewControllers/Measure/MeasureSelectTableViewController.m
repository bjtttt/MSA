//
//  MeasureSelectTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureSelectTableViewController.h"
#import "MeasureSelectNavigationViewController.h"

@interface MeasureSelectTableViewController()

@end

@implementation MeasureSelectTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

#pragma mark - Split view

@end
