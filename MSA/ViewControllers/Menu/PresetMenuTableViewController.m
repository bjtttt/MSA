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

static NSString *presetMenuCellTableId = @"presetMenuTVC";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.preset = [msaInfo objectForKey:@"preset"];//[0];
    //self.presetUser = [msaInfo objectForKey:@"preset"][1];
    //self.presetAllModes = [msaInfo objectForKey:@"preset"][2];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.preset count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.preset[section];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTableId forIndexPath:indexPath];
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    cell.textLabel.text = self.preset[section][row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *messageType = self.statuses[indexPath.row];
    //self.systMasterNVC.systSplitVC.systDetailCVC.systDetailNVC.systDetailTVC.currentSystem = (SYSTType)indexPath.row;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(section == 0)
//        return @"";
//    else
//        return @"";
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return CGFLOAT_MIN;
    else
        return tableView.sectionHeaderHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        UIView *uiv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frameWidth, 0)];
        return uiv;
    }
    
    return nil;
}

@end
