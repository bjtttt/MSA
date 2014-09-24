//
//  MeasureContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class AddInstrumentContainerViewController;
@class MeasureSelectContainerViewController;

@interface MeasureContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *addInstrumentNavBar;
@property (weak, nonatomic) IBOutlet UIView *addInstrumentV;
@property (weak, nonatomic) IBOutlet UINavigationBar *measureSelectNavBar;
@property (weak, nonatomic) IBOutlet UIView *measureSelectV;
@property (weak, nonatomic) IBOutlet UIToolbar *measureToolBar;

@property (weak, nonatomic) IBOutlet AddInstrumentContainerViewController *addInstrumentCVC;
@property (weak, nonatomic) IBOutlet MeasureSelectContainerViewController *measureSelectCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

@end
