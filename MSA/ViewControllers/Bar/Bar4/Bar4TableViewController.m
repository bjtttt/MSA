//
//  Bar4TableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar4TableViewController.h"

@interface Bar4TableViewController()

@end

@implementation Bar4TableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    //NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    //self.systems = [msaInfo objectForKey:@"systems"];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.shareSettings.barTappedIndex = 4;
    self.shareSettings.barTapped = !self.shareSettings.barTapped;
}

#pragma mark - Split view

@end
