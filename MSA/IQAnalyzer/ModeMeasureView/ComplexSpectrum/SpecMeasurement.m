//
//  SpecMeasurement.m
//  MSA
//
//  Created by GUO Zhitao on 28/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecMeasurement.h"

@interface SpecMeasurement()

@end

@implementation SpecMeasurement

-(id) init {
    if ((self = [super init]))
    {
        self.measureName = [[NSMutableString alloc] initWithString:@"ComplexSpectrum"];
    }
    
    return self;
}

-(void)initMeasureBarMenu
{
}

-(void)initMeasureSoftMenu
{
}

-(void)initMeasureView
{
}

@end
