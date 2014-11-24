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

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_FREQ;
    }
    
    return self;
}

@end
