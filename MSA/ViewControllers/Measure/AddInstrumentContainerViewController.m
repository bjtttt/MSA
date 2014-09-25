//
//  AddInstrumentContainerViewController.m
//  MSA
//
//  Created by guozhitao on 9/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddInstrumentContainerViewController.h"

@interface AddInstrumentContainerViewController()

@end

@implementation AddInstrumentContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.instrumentOnOff.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.instrumentOnOff.on = NO;
}


-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - Split view

- (IBAction)instrumentOnOffChanged:(id)sender {
    if(self.instrumentOnOff.on == YES)
    {
        NSString *instrument = self.instrumentAddress.text;
        NSString *instrumentTrimmed = [instrument stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if(instrumentTrimmed.length < 1)
        {
            // This assignment won't trig this event again.
            self.instrumentOnOff.on = NO;

            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Connect Error"
                                      message:@"No instruement hostname or IP address!"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
            [alertView show];
        }
        else
        {
        }
    }
    else
    {
    }
}

@end
