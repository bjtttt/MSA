//
//  MeasureSelect2ndTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureSelectTableViewController.h"
#import "MeasureSelect2ndTableViewController.h"
#import "UIKeyView.h"

@interface MeasureSelect2ndTableViewController()

@end

@implementation MeasureSelect2ndTableViewController

static NSString *measureSelectCell2ndTable_Id = @"measureSelectCell2ndTable";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

#pragma mark - Table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.views count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    NSInteger row = [indexPath row];
    UIKeyView *view = [self.views objectAtIndex:row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:measureSelectCell2ndTable_Id forIndexPath:indexPath];
    if(view.enabled == YES)
        [cell.textLabel setTextColor:[UIColor blackColor]];
    else
        [cell.textLabel setTextColor:[UIColor lightGrayColor]];
    
    cell.textLabel.text = view.name;
    
    return cell;
}

@end
