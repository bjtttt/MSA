//
//  SoftMenuNumericBooleanTableViewCell.h
//  MSA
//
//  Created by GUO Zhitao on 22/09/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface SoftMenuNumericBooleanTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *content1;
@property (weak, nonatomic) IBOutlet UISwitch *state;

@end