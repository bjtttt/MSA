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

@interface Bar0TableViewController()

@end

@implementation Bar0TableViewController

static NSString *barMenuTVC_Single_Continous_Id = @"barMenuTVC_Single_Continous";
static NSString *barMenuTVC_One_Line_Id = @"barMenuTVC_One_Line";

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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:barMenuTVC_Single_Continous_Id forIndexPath:indexPath];
    [((Bar0SingleContinousTableViewCell *)cell).singleContinousImgV setImage:[UIImage imageNamed:@"Continous.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.shareSettings.barTappedIndex = 0;
    self.shareSettings.barTapped = !self.shareSettings.barTapped;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"barTapped" object:nil];
}

#pragma mark - Split view

@end
