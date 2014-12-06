//
//  InputViewController.h
//  MSA
//
//  Created by guozhitao on 10/2/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;
@class MainContainerViewController;

@interface InputViewController : UIViewController

@property (weak, nonatomic) IBOutlet MainContainerViewController *mainCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
