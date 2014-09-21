//
//  PresetMenuTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresetMenuTableViewController.h"

@interface PresetMenuTableViewController()

@end

@implementation PresetMenuTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.preset = [msaInfo objectForKey:@"preset"][0];
    self.presetUser = [msaInfo objectForKey:@"preset"][1];
    self.presetAllModes = [msaInfo objectForKey:@"preset"][2];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

#pragma mark - Split view

@end
