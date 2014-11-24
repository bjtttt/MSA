//
//  StringParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringParameter.h"

@interface StringParameter()

@end

@implementation StringParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_STRING;
    }
    
    return self;
}

@end
