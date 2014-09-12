//
//  MenuContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@interface MenuContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *presetMenuV;
@property (weak, nonatomic) IBOutlet UIView *softMenuV;
@property (weak, nonatomic) IBOutlet UINavigationBar *menuNavBar;

- (IBAction)showPresetMenu:(id)sender;

@property (nonatomic) double navBarHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@end

