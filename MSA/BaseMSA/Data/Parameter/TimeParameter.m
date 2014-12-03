//
//  TimeParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface TimeParameter()

@end

@implementation TimeParameter

-(id)init
{
    [NSException raise:@"TimeParameter::init" format:@"Call TimeParameter::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_TIME;
        self.unit = @"s";
    }
    
    return self;
}

@end
