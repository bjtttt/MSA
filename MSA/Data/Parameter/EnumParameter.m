//
//  EnumParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumParameter.h"
#import "ShareSettings.h"
//#import "Parameter.h"

@interface EnumParameter()

@end

@implementation EnumParameter

- (id) init
{
    NSAssert(YES == NO, @"EnumParameter can only use initWithEnum");
    
    if(self = [super init])
    {
        //self.valueType = VAL_ENUM;
        //self.value = nil;
        //self.valuePrevious = nil;
    }
    
    return self;
}

-(void)setValue:(id)value
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
