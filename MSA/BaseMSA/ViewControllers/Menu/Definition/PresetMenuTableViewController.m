//
//  PresetMenuTableViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresetMenuTableViewController.h"
#import "PresetMenuContainerViewController.h"
#import "PresetMenuWhiteGreenTableViewCell.h"
#import "PresetMenuGreenWhiteTableViewCell.h"
#import "PresetMenuDarkGrayGreen2LinesTableViewCell.h"
#import "PresetMenuDarkGrayWhiteTableViewCell.h"
#import "MenuContainerViewController.h"

@interface PresetMenuTableViewController()

@end

@implementation PresetMenuTableViewController

static NSString *presetMenuCellTable_Green_White_Id = @"PresetMenuTVC_Green_White";
static NSString *presetMenuCellTable_DarkGray_Green_2Lines_Id = @"PresetMenuTVC_DarkGray_Green_2Lines";
static NSString *presetMenuCellTable_DarkGray_White_Id = @"PresetMenuTVC_DarkGray_White";
static NSString *presetMenuCellTable_White_Green_Id = @"PresetMenuTVC_White_Green";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MSAList" ofType:@"plist"];
    NSDictionary *msaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.preset = msaInfo[@"preset"];//[0];
    //self.presetUser = [msaInfo objectForKey:@"preset"][1];
    //self.presetAllModes = [msaInfo objectForKey:@"preset"][2];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];

    self.view.backgroundColor = [UIColor colorWithRed:29.0f/255.0f green:173.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
    
    NSLog(@"\nPresetMenu Table View Controller - viewDidLoad:\nx = %f\ny = %f\nwidth = %f\nheight = %f",
          self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}

//-(void) setCurrentStatus:(MSGType)currentSystem{
//    self.title = self.systems[currentSystem];
//}

-(void)viewWillLayoutSubviews {
    //NSLog(@"PresetMenuTableViewController - viewWillLayoutSubviews");

    [super viewWillLayoutSubviews];
    
    //self.frameWidth=self.view.frame.size.width;
    //self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.frameWidth, self.frameHeight);
    
    //NSLog(@"\nPresetMenu Table View Controller - viewDidAppear:\nx = %f\ny = %f\nwidth = %f\nheight = %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
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
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *string = self.preset[section][row];

    UITableViewCell *cell;
    
    //NSUInteger section = [indexPath section];
    //NSUInteger row = [indexPath row];
    
    switch(section)
    {
        default:
        case 0:
            switch(row)
            {
                default:
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTable_Green_White_Id forIndexPath:indexPath];
                    ((PresetMenuGreenWhiteTableViewCell *)cell).content.text = string;
                    //[((PresetMenuGreenWhiteTableViewCell *)cell).content sizeToFit];
                    break;
                case 1:
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTable_DarkGray_Green_2Lines_Id forIndexPath:indexPath];
                    NSArray * stringArray = [string componentsSeparatedByString:@"\\n"];
                    ((PresetMenuDarkGrayGreen2LinesTableViewCell *)cell).content1.text = stringArray[0];
                    ((PresetMenuDarkGrayGreen2LinesTableViewCell *)cell).content2.text = stringArray[1];
                    break;
            }
            break;
        case 1:
            switch(row)
            {
                default:
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTable_White_Green_Id forIndexPath:indexPath];
                    ((PresetMenuWhiteGreenTableViewCell *)cell).content.text = string;
                    break;
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTable_DarkGray_White_Id forIndexPath:indexPath];
                    ((PresetMenuDarkGrayWhiteTableViewCell *)cell).content.text = string;
                   break;
            }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:presetMenuCellTable_DarkGray_Green_2Lines_Id forIndexPath:indexPath];
            NSArray * stringArray = [string componentsSeparatedByString:@"\\n"];
            ((PresetMenuDarkGrayGreen2LinesTableViewCell *)cell).content1.text = stringArray[0];
            ((PresetMenuDarkGrayGreen2LinesTableViewCell *)cell).content2.text = stringArray[1];
            break;
    }

    //cell.contentView.layer.cornerRadius = 10.0;
    cell.contentView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    cell.contentView.layer.borderWidth = 1.0;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.presetMenuCVC.menuCVC.presetViewVisible = !self.presetMenuCVC.menuCVC.presetViewVisible;
    [self.presetMenuCVC.menuCVC showHidePresetMenu:self.presetMenuCVC.menuCVC.presetViewVisible animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

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
    return 44;
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
