//
//  SoftMenuTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar0TableViewController.h"
#import "Bar0SingleContinousTableViewCell.h"
#import "BarPopupMenuTableViewController.h"
#import "DisplayContainerViewController.h"
#import "MeasureBarContainerViewController.h"
#import "MainContainerViewController.h"

@interface Bar0TableViewController()

@end

@implementation Bar0TableViewController

static NSString *barPMenuTVC_Single_Continous_Id = @"barPMenuTVC_Single_Continous";
static NSString *barPMenuTVC_One_Line_Id = @"barPMenuTVC_One_Line";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setIsContinouse:(BOOL)isContinouse {
//
//}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger row = [indexPath row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:barPMenuTVC_Single_Continous_Id forIndexPath:indexPath];
    [((Bar0SingleContinousTableViewCell *)cell).singleContinousImgV setImage:[UIImage imageNamed:@"Continous.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.shareSettings.barTappedIndex = 0;
    //self.shareSettings.barTapped = !self.shareSettings.barTapped;

    //[[NSNotificationCenter defaultCenter] postNotificationName:@"barTapped" object:nil];
    
    //[self.barPopupMenuTVC becomeFirstResponder];
    //self.measureBarCVC.displayCVC.mainCVC.view.window
}

-(BOOL)resignFirstResponder
{
    return [super resignFirstResponder];
}

-(BOOL)becomeFirstResponder
{
    return [super becomeFirstResponder];
}

#pragma mark - Split view

@end
