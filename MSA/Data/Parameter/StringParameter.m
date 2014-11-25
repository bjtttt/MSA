//
//  StringParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface StringParameter()

@end

@implementation StringParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_STRING;
        self.valueChanged = nil;
        self.valueChanging = nil;
        self.valueTouching = nil;
    }
    
    return self;
}

-(void)setValue:(NSMutableString *)value
{
    if(self.value == self.valuePrevious)
    {
        if(self.valueTouching != nil)
            [self valueTouching];
    }
    else
    {
        if(self.valueChanging != nil)
            [self valueChanging];
        
        self.valuePrevious = self.value;
        self.value = value;
        
        if(self.valueChanged != nil)
            [self valueChanged];
    }
}

@end
