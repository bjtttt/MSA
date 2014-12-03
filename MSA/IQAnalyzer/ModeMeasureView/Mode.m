//
//  Mode.m
//  MSA
//
//  Created by GUO Zhitao on 28/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mode.h"
#import "MeasureBase.h"
#import "SpecMeasurement.h"

@interface Mode()

@end

@implementation Mode

-(id)init
{
    [NSException raise:@"Mode::init" format:@"Call Mode::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.modeName = @"IQ Analyzer";
        _specMeas = [[SpecMeasurement alloc] initWithConfig:ss];
    }
    
    return self;
}

-(void)initMode
{
}

-(void)initMeasurement
{
    _specMeas.shareSettings = self.shareSettings;
    [_specMeas initMeasureSoftMenu];
}

@end