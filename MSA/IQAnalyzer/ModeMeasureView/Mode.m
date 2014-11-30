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

-(id) init {
    if ((self = [super init]))
    {
        self.modeName = [@"IQ Analyzer" mutableCopy];
        self.specMeas = [[SpecMeasurement alloc] init];
    }
    
    return self;
}

-(void)initMode
{
}

-(void)initMeasurement
{
    [self.specMeas initMeasureSoftMenu];
}

@end