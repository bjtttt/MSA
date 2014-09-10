//
//  MsgDetailContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgDetailTableViewController.h"
#import "ShareSettings.h"

@class MsgDetailContainerViewController;

@interface MsgDetailContainerViewController: UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *msgNavBar;
@property (weak, nonatomic) IBOutlet UIView *msgV;

@property (weak, nonatomic) IBOutlet MsgDetailTableViewController *msgDetailTVC;

@property (nonatomic) double navBarHeight;
@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@end
