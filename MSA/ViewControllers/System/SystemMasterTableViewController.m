//
//  MsgMasterTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemMasterTableViewController.h"
#import "SystemMasterNavigationViewController.h"
#import "SystemSplitViewController.h"
#import "SystemDetailContainerViewController.h"
#import "SystemDetailNavigationViewController.h"
#import "SystemDetailTableViewController.h"

@interface SystemMasterTableViewController() {
    //NSMutableArray *_objects;
}
@end

@implementation SystemMasterTableViewController

static NSString *systMasterCellTableId = @"systMasterTVC";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    //self.msgDetaillCVC=(MsgDetailContainerViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionBottom];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) viewWillAppear:(BOOL)animated{
    self.systMasterNVC.systSplitVC.systDetailCVC.systDetailNVC.systDetailTVC.currentSystem = SYST_SYSTEM;

    //[self.tableView.tableHeaderView removeFromSuperview];
    //self.tableView.tableHeaderView=nil;
    //[self.tableView reloadData];
}

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.systems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:systMasterCellTableId forIndexPath:indexPath];
    NSString *status = self.systems[indexPath.row];
    cell.textLabel.text = status;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *messageType = self.statuses[indexPath.row];
    self.systMasterNVC.systSplitVC.systDetailCVC.systDetailNVC.systDetailTVC.currentSystem = (SYSTType)indexPath.row;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.0;
//}

@end
