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

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_TIME;
        self.unit = @"s";
    }
    
    return self;
}

@end
