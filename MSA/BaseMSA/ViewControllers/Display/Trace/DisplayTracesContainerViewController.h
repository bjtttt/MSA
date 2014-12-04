//
//  DisplayTracesContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class DisplayContainerViewController;

@interface DisplayTracesContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet DisplayContainerViewController *displayCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (strong, nonatomic) ShareSettings * shareSettings;

@end

