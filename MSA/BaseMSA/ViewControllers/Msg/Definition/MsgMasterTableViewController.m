//
//  MsgMasterTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgMasterTableViewController.h"
#import "MsgMasterNavigationViewController.h"
#import "MsgSplitViewController.h"
#import "MsgDetailContainerViewController.h"
#import "MsgDetailNavigationViewController.h"
#import "MsgDetailTableViewController.h"

@interface MsgMasterTableViewController() {
    //NSMutableArray *_objects;
}
@end

@implementation MsgMasterTableViewController

static NSString *msgMasterCellTableId = @"msgMasterTVC";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.statuses = msaInfo[@"statuses"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    //self.msgDetaillCVC=(MsgDetailContainerViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionBottom];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) viewWillAppear:(BOOL)animated{
    self.msgMasterNVC.msgSplitVC.msgDetailCVC.msgDetailNVC.msgDetailTVC.currentStatus = MSG_CURRENT_CONDITIONS;
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
    return [self.statuses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:msgMasterCellTableId forIndexPath:indexPath];
    NSString *status = self.statuses[indexPath.row];
    cell.textLabel.text = status;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *messageType = self.statuses[indexPath.row];
    self.msgMasterNVC.msgSplitVC.msgDetailCVC.msgDetailNVC.msgDetailTVC.currentStatus = (MSGType)indexPath.row;
}

@end
