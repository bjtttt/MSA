//
//  DisplaySettingsContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface DisplaySettingsContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *bar0V;
@property (weak, nonatomic) IBOutlet UIView *bar1V;
@property (weak, nonatomic) IBOutlet UIView *bar2V;
@property (weak, nonatomic) IBOutlet UIView *bar3V;
@property (weak, nonatomic) IBOutlet UIView *bar4V;
@property (weak, nonatomic) IBOutlet UIView *bar5V;
@property (weak, nonatomic) IBOutlet UIView *bar6V;
@property (weak, nonatomic) IBOutlet UIView *bar7V;

@property (strong, nonatomic) ShareSettings * shareSettings;

@end

