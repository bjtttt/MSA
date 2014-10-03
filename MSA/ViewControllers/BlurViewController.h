//
//  BlurViewController.h
//  MSA
//
//  Created by guozhitao on 10/2/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class ContainerViewController;

@interface BlurViewController : UIViewController

@property (weak, nonatomic) IBOutlet ContainerViewController *mainCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@property (weak, nonatomic) IBOutlet UIImageView *blurImage;

@end
