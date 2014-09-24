//
//  SystemDetailContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureContainerViewController.h"
#import "AddInstrumentContainerViewController.h"
#import "MeasureSelectNavigationViewController.h"

@interface MeasureContainerViewController()

@end

@implementation MeasureContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToAddInstrumentCVC"])
    {
        self.addInstrumentCVC = (AddInstrumentContainerViewController *)segue.destinationViewController;
        self.addInstrumentCVC.shareSettings = self.shareSettings;
        self.addInstrumentCVC.measureCVC = self;
        
        self.addInstrumentCVC.frameWidth = self.frameWidth;
        self.addInstrumentCVC.frameHeight = ADDINSTRUMENT_HEIGHT;
    }
    if([segue.identifier isEqualToString:@"embedSegueToMeasureSelectNVC"])
    {
        self.measureSelectNVC = (MeasureSelectNavigationViewController *)segue.destinationViewController;
        self.measureSelectNVC.shareSettings = self.shareSettings;
        self.measureSelectNVC.measureCVC = self;
        
        self.measureSelectNVC.frameWidth = self.frameWidth;
        self.measureSelectNVC.frameHeight = self.frameHeight-ADDINSTRUMENT_HEIGHT-NAVBAR_HEIGHT*3;
    }
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //self.measureV.frame = CGRectMake(0, VC_MARGIN, self.frameWidth, self.frameHeight-VC_MARGIN);
}

#pragma mark - Split view

- (IBAction)addInstrument:(id)sender {
}

- (IBAction)okMeasure:(id)sender {
}

- (IBAction)cancelMeasure:(id)sender {
}
@end
