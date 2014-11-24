//
//  IntParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntParameter.h"
#import "ShareSettings.h"
//#import "Parameter.h"

@interface IntParameter()

@end

@implementation IntParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_INT;
    }
    
    return self;
}

-(void)setValue:(long)value
{
    if(self.value == self.valuePrevious)
    {
        [self valueTouching];
    }
    else
    {
        [self valueChanging];
        
        self.valuePrevious = self.value;
        self.value = value;
        
        [self valueChanged];
    }
}

@end
