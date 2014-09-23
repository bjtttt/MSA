//
//  MenuContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class PresetMenuContainerViewController;
@class SoftMenuContainerViewController;
@class ContainerViewController;

@interface MenuContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *presetMenuV;
@property (weak, nonatomic) IBOutlet UIView *softMenuV;
@property (weak, nonatomic) IBOutlet UINavigationBar *menuNavBar;

@property (weak, nonatomic) IBOutlet PresetMenuContainerViewController *presetMenuCVC;
@property (weak, nonatomic) IBOutlet SoftMenuContainerViewController *softMenuCVC;
@property (weak, nonatomic) IBOutlet ContainerViewController *mainCVC;

- (IBAction)showPresetMenu:(id)sender;
- (void)showHidePresetMenu:(BOOL)showPresetMenu;

@property (nonatomic) double navBarHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end

