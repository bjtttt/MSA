//
//  MeasureSelectTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureSelectTableViewController.h"
#import "MeasureSelect2ndTableViewController.h"
#import "MeasureSelectNavigationViewController.h"
#import "UIKeyMeasure.h"
#import "UIKeyView.h"

@interface MeasureSelectTableViewController()

@end

@implementation MeasureSelectTableViewController

static NSString *measureSelectCellTable_SingleView_Id = @"measureSelectCellTable_SingleView";
static NSString *measureSelectCellTable_MultiView_Id = @"measureSelectCellTable_MultiView";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];

    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    
    //NSBundle *bundle = [NSBundle mainBundle];
    //NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
    
    //self.dictModeData = [[NSDictionary alloc] initWithContentsOfFile:path];
    //self.dictMeasureData = [self.dictModeData objectForKey:@"measure"];
    //self.listMeasureData = [self.dictMeasureData allKeys];
    
    //self.title = @"Measurement";
    //self.navigationItem.title = @"Measurement";
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Measurement";
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

#pragma mark - Table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.shareSettings.measureView count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    UIKeyMeasure *meas = [self.shareSettings.measureView objectAtIndex:row];
    NSMutableArray *views = meas.views;
    int viewCount = [views count];
    UITableViewCell *cell;
    if(viewCount > 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:measureSelectCellTable_MultiView_Id forIndexPath:indexPath];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:measureSelectCellTable_SingleView_Id forIndexPath:indexPath];
    }
    if(meas.enabled == YES)
        [cell.textLabel setTextColor:[UIColor blackColor]];
    else
        [cell.textLabel setTextColor:[UIColor lightGrayColor]];
    [cell.textLabel setText:meas.name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    UIKeyMeasure *meas = [self.shareSettings.measureView objectAtIndex:row];
    if(meas.enabled == NO)
    {
        NSMutableString *msg = [[NSMutableString alloc] init];
        [msg appendString:meas.name];
        [msg appendString:@" is not available!"];
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Measurement Selection Error"
                                  message:(NSString *)msg
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showSegueToMeasureSelect2ndTVC"])
    {
        MeasureSelect2ndTableViewController *measureSelect2ndTVC = (MeasureSelect2ndTableViewController *)segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        UIKeyMeasure *meas = [self.shareSettings.measureView objectAtIndex:selectedIndex];
        measureSelect2ndTVC.views = meas.views;
        self.navigationItem.title = meas.name;
        //self.measureSelectNavBar.backBarButtonItem.title = meas.name;
        //UINavigationController *nav = self.navigationController;
        //measureSelect2ndTVC.title = @"Views";//meas.name;
        measureSelect2ndTVC.shareSettings = self.shareSettings;
    }
}

@end
