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

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_AMP;
    }
    
    return self;
}

@end
