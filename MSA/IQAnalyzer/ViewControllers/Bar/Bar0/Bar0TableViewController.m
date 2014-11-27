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

static NSString *barPopupMenuTVC_Single_Continous_Id = @"BarPopupMenuTVC_Single_Continous";
static NSString *barPopupMenuTVC_One_Line_Id = @"BarPopupMenuTVC_One_Line";
static NSString *barPopupMenuTVC_One_Line_Orange_Id = @"BarPopupMenuTVC_One_Line_Orange";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    //self.view.backgroundColor = [UIColor colorWithRed:77.0f/255.0f green:77.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:barPopupMenuTVC_Single_Continous_Id forIndexPath:indexPath];
    [((Bar0SingleContinousTableViewCell *)cell).singleContinousImgV setImage:[UIImage imageNamed:@"Continous.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
