//
//  AddInstrumentContainerViewController.h
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareSettings.h"

@class MeasureContainerViewController;

@interface AddInstrumentContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UITextField *instrumentAddress;
@property (weak, nonatomic) IBOutlet UILabel *instrumentStatus;
@property (weak, nonatomic) IBOutlet UISwitch *instrumentOnOff;

@property (weak, nonatomic) IBOutlet MeasureContainerViewController *measureCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

- (IBAction)instrumentOnOffChanged:(id)sender;

@end
