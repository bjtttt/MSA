//
//  MsgContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface MsgContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *msgNavBar;
@property (weak, nonatomic) IBOutlet UIView *msgV;

@property (strong, nonatomic) ShareSettings * shareSettings;

@property (nonatomic) double navBarHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

- (IBAction)hideMsg:(id)sender;
- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@end

