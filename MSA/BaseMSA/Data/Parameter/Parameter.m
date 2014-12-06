//
//  Parameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parameter.h"

@interface Parameter()

@end

@implementation Parameter

-(instancetype) init {
    
    [NSException raise:@"Parameter::init" format:@"Call Parameter::initWithConfig: instead"];
    
    return nil;
}

- (instancetype) initWithConfig:(ShareSettings *)ss
{
    if(self = [super init])
    {
        _shareSettings = ss;
        _valueType = VAL_NONE;
    }
    
    return self;
}

@end
