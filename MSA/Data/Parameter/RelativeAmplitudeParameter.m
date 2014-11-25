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

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_RELAMP;
        self.unit = [[NSMutableString alloc] initWithString:@"dB"];
    }
    
    return self;
}

@end
