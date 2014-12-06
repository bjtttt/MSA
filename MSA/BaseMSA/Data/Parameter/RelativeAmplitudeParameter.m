//
//  RelativeAmplitudeParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RelativeAmplitudeParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface RelativeAmplitudeParameter()

@end

@implementation RelativeAmplitudeParameter

-(instancetype)init
{
    [NSException raise:@"RelativeAmplitudeParameter::init" format:@"Call RelativeAmplitudeParameter::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_RELAMP;
        self.unit = @"dB";
    }
    
    return self;
}

@end
