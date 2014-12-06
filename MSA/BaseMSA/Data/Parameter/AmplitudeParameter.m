//
//  AmplitudeParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AmplitudeParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface AmplitudeParameter()

@end

@implementation AmplitudeParameter

-(instancetype)init
{
    [NSException raise:@"AmplitudeParameter::init" format:@"Call AmplitudeParameter::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_AMP;
        self.unit = @"dBm";
    }
    
    return self;
}

@end
