//
//  ImmediateParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FrequencyParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface FrequencyParameter()

@end

@implementation FrequencyParameter

-(id)init
{
    [NSException raise:@"FrequencyParameter::init" format:@"Call FrequencyParameter::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_FREQ;
        self.unit = @"Hz";
    }
    
    return self;
}

@end
