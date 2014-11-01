//
//  SoftMenuTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoftMenuTableViewController.h"

@interface SoftMenuTableViewController()

@end

@implementation SoftMenuTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //[self.tableView setBackgroundColor:[UIColor whiteColor]];

    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
   
    //NSLog(@"\nSoftMenuTableViewController - SoftMenu View :\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.frameWidth, self.frameHeight);
    
    //NSLog(@"\nPresetMenu Table View Controller - viewDidAppear:\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - Split view

@end
