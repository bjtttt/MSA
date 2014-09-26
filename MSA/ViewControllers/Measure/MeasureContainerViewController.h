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
@class MeasureSelectNavigationViewController;
@class ContainerViewController;

@interface MeasureContainerViewController: UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *addInstrumentNavBar;
@property (weak, nonatomic) IBOutlet UIView *addInstrumentV;
@property (weak, nonatomic) IBOutlet UIView *measureSelectV;
@property (weak, nonatomic) IBOutlet UIToolbar *measureToolBar;

@property (weak, nonatomic) IBOutlet UIButton *addInstrumentButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet AddInstrumentContainerViewController *addInstrumentCVC;
@property (weak, nonatomic) IBOutlet MeasureSelectNavigationViewController *measureSelectNVC;
@property (weak, nonatomic) IBOutlet ContainerViewController *mainCVC;

@property (nonatomic) double frameWidth;
@property (nonatomic) double frameHeight;

@property (weak, nonatomic) ShareSettings *shareSettings;

- (IBAction)addInstrument:(id)sender;
- (IBAction)okMeasure:(id)sender;
- (IBAction)cancelMeasure:(id)sender;

@end
