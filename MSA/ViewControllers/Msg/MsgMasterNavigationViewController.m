//
//  MsgMasterNavigationViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgMasterNavigationViewController.h"

@interface MsgMasterNavigationViewController() {
    //NSMutableArray *_objects;
}
@end

@implementation MsgMasterNavigationViewController

static NSString *msgMasterCellTableId = @"msgMasterTVC";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.statuses = [msaInfo objectForKey:@"statuses"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    self.msgDetaillVC=(MsgDetailNavigationViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
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
}

@end
