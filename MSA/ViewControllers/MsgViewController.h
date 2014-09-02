//
//  MsgViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface MsgViewController : UIViewController

@property (strong, nonatomic) ShareSettings * shareSettings;

- (IBAction)hideMsg:(id)sender;

@end

