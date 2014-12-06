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
#import "ViewBase.h"

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
    return [_views count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    NSInteger row = [indexPath row];
    NSArray *keys = [[_views allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    ViewBase *view = _views[keys[row]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:measureSelectCell2ndTable_Id forIndexPath:indexPath];
    cell.textLabel.text = view.viewName;
    
    return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    UIKeyView *view = (self.views)[row];
    if(view.enabled == NO)
    {
        NSMutableString *msg = [[NSMutableString alloc] init];
        [msg appendString:view.name];
        [msg appendString:@" is not available!"];
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"View Selection Error"
                                  message:(NSString *)msg
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
}
*/

@end
